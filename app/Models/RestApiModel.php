<?php

namespace App\Models;

use CodeIgniter\Database\SQLite3\Table;
use CodeIgniter\Model;

class RestApiModel extends Model
{
    public function addUsers($data)
    {
        $dataUser = $this->db->table('user_app')->where('id_bet', $data['id_bet'])
            ->orWhere('email', $data['email'])
            ->orWhere('no_phone', $data['no_phone'])
            ->get()->getRowArray();
        if (!$dataUser) {
            $this->db->table('user_app')->insert($data);
            $pesan = [
                'stts' => true,
                'msg' => "data telah terdaftar...!",
            ];
        } elseif ($dataUser['id_bet'] == $data['id_bet']) {
            $pesan = [
                'stts' => false,
                'msg' => "data id bet sudah terdaftar...!",
            ];
        } elseif ($dataUser['email'] == $data['email']) {
            $pesan = [
                'stts' => false,
                'msg' => "data email sudah terdaftar...!",
            ];
        } elseif ($dataUser['no_phone'] == $data['no_phone']) {
            $pesan = [
                'stts' => false,
                'msg' => "data number phone sudah terdaftar...!",
            ];
        }
        return $pesan;
    }

    public function loginUsers($email, $password)
    {
        $dataUser = $this->db->table('user_app')->where(['email' => $email])->get()->getRowArray();
        if ($dataUser) {
            if ($dataUser['enable_login'] == 1) {
                if (password_verify($password, $dataUser['password'])) {
                    $pesan = [
                        'stts' => true,
                        'msg' => "Berhasil login...!",
                        'key' => $this->getKey($dataUser['id']),
                        'data' => $dataUser
                    ];
                } else {
                    $pesan = [
                        'stts' => false,
                        'msg' => "password salah...!",
                    ];
                }
            } else {
                $pesan = [
                    'stts' => false,
                    'msg' => "OPS..!, \n akses anda mungkin sudah di blok...!",
                ];
            }
        } else {
            $pesan = [
                'stts' => false,
                'msg' => "email tidak terdaftar di aplikasi...!",
            ];
        }
        return $pesan;
    }

    public function list_report($token, $id, $tgl = null)
    {

        $getStts = $this->cekToken($token, $id);
        if ($getStts['stts'] == true) {
            if ($tgl) {
                $pesan = [
                    'stts' => true,
                    'msg' => "data List report tgl = $tgl...!",
                    'data' => $this->db->table('list_patrol')->where(['id_user' => $id, 'tgl' => $tgl])->orderBy('tgl', 'DESC')->get()->getResultArray(),
                ];
            } else {
                $pesan = [
                    'stts' => true,
                    'msg' => "data List report...!",
                    'data' => $this->db->table('list_patrol')->where('id_user', $id)->orderBy('tgl', 'DESC')->get()->getResultArray(),
                ];
            }

            return $pesan;
        } else {
            return $getStts;
        }
    }

    public function list_location($token, $id, $log)
    {
        $getStts = $this->cekToken($token, $id);
        if ($getStts['stts'] == true) {
            $pesan = [
                'stts' => true,
                'msg' => "data List report...!",
                'data' => $this->db->table('mas_qr_location')
                    ->orderBy('lot', 'ASC')
                    ->get()->getResultArray(),
            ];
            return $pesan;
        } else {
            return $getStts;
        }
    }

    public function add_patrol($token, $id, $data)
    {
        $getStts = $this->cekToken($token, $id);
        if ($getStts['stts'] == true) {
            $cek  = $this->db->table('mas_qr_location')->where(['qr' => $data['qr_code']])->get()->getRowArray();
            if ($cek != null) {
                $this->db->table('list_patrol')->insert($data);
                $pesan = [
                    'stts' => true,
                    'msg' => "data telah di rekap",
                ];
            } else {
                $pesan = [
                    'stts' => false,
                    'msg' => "data telah salah",
                ];
            }
            return $pesan;
        } else {
            return $getStts;
        }
    }

    public function list_visitor($token, $id, $stts, $tgl = null)
    {
        $getStts = $this->cekToken($token, $id);
        if ($getStts['stts'] == true) {
            if ($tgl) {
                $pesan = [
                    'stts' => true,
                    'msg' => "data List report...!",
                    'data' => $this->db->table('list_visitor')
                        // ->where("jadwal BETWEEN '$tgl-01 00:00:01' AND '$tgl-31 23:59:59'")
                        ->where(["id_user" => $stts])
                        ->get()->getResultArray(),
                ];
            } else {
                $pesan = [
                    'stts' => true,
                    'msg' => "data List report...!",
                    'data' => $this->db->table('list_visitor')->where(['id_user' => $stts])->get()->getResultArray(),
                ];
            }

            return $pesan;
        } else {
            return $getStts;
        }
    }


