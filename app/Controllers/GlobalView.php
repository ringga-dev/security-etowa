<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\UndianModel;

class GlobalView extends BaseController
{
    public function __construct()
    {
        $this->undian = new UndianModel();
    }
    public function index()
    {
        $data = [
            'title' => 'Managemen Hadiah',
            'user' => $this->undian->getHadiaUndia(),
        ];
        return view('conten/undian/undian', $data);
    }

    public function spin()
    {
        // return view('conten/undian/spin');
        $jam = date('h');

        if ($jam > "13") {
            echo "ini siang";
        } else {
            echo "masa percobaan!";
        }

        echo $jam;
    }

    public function devisi()
    {
        return json_encode($this->undian->getDevisi());
    }
}
