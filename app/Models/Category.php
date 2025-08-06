<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{

	protected $primaryKey = 'pk_category_id';
	protected $table = 'category';

	protected $fillable = [
        'category',
		'image_file',
		'status',
        'created_by', 
	];


	public static $categoryRule = [
        'category' => 'required',
		'image_file'=> 'required|mimes:jpeg,png,jpg',
    ];

 
    public static $categoryMessage = [
        'category.required' => 'Category is required',
		'image_file.required' => 'Image is required',
		'image_file.mimes'=>'Unsupported files, Try again.',
        
    ];
}