    public function scan_visitor($token, $id, $qr_code, $stts)
    {
        $getStts = $this->cekToken($token, $id);
        if ($getStts['stts'] == true) {
            $cek_data = $this->db->table('list_visitor')->where(['qr_code' => $qr_code])->get()->getRowArray();
            if ($cek_data == null) {
                $pesan = [
                    'stts' => false,
                    'msg' => "anda belum terdaftar...!",
                ];
            } else {
                $tgl_cek = explode(" ", $cek_data['jadwal']);
                if ($tgl_cek[0] == date('Y-m-d')) {
                    if ($stts == 'masuk') {
                        if ($cek_data['masuk'] != null) {
                            $pesan = [
                                'stts' => false,
                                'msg' => "sesi telah di selesai kan...!",
                            ];
                        } else {
                            $this->db->table('list_visitor')->where(['qr_code' => $qr_code])->update(['masuk' => time(), 'id_user' => 'berjalan']);
                            $pesan = [
                                'stts' => true,
                                'msg' => "scan berhasil...!",
                            ];
                        }
                    } elseif ($stts == 'keluar') {
                        if ($cek_data['keluar'] != null) {
                            $pesan = [
                                'stts' => false,
                                'msg' => "sesi telah di selesaikan...!",
                            ];
                        } else {
                            $this->db->table('list_visitor')->where(['qr_code' => $qr_code])->update(['keluar' => time(), 'id_user' => 'selesai']);
                            $pesan = [
                                'stts' => true,
                                'msg' => "sesi telah di selesai kan...!",
                            ];
                        }
                    }
                    return $pesan;
                } else {
                    return [
                        'stts' => false,
                        'msg' => "sesi telah di offkan...! " . $tgl_cek[0] . " >< " . date('Y-m-d'),
                    ];
                }
            }
        } else {
            return $getStts;
        }
    }

    public function getHistory($token, $id, $tgl, $bulan, $tahun)
    {
        $getStts = $this->cekToken($token, $id);
        if ($getStts['stts'] == true) {
            $pesan = [
                'stts' => true,
                'msg' => "data List patrol...!",
                'data' => $this->db->table('list_patrol')
                    ->select('list_patrol.*, user_app.name, user_app.id_bet, user_app.no_phone')
                    ->join('user_app', 'user_app.id = list_patrol.id_user')
                    ->where("month(list_patrol.tgl) = $bulan AND year(list_patrol.tgl)= $tahun AND DAY(list_patrol.tgl) =$tgl AND list_patrol.id_user =$id")->get()->getResultArray(),
            ];
            return $pesan;
        } else {
            return $getStts;
        }
    }


    public function cek_izin($token, $id, $bet, $stts, $dari = null, $menuju = null)
    {
        $cekUser = $this->db->table('user_app')->where(['id_bet' => $bet])->get()->getRowArray();

        $getStts = $this->cekToken($token, $id);
        if ($cekUser) {


            if ($getStts['stts'] == true) {
                $filter = date("Y-m-d");
                $data = $this->db->table('mas_user_scan')
                    ->select('mas_user_scan.*, user_app.name ')
                    ->join('user_app', "user_app.id_bet = mas_user_scan.id_bet")
                    ->where(['user_app.id_bet' => $bet, 'mas_user_scan.date' =>  $filter])
                    ->orderBy('mas_user_scan.id', 'DESC')->get()->getRowArray();

                if (!$data) {
                    if ($stts == "masuk") {
                        return  [
                            'stts' => false,
                            'msg' => "ada tidak dapat masuk, izin keluar belum ada...!",
                        ];
                    } elseif ($stts == "keluar") {
                        $this->db->table('mas_user_scan')->insert(['id_bet' => $bet, 'w_keluar' => time(), 'dari' => 'lot1', 'menuju' => 'lot 6', 'date' => $filter]);
                        return  [
                            'stts' => true,
                            'msg' => "Izin diberikan!",
                        ];
                    } else {
                        return  [
                            'stts' => false,
                            'msg' => "ada tidak bisa melakukan ini...!",
                        ];
                    }
                } else {

                    if ($data['w_masuk']) {
                        if ($stts == "masuk") {
                            return  [
                                'stts' => false,
                                'msg' => "ada tidak dapat masuk, izin keluar belum ada...!",
                            ];
                        } elseif ($stts == "keluar") {
                            $this->db->table('mas_user_scan')->insert(['id_bet' => $bet, 'w_keluar' => time(), 'dari' => $dari, 'menuju' => $menuju, 'date' => $filter]);
                            return  [
                                'stts' => true,
                                'msg' => "Izin diberikan!",
                            ];
                        } else {
                            return  [
                                'stts' => false,
                                'msg' => "ada tidak bisa melakukan ini...!",
                            ];
                        }
                    } else {
                        if ($stts == "masuk") {
                            $this->db->table('mas_user_scan')->where(['id' => $data['id']])->update(['w_masuk' => time()]);
                            return [
                                'stts' => true,
                                'msg' => "Telah masuk kembali...!",
                            ];
                        } elseif ($stts == "keluar") {
                            return  [
                                'stts' => false,
                                'msg' => "ada tidak dapat keluar, izin sebelumnya belum di selesaikan...!",
                            ];
                        }
                    }
                }
            } else {
                return $getStts;
            }
        } else {
            return  [
                'stts' => false,
                'msg' => "user tidak terdaftar...!",
            ];
        }
    }


