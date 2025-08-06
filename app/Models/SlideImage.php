<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SlideImage extends Model
{

    protected $primaryKey = 'pk_slide_id';
    protected $table = 'slide_images';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

     protected $fillable = [
        'user_id',
        'image_file',
        'created_by',
    ];
	
  public static $ruleImage = [
      'image_file'=> 'required',
      'image_file.*' => 'image|mimes:jpeg,png,jpg'
    ];

    public static $messageImage = [
        'image_file.required'=>'Image is required',
        'image_file.mimes'=>'Unsupported image file',
       
     ];
	 
}
