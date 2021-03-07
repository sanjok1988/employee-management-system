<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    protected $fillable = ['name', 'positions'];
    protected $hidden = ['created_at', 'updated_at'];
}
