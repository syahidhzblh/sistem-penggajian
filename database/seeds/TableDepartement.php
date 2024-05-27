<?php

use Illuminate\Database\Seeder;
use App\Models\Master\Departement;

class TableDepartement extends Seeder
{
    public function run()
    {
        $departement = [
            ['name' => 'Operations'],
            ['name' => 'Engineering'],
            ['name' => 'Finance'],
            ['name' => 'Marketing'],
        ];
        foreach ($departement as $row) {
            Departement::create($row);
        }
    }
}