    public function editPassword($token, $id, $old_pass, $new_pass)
    {
        $getStts = $this->cekToken($token, $id);
        if ($getStts['stts'] == true) {
            $data = $this->db->table('user_app')->where(['id' => $id])->get()->getRowArray();
            if (password_verify($old_pass, $data['password'])) {

                $this->db->table('user_app')
                    ->where(['id' => $data['id']])
                    ->update(['password' => password_hash($new_pass, PASSWORD_DEFAULT)]);
                return [
                    'stts' => true,
                    'msg' => "Berhasil Di Ubah...!",
                ];
            } else {
                return [
                    'stts' => false,
                    'msg' => "Old password salah...!",
                ];
            }
        } else {
            return $getStts;
        }
    }

    public function userLocation($token, $id, $lat, $long)
    {
        $getStts = $this->cekToken($token, $id);
        if ($getStts['stts'] == true) {
            $this->db->table('mas_user_location')->insert(['id_user' => $id, 'lat' => $lat, 'long' => $long, 'date' => time()]);
        } else {
            return $getStts;
        }
    }

    public function getShift($token, $id)
    {
        $getStts = $this->cekToken($token, $id);
        if ($getStts['stts'] == true) {
            $pesan = [
                'stts' => true,
                'msg' => "data list shift...!",
                'data' => $this->db->table('mas_shift')->get()->getResultArray()
            ];
            return $pesan;
        } else {
            return $getStts;
        }
    }
    public function userLate($token, $id, $id_bet, $id_shift, $stts, $alasan)
    {
        $tahun = date('Y');
        $bulan = date('m');
        $tgl = date('d');

        $getStts = $this->cekToken($token, $id);
        if ($getStts['stts'] == true) {
            $cek = $this->db->table('mas_late_user')->where("mas_late_user.id_bet = '$id_bet' AND YEAR(mas_late_user.date) = '$tahun' AND DAY(mas_late_user.date) = '$tgl' AND MONTH(mas_late_user.date) ='$bulan' AND mas_late_user.stts = $stts")->get()->getRowArray();
            $cek_shift = $this->db->table('mas_shift')->where(['id' => $id_shift])->get()->getRowArray();
            $masuk = date("H:i", strtotime($stts == 1 ? $cek_shift['masuk'] : $cek_shift['s_rest']));
            $datang = date("H:i");
            $datang_split = explode(":", $datang);
            $masuk_split = explode(":", $masuk);
            $jam = $datang_split[0] - $masuk_split[0];
            $menit = $datang_split[1] - $masuk_split[1];
            if ($jam >= 0 && $menit > 0) {
                if ($cek) {
                    $pesan = [
                        'stts' => false,
                        'msg' => "data telah di rekap...!",
                    ];
                } else {
                    $cek_user = $cek = $this->db->table('user_app')->where(['user_app.id_bet' => $id_bet])->get()->getRowArray();
                    if ($cek_user) {
                        $this->db->table('mas_late_user')->insert(['id_bet' => $id_bet, 'id_shift' => $id_shift, 'stts' => $stts, 'alasan' => $alasan, 'date' => date('Y-m-d H:i:s'), 'time' => time()]);
                        $pesan = [
                            'stts' => true,
                            'msg' => "data oke, user terlambat $jam jam $menit menit...!",
                        ];
                    } else {
                        $pesan = [
                            'stts' => false,
                            'msg' => "data belum terdaftar...!",
                        ];
                    }
                }
            } else {
                $pesan = [
                    'stts' => false,
                    'msg' => "Mohon cek kembali mungkin terjadi kesalahan waktu...!",
                ];
            }

            return $pesan;
        } else {
            return $getStts;
        }
    }


