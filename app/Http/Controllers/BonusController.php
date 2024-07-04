<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Models\Bonus;
use App\Models\Salary;
use App\Models\Absensi;
use App\Models\Schedule;
use App\Models\Master\Staff;
use Illuminate\Http\Request;
use App\Models\Master\Attendance;
use App\Models\Master\Keterangan;
use App\Models\Master\Departement;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;

class BonusController extends Controller
{

    public function index()
    {
        $bonus = new Bonus;
        $data['bonus'] = $bonus->groupBy('staff_id')
            ->orderBy('staff_id')
            ->select(DB::raw('count(*) as count, tb_bonus.*'))
            ->get();
        $data['count'] = count($data['bonus']);
        return view('bonus.index', $data);
    }
}
