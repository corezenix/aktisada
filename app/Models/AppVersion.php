<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AppVersion extends Model
{

    protected $primaryKey = 'id';
    protected $table = 'app_version';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

     protected $fillable = ['app_version'];
	
	
	protected $hidden = [
         'created_at',
		 'updated_at',
    ];

}
