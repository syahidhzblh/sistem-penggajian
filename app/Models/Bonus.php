<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Master\Staff;

class Bonus extends Model{
    protected $table = 'tb_bonus';
    protected $fillable = ['staff_id','jumlah_bonus','keterangan','status'];

    public function staff(){
        return $this->belongsTo(Staff::class);
    }

}
