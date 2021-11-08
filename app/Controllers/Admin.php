<?php

namespace App\Controllers;

use App\Controllers\BaseController;

use App\Models\AdminModel;


use Endroid\QrCode\Color\Color;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\ErrorCorrectionLevel\ErrorCorrectionLevelLow;
use Endroid\QrCode\QrCode;
use Endroid\QrCode\RoundBlockSizeMode\RoundBlockSizeModeMargin;
use Endroid\QrCode\Writer\PngWriter;

class Admin extends BaseController
{
    public function __construct()
    {
        $this->admin = new AdminModel();
        $this->sesi = session()->get('data');
    }


    public function menu()
    {
        //
    }


    public function user()
    {
        $data = [
            'title' => 'Managemen User',
            'user' => $this->admin->getUser(),
        ];
        return view('conten/home/user', $data);
    }

    public function deleteUser($id)
    {
        $data = $this->admin->hapusUser($id);
        session()->setFlashdata('pesan', $data);
        return redirect()->to('/admin/user');
    }

    public function blok_akses()
    {
        $id = $this->request->getVar('nik');

        $data = $this->admin->aksesBlok($id);
        return json_encode($data);
    }

    public function user_app()
    {
        $data = [
            'title' => 'Managemen User App',
            'user' => $this->admin->getUserApp(),
        ];
        return view('conten/home/userApp', $data);
    }

    public function deleteUserApp($id)
    {
        $data = $this->admin->hapusUserApp($id);
        session()->setFlashdata('pesan', $data);
        return redirect()->to('/admin/user_app');
    }

    public function qr_location()
    {
        $data = [
            'title' => 'Managemen User App',
            'qr_location' => $this->admin->getQrLocation(),
        ];
        return view('conten/home/qr_location', $data);
    }

    public function add_qr_loc()
    {
        $sesi = session()->get('data');
        $data1 = [
            'qr' => trim($this->request->getVar('gr_code')),
            'stts' => $this->request->getVar('stts'),
            'lot' => $this->request->getVar('lokasi'),
            'dec' => $this->request->getVar('dec'),
            'create' => date("d-M-Y h:i:s A") . " by " .  $sesi['username'],
            // 'log' => $this->request->getVar('long') . ", " . $this->request->getVar('lat')
        ];


        $data = $this->admin->saveQRlokasi($data1);
        if ($data['stts'] == true) {
            $writer = new PngWriter();

            // Create QR code
            $qrCode = QrCode::create(trim($this->request->getVar('gr_code')))
                ->setEncoding(new Encoding('UTF-8'))
                ->setErrorCorrectionLevel(new ErrorCorrectionLevelLow())
                ->setSize(300)
                ->setMargin(10)
                ->setRoundBlockSizeMode(new RoundBlockSizeModeMargin())
                ->setForegroundColor(new Color(0, 0, 0))
                ->setBackgroundColor(new Color(255, 255, 255));

            $result = $writer->write($qrCode);
            echo $result->getString();

            // Save it to a file
            $nama = trim($this->request->getVar('gr_code'));
            $result->saveToFile("assets/image/qr/$nama.png");
        }
        session()->setFlashdata('pesan', $data);
        return redirect()->to('/admin/qr_location');
    }

    public function edit_qr($id)
    {

        $sesi = session()->get('data');
        $data1 = [
            'stts' => $this->request->getVar('stts'),
            'lot' => $this->request->getVar('lokasi'),
            'dec' => $this->request->getVar('dec'),
            'update' => date("d-M-Y h:i:s A")  . " By " .  $sesi['username'],
            // 'log' => $this->request->getVar('long') . ", " . $this->request->getVar('lat')
        ];

        $data = $this->admin->updateQRlokasi($data1, $id);
        session()->setFlashdata('pesan', $data);
        return redirect()->to('/admin/qr_location');
    }

    public function deleteQR($id)
    {
        $data = $this->admin->deleteQRlokasi($id);
        if ($data['stts'] == true) {
            $path = './assets/image/qr/' . $data['name'] . '.png';
            chmod(
                $path,
                0777
            );
            unlink($path);
        }
        session()->setFlashdata('pesan', $data);
        return redirect()->to('/admin/qr_location');
    }

