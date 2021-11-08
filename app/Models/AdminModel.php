<?php

namespace App\Models;

use CodeIgniter\Model;

class AdminModel extends Model
{
    public function getUser()
    {
        return $this->db->table('admin_web')->get()->getResultArray();
    }


    public function hapusUser($id)
    {
        $this->db->table('admin_web')->where(['id' => $id])->delete();
        return ['stts' => true, 'msg' => 'Proses berhasil...!'];
    }

    public function aksesBlok($nik)
    {
        $data = $this->db->table('admin_web')->where(['nik' => $nik])->get()->getRowArray();
        if ($data['enable_login'] == 1) {
            $this->db->table('admin_web')->where(['nik' => $nik])->update(['enable_login' => 2]);
            return ['stts' => false, 'msg' => 'Akses di blok...!'];
        } else {
            $this->db->table('admin_web')->where(['nik' => $nik])->update(['enable_login' => 1]);
            return ['stts' => true, 'msg' => 'Akses di berikan...!'];
        }
    }

    public function getUserApp()
    {
        return $this->db->table('user_app')->get()->getResultArray();
    }

    public function deleteUser($nik)
    {
        $this->db->table('user_app')->where(['nik' => $nik])->delete();
        return ['stts' => true, 'msg' => 'Proses berhasil...!'];
    }

    public function hapusUserApp($id)
    {
        $this->db->table('user_app')->where(['id' => $id])->delete();
        return ['stts' => true, 'msg' => 'Proses berhasil...!'];
    }

    public function getQrLocation()
    {
        return $this->db->table('mas_qr_location')->get()->getResultArray();
    }

    public function saveQRlokasi($data)
    {
        $cek = $this->db->table('mas_qr_location')
            ->where(['qr' => $data['qr']])
            ->get()->getRowArray();

        if (!$cek) {
            $this->db->table('mas_qr_location')->insert($data);
            return ['stts' => true, 'msg' => 'Proses berhasil...!'];
        } else {
            return ['stts' => false, 'msg' => 'Data ini sudah terdaftar...!'];
        }
    }

    public function updateQRlokasi($data, $id)
    {
        $cek =  $this->db->table('mas_qr_location')->where(['id' => $id])->update($data);
        if ($cek != false) {
            return ['stts' => true, 'msg' => 'Proses berhasil...!'];
        } else {
            return ['stts' => false, 'msg' => 'Data ini sudah terdaftar...!'];
        }
    }

    public function deleteQRlokasi($id)
    {
        $cek = $this->db->table('mas_qr_location')
            ->where(['id' => $id])
            ->get()->getRowArray();

        $this->db->table('mas_qr_location')->where(['id' => $id])->delete();
        return ['stts' => true, 'msg' => 'Proses berhasil...!', 'name' => $cek['qr']];
    }

    public function getVisitor($stts)
    {
        if ($stts == 'all') {
            return $this->db->table('list_visitor')->get()->getResultArray();
        } else {
            return $this->db->table('list_visitor')->where(['id_user' => $stts])->get()->getResultArray();
        }
    }


    public function getIzin($stts, $date = null)
    {
        if ($stts == 'all') {
            return $this->db->table('mas_user_scan')->select('mas_user_scan.*, user_app.name')->join('user_app', 'user_app.id_bet = mas_user_scan.id_bet')->get()->getResultArray();
        } elseif ($date) {
            return $this->db->table('mas_user_scan')->select('mas_user_scan.*, user_app.name')->join('user_app', 'user_app.id_bet = mas_user_scan.id_bet')->where(['date' => $date])->get()->getResultArray();
        } else {
            return $this->db->table('mas_user_scan')->select('mas_user_scan.*, user_app.name')->join('user_app', 'user_app.id_bet = mas_user_scan.id_bet')->where(['id_user' => $stts])->get()->getResultArray();
        }
    }


    public function saveVisitor($data)
    {
        $cek = $this->db->table('list_visitor')
            ->where(['qr_code' => $data['qr_code']])
            ->get()->getRowArray();

        if (!$cek) {
            $this->db->table('list_visitor')->insert($data);
            return ['stts' => true, 'msg' => 'Proses berhasil...!'];
        } else {
            return ['stts' => false, 'msg' => 'Data ini sudah terdaftar...!'];
        }
    }

    public function deleteVisitor($id)
    {
        $cek = $this->db->table('list_visitor')
            ->where(['id' => $id])
            ->get()->getRowArray();
        $this->db->table('list_visitor')->where(['id' => $id])->delete();
        return ['stts' => true, 'msg' => 'Proses berhasil...!', 'name' => $cek['qr_code']];
    }


    public function userPatrol($bulan, $tahun, $id = null)
    {
        if ($id != null) {
            $data = $this->db->table('list_patrol')
                ->select('list_patrol.*, user_app.name, user_app.id_bet, user_app.no_phone')
                ->join('user_app', 'user_app.id = list_patrol.id_user')
                ->where("month(list_patrol.tgl) = $bulan AND year(list_patrol.tgl)= $tahun AND list_patrol.id_user =$id")
                ->orderBy('list_patrol.id', 'ASC')
                ->get()->getResultArray();
        } else {
            $data = $this->db->table('list_patrol')
                ->select('list_patrol.*, user_app.name, user_app.id_bet, user_app.no_phone')
                ->join('user_app', 'user_app.id = list_patrol.id_user')
                ->where("month(list_patrol.tgl) = $bulan AND year(list_patrol.tgl)= $tahun")
                ->orderBy('list_patrol.id', 'ASC')
                ->get()->getResultArray();
        }

        return $data;
    }

    public function userAll($id = null)
    {
        return $this->db->table('mas_user_scan')->select('mas_user_scan.*, user_app.name, user_app.devisi')
            ->join('user_app', "user_app.id_bet = mas_user_scan.id_bet")
            ->get()->getResultArray();
    }



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
}