    public function getDevisi()
    {
        $data = $this->db->table('tblweb_privilege')->get()->getResultArray();

        $list = [];

        foreach ($data as $d) {
            array_push($list, $d['privilege_name']);
        }
        return $list;
    }

    public function getLateUser($token, $id, $user = 'all', $date = 'all')
    {
        $getStts = $this->cekToken($token, $id);
        if ($getStts['stts'] == true) {
            if ($user == 'all' && $date == 'all') {
                $data = $this->db->table('mas_late_user')->select("mas_late_user.*, user_app.name, mas_shift.shift, mas_shift.masuk, mas_shift.s_rest")
                    ->join('mas_shift', 'mas_shift.id = mas_late_user.id_shift')->join('user_app', 'user_app.id_bet = mas_late_user.id_bet')
                    ->get()->getResultArray();
            } elseif ($user && $date == 'all') {
                $data = $this->db->table('mas_late_user')->select("mas_late_user.*, user_app.name, mas_shift.shift, mas_shift.masuk, mas_shift.s_rest")
                    ->join('mas_shift', 'mas_shift.id = mas_late_user.id_shift')->join('user_app', 'user_app.id_bet = mas_late_user.id_bet')
                    ->where(['mas_late_user.id_bet' => $user])
                    ->get()->getResultArray();
            } elseif ($user == 'all' && $date) {
                $tgl = explode("-", $date);
                $tahun = $tgl[0];
                $bulan = $tgl[1];
                $hari = $tgl[2];
                $data = $this->db->table('mas_late_user')->select("mas_late_user.*, user_app.name, mas_shift.shift, mas_shift.masuk, mas_shift.s_rest ")
                    ->join('mas_shift', 'mas_shift.id = mas_late_user.id_shift')->join('user_app', 'user_app.id_bet = mas_late_user.id_bet')
                    ->where(" YEAR(mas_late_user.date) = '$tahun' AND MONTH(mas_late_user.date) ='$bulan' AND DAY(mas_late_user.date) = '$hari'")
                    ->get()->getResultArray();
            } elseif ($user && $date) {
                $tgl = explode("-", $date);
                $tahun = $tgl[0];
                $bulan = $tgl[1];
                $hari = $tgl[2];
                $data = $this->db->table('mas_late_user')->select("mas_late_user.*, user_app.name, mas_shift.shift, mas_shift.masuk, mas_shift.s_rest")
                    ->join('mas_shift', 'mas_shift.id = mas_late_user.id_shift')->join('user_app', 'user_app.id_bet = mas_late_user.id_bet')
                    ->where("mas_late_user.id_bet = '$user' AND YEAR(mas_late_user.date) = '$tahun' AND MONTH(mas_late_user.date) ='$bulan' AND DAY(mas_late_user.date) = '$hari'")
                    ->get()->getResultArray();
            }

            $list = [];

            foreach ($data as $d) {
                $datang = date("H:i", strtotime($d['date']));
                $masuk = date("H:i", strtotime($d['stts'] == 1 ? $d['masuk'] : $d['s_rest']));
                $datang_split = explode(":", $datang);
                $masuk_split = explode(":", $masuk);

                $jam = $datang_split[0] - $masuk_split[0];
                $menit = $datang_split[1] - $masuk_split[1];
                array_push($list, ['date' => $d['date'], 'shift' => $d['shift'], 'masuk' => $d['stts'] == 1 ? $d['masuk'] : $d['s_rest'], 'terlambat' => "$jam Jam $menit Menit", 'stts' => $d['stts']]);
            }
            $pesan = [
                'stts' => true,
                'msg' => "data User Late...!",
                'data' => $list
            ];

            return $pesan;
        } else {
            return $getStts;
        }
    }

    public function cekUserApp($token, $id, $id_bet)
    {
        $getStts = $this->cekToken($token, $id);
        if ($getStts['stts'] == true) {
            $data =  $this->db->table('user_app')->where(['id_bet' => $id_bet])->get()->getRowArray();
            if ($data) {
                $pesan = [
                    'stts' => true,
                    'msg' => "data User Apps...!",
                    'data' => $data
                ];
            } else {
                $pesan = [
                    'stts' => false,
                    'msg' => "data User Apps Kosong...!",
                ];
            }
            return $pesan;
        } else {
            return $getStts;
        }
    }


    public function saveDataGagalFinger($token, $id, $send)
    {
        $getStts = $this->cekToken($token, $id);
        if ($getStts['stts'] == true) {
            $this->db->table('mas_failed_for_finger')->insert($send);
            return [
                'stts' => true,
                'msg' => "data telah di simpan...!",
            ];
        } else {
            return $getStts;
        }
    }















