    public function visitor()
    {
        $data = [
            'title' => 'Managemen User App',
            'visitor' => $this->admin->getVisitor($this->request->getVar('filter') ? $this->request->getVar('filter') : "all"),
        ];
        // dd($this->request->getVar('filter'));
        return view('conten/home/visitor', $data);
    }

    public function add_visitor()
    {
        $sesi = session()->get('data');
        $data = [
            'nama' => $this->request->getVar('name'),
            'jadwal' => $this->request->getVar('date') . " " . $this->request->getVar('time'),
            'qr_code' => $this->request->getVar('qr_code'),
            'keperluan' => $this->request->getVar('keperluan'),
            'description' => $this->request->getVar('description'),
            'id_user' => 'plan',
            'create' => date("d-M-Y h:i:s A") . " By " .  $sesi['username'],
        ];
        $data = $this->admin->saveVisitor($data);
        if ($data['stts'] == true) {
            $writer = new PngWriter();

            // Create QR code
            $qrCode = QrCode::create(trim($this->request->getVar('qr_code')))
                ->setEncoding(new Encoding('UTF-8'))
                ->setErrorCorrectionLevel(new ErrorCorrectionLevelLow())
                ->setSize(300)
                ->setMargin(10)
                ->setRoundBlockSizeMode(new RoundBlockSizeModeMargin())
                ->setForegroundColor(new Color(0, 0, 0))
                ->setBackgroundColor(new Color(255, 255, 255));

            $result = $writer->write($qrCode);
            echo $result->getString();

            // Save it to a file
            $nama = trim($this->request->getVar('qr_code'));
            $result->saveToFile("assets/image/qr_visitor/$nama.png");
        }

        session()->setFlashdata('pesan', $data);
        return redirect()->to('/admin/visitor');
    }


    public function deleteVisitor($id)
    {
        $data = $this->admin->deleteVisitor($id);

        if ($data['stts'] == true) {
            $path = './assets/image/qr_visitor/' . $data['name'] . '.png';
            chmod(
                $path,
                0777
            );
            unlink($path);
        }
        session()->setFlashdata('pesan', $data);
        return redirect()->to('/admin/visitor');
    }

    public function history_patrol()
    {
        $filter = $this->request->getVar('filter') ? $this->request->getVar('filter') : date('Y-m');
        $date =  explode("-", $filter);
        $data = [
            'title' => 'Managemen User App',
            'datascan' => $this->admin->userPatrol($date[1], $date[0], $this->request->getVar('id')),
            'user' => $this->admin->getUserApp(),
        ];
        // dd($data);
        return view('conten/home/user_patrol', $data);
    }

    public function history_fisitor()
    {
        $data = [
            'title' => 'Managemen User App',
            'visitor' => $this->admin->listVisitor($this->request->getVar('id')),
        ];
        return view('conten/home/user_patrol', $data);
    }

    public function all_users()
    {
        $data = [
            'title' => 'Managemen User App',
            'scan' => $this->admin->userAll(),
        ];
        return view('conten/home/user_scan', $data);
    }

    public function action_user()
    {
        $password = 123456;
        $password_hash = password_hash($password, PASSWORD_BCRYPT);

        $sesi = session()->get('data');
        $dataRegister = [
            'name' => $this->request->getPost('name'),
            'id_bet' => $this->request->getPost('id_bet'),
            'email' => $this->request->getPost('email'),
            'no_phone' => $this->request->getPost('no_phone'),
            'devisi' => $this->request->getPost('devisi'),
            'password' => $password_hash,
            'image' => 'user.jpg',
            'created' => date("Y-M-d h:i:s A"),
            'created_by' => $sesi['username'],
        ];

        $data = $this->admin->addUsers($dataRegister);
        session()->setFlashdata('pesan', $data);
        return redirect()->to('/admin/user_app');
    }

    public function user_location()
    {
        $data = [
            'title' => 'Managemen User App',
            'user' => $this->admin->getUserApp(),
        ];
        return view('conten/home/userApp', $data);
    }

    public function izin()
    {
        $data = [
            'title' => 'Managemen User App',
            'visitor' => $this->admin->getIzin($this->request->getVar('filter') ? $this->request->getVar('filter') : "all", $this->request->getVar('date')),
        ];
        // dd($this->request->getVar('filter'));
        return view('conten/home/user_izin', $data);
    }
}
