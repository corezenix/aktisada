<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ItemType extends Model
{

    protected $primaryKey = 'pk_type_id';
    protected $table = 'item_types';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

     protected $fillable = [
        'type_name'
    ];
	
}
