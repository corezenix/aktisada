<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ItemSize extends Model
{

    protected $primaryKey = 'pk_size_id';
	
    protected $table = 'item_sizes';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

     protected $fillable = [
        'category_id','item_size'
    ];
	
}
