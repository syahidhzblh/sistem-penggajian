<?php

use Illuminate\Database\Seeder;
use App\Models\Users;
use App\Models\Master\Staff;
use Illuminate\Support\Facades\DB;

class TableUsers extends Seeder
{
    public function run()
    {
        $admin = DB::table('roles')->where('name', 'admin')->get()->first()->id;

        $user = Users::create([
            'role_id'   => $admin,
            'name'      => 'Administrator',
            'email'     => 'admin@gmail.com',
            'username'  => 'admin',
            'password'  => bcrypt('admin'),
        ]);

        Staff::create([
            'users_id' => $user->id,
            'position_id' => 1,
            'departement_id' => 1,
            'name' => 'Admin',
            'birth' => date('Y-m-d'),
            'startdate' => date('Y-m-d'),
            'addres' => 'Jakarta',
            'addres' => null,
        ]);
    }
}
