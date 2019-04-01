<?php

namespace App\Modules\Employees\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Auth;
class Employees extends Model {

    use SoftDeletes;

    protected $table = "employees";

    protected $guarded = ['created_at', 'updated_at', 'deleted_at'];

    protected $dates = ['deleted_at'];

    public static function getEmailById($id){
       return Self::select('email')->where('id', $id)->first()->email;
    }

    public static function getIdByEmail($email){
      $emp = Self::select('id')->where('work_email', $email)->first();
         if($emp)
            return $emp->id;
        else
            return null;
     }

     public static function getId(){
      $emp = Self::select('id')->where('work_email', Auth::user()->email)->first();
         if($emp)
            return $emp->id;
        else
            return null;
     }


}
