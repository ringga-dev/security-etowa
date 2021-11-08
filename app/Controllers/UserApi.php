<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\RestApiModel;

class UserApi extends ResourceController
{
    use ResponseTrait;
    public function __construct()
    {
        $this->model = new RestApiModel();
        helper(['api', 'form', 'security']);
    }


    public function index()
    {
        //
    }

    public function regiter_api()
    {
        $password = $this->request->getPost('password');
        $password_hash = password_hash($password, PASSWORD_BCRYPT);

        $dataRegister = [
            'name' => $this->request->getPost('name'),
            'id_bet' => $this->request->getPost('id_bet'),
            'email' => $this->request->getPost('email'),
            'no_phone' => $this->request->getPost('no_phone'),
            'devisi' => 'security',
            'password' => $password_hash,
            'image' => 'user.jpg',
            'created' => date("Y-M-d h:i:s A"),
            'created_by' => 'null',
        ];

        $data = $this->model->addUsers($dataRegister);

        return $this->respond($data, 200);
    }

    public function login_api()
    {
        $email = $this->request->getPost('email');
        $password = $this->request->getPost('password');

        $data = $this->model->loginUsers($email, $password);

        return $this->respond($data, 200);
    }

    public function list_patrol()
    {
        $token = $this->request->getPost('token');
        $id = $this->request->getPost('id');
        $filter = $this->request->getPost('tgl') ? $this->request->getPost('tgl') : date('d-m-Y');
        $date =  explode("-", $filter);
        $data = $this->model->getHistory($token, $id, $date[0], $date[1], $date[2]);
        return $this->respond($data, 200);
    }

    public function location_scan_qr()
    {
        $token = $this->request->getPost('token');
        $id = $this->request->getPost('id');
        $log = $this->request->getPost('lot');
        $data = $this->model->list_location($token, $id, $log);

        return $this->respond($data, 200);
    }

    public function addpatrol()
    {
        $token = $this->request->getPost('token');
        $id = $this->request->getPost('id');

        $data = [
            'id_user' => $id,
            'qr_code' => $this->request->getPost('qr_code'),
            'tgl' => $this->request->getPost('date'),
            'create' =>  date('Y-m-d H:i:s')
        ];

        $data = $this->model->add_patrol($token, $id, $data);

        return $this->respond($data, 200);
    }

    public function scanvisitor()
    {
        $token = $this->request->getPost('token');
        $id = $this->request->getPost('id');
        $qr_code = $this->request->getPost('qr_code');
        $stts = $this->request->getPost('stts');

        $data = $this->model->scan_visitor($token, $id, $qr_code, $stts);

        return $this->respond($data, 200);
    }

    public function listvisitor()
    {
        $token = $this->request->getPost('token');
        $id = $this->request->getPost('id');
        $tgl = $this->request->getPost('tgl');
        $stts = $this->request->getPost('stts');
        $data = $this->model->list_visitor($token, $id, $stts, $tgl);

        return $this->respond($data, 200);
    }


    public function cek_token()
    {
        $token = $this->request->getVar('token');
        $data = $this->model->cekTokenUser($token);
        return $this->respond($data, 200);
    }

    public function user_izin()
    {
        $token = $this->request->getPost('token');
        $id = $this->request->getPost('id');
        $bet = $this->request->getPost('bet');
        $dari = $this->request->getPost('dari');
        $menuju = $this->request->getPost('menuju');
        $stts = $this->request->getPost('stts');

        $data = $this->model->cek_izin($token, $id, $bet, $stts, $dari, $menuju);

        return $this->respond($data, 200);
    }

    public function edit_pass()
    {
        $old_pass = $this->request->getPost('old_pass');
        $new_pass = $this->request->getPost('new_pass');
        $token = $this->request->getPost('token');
        $id = $this->request->getPost('id');

        $data = $this->model->editPassword($token, $id, $old_pass, $new_pass);

        return $this->respond($data, 200);
    }

    public function location_user()
    {
        $token = $this->request->getPost('token');
        $id = $this->request->getPost('id');
        $lat = $this->request->getPost('lat');
        $long = $this->request->getPost('long');
        $this->model->userLocation($token, $id, $lat, $long);
    }
}
