<?php

use Illuminate\Database\Seeder;
use App\Models\Master\Attendance;

class TableAttendance extends Seeder
{
    public function run()
    {
        $attendance = [
            ['name' => 'Hadir', 'label' => 'badge badge-success', 'singkatan' => 'H', 'value' => 1],
            ['name' => 'Izin', 'label' => 'badge badge-warning', 'singkatan' => 'I', 'value' => 0],
            ['name' => 'Sakit', 'label' => 'badge badge-info', 'singkatan' => 'S', 'value' => 0],
            ['name' => 'Alpha', 'label' => 'badge badge-danger', 'singkatan' => 'A', 'value' => 0],
        ];
        foreach ($attendance as $row) {
            Attendance::create($row);
        }
    }
}
