<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{

    protected $primaryKey = 'pk_brand_id';
    protected $table = 'brands';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

     protected $fillable = [
        'brand_name'
    ];
	
}
