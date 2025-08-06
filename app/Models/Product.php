<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{

    protected $primaryKey = 'pk_product_id';
    protected $table = 'products';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

     protected $fillable = [
        'pk_product_id','product_title', 'user_id','category_id', 'brand_id', 'type_id',  'material_id', 'item_size', 'quantity', 'flush_type',
		'image_file', 'status' 
    ];
	
	
	protected $hidden = [
         'updated_at',
    ];

	
	public function user()
	{
		return $this->belongsTo(User::class,'user_id','pk_user_id');
	}
	




}