    public function cekTokenUser($token)
    {
        $key = $this->db->table('user_token')->where(['token' => $token])->get()->getRowArray();
        if ($key) {
            $selisih = time() - $key['exp'];
            if ($selisih < 43200) {
                return  [
                    'stts' => true,
                    'msg' => "token oke...!",
                ];
            } else {
                return  [
                    'stts' => false,
                    'msg' => "status login anda sudah kadaluarsa, mohon login kembali...!",
                ];
            }
        } else {
            return  [
                'stts' => false,
                'msg' => "key blum terdaftar...!",
            ];
        }
    }



    private function cekToken($token, $id = null)
    {
        $key = $this->db->table('user_token')->where(['token' => $token])->get()->getRowArray();
        if ($key) {
            $selisih = time() - $key['exp'];
            if ($selisih < 43200) {

                if ($key['bet_id'] == $id) {
                    return  [
                        'stts' => true,
                        'msg' => "token oke...!",
                    ];
                } else {
                    return  [
                        'stts' => false,
                        'msg' => "token yang anda gunakan bukan milik anda...!",
                    ];
                }
            } else {

                return  [
                    'stts' => false,
                    'msg' => "status login anda sudah kadaluarsa, mohon login kembali...!",
                ];
            }
        } else {
            return  [
                'stts' => false,
                'msg' => "key blum terdaftar...!",
            ];
        }
    }


    private function getKey($id)
    {

        $key = $this->db->table('user_token')->where(['bet_id' => $id])->get()->getRowArray();
        if ($key) {
            $this->db->table('user_token')->update(['exp' => time()]);
            return $this->db->table('user_token')->where(['bet_id' => $id])->get()->getRowArray();
        } else {
            $data = [
                'bet_id' => $id,
                'token' => preg_replace("/[^a-zA-Z0-9]/", "", password_hash(bin2hex(openssl_random_pseudo_bytes(64)), PASSWORD_BCRYPT)),
                'exp' => time()
            ];
            $this->db->table('user_token')->insert($data);
            return $this->db->table('user_token')->where(['bet_id' => $id])->get()->getRowArray();
        }
    }


    public function absenUndia($bet)
    {
        $dataUser = $this->db->table('user_app')->where(['id_bet' => $bet])->get()->getRowArray();
        $dataAbsen = $this->db->table('user_undian')->where(['bet_id' => $bet])->get()->getRowArray();

        if ($dataUser && !$dataAbsen) {
            $this->db->table('user_undian')->insert(['name' => $dataUser['name'], 'bet_id' => $dataUser['id_bet'], 'hadiah' => 0, 'is_active' => 1, 'create' => time()]);
            return  [
                'stts' => true,
                'msg' => "User berhasil absen...!",
            ];
        } else {
            return  [
                'stts' => false,
                'msg' => "User mungkin telah absen atau belum terdaftar...!",
            ];
        }
    }



    public function absenEtowa($bet)
    {
        $dataUser = $this->db->table('user_app')->where(['id_bet' => $bet])->get()->getRowArray();
        $dataAbsen = $this->db->table('mas_absen_etowa')->where(['id_bet' => $bet])->orderBy('mas_absen_etowa.date', "DESC")->limit(1)->get()->getRowArray();
        if ($dataAbsen) {
            $lastAbsen = $dataAbsen['time'];
        } else {
            $lastAbsen = 100;
        }

        $rentang = time() - $lastAbsen;
        // return $rentang;
        if ($rentang > 300) {
            if ($dataUser) {
                $this->db->table('mas_absen_etowa')->insert(['id_bet' => $dataUser['id_finger'], 'date' => date("Y-m-d H:i:s"), 'time' => time()]);
                return  [
                    'stts' => true,
                    'msg' => "<h3>User dengan nama <h3><p> <h1>" . $dataUser['name'] . "<h1/><p><h4> $bet </h4>",
                    'txt' =>  $dataUser['name'] . " berhasil absen"
                ];
            } else {
                return  [
                    'stts' => false,
                    'msg' => "User belum terdaftar...!",
                    'txt' => "Kamu belum terdaftar!"
                ];
            }
        } else {
            return  [
                'stts' => true,
                'msg' => "<h3>User dengan nama<h3><br/><h1> " . $dataUser['name'] . "</h1><br/> <h2>telah absen ...!</h1>",
                'txt' =>  $dataUser['name'] . " telah selesai absen!"
            ];
        }
        return $dataAbsen;
    }
}
