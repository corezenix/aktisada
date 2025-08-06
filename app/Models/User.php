<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

use Carbon\Carbon;
use Auth;

use PHPOpenSourceSaver\JWTAuth\Contracts\JWTSubject;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable implements JWTSubject
{
	
	use Notifiable, HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    const ACTIVE = 1;
    const DEACTIVE = 0;

	const SUPERADMIN = 0;
    const ADMIN = 0;
    const USERS = 2;

	
	protected $table = 'users';
    protected $primaryKey = 'pk_user_id';
	
	protected $fillable = [
        'shop_name','contact_person', 'country_code', 'mobile','user_mobile','whatsapp_no','email','address', 'location',
		'city','district', 'state','role_id','created_by','password','status'
		];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    protected $guarded = ['role_id', 'status'];


    public static $userRule = [
        'shop_name' => 'required',
		'contact_person' => 'required',
        'email' => 'required|email',
        'mobile' => 'required|numeric|digits_between:8,15|unique:users,mobile',
		'whatsapp_no' => 'required|numeric|digits_between:8,15',
		'password'=>'required|min:6'
    ];

 
    public static $userRuleMessage = [
        'shop_name.required' => 'shop name is required',
		'contact_person.required' => 'Contact person name is required',
        'email.required' => 'Email is required',
        'email.email' => 'Incorrect Email format',
        'mobile.required' => 'Mobile Number is required',
        'mobile.numeric' => 'Enter number in correct format ',
		'whatsapp_no.required' => 'Whatsapp number is required',
        'whatsapp_no.numeric' => 'Enter number in correct format ',
    ];
	
	public static $userUpdate = [
        'shop_name_edit' => 'required',
		'contact_person_edit' => 'required',
        'email_edit' => 'required|email',
        //'mobile_edit' => 'required|numeric|digits_between:8,15|unique:users,mobile',
		'whatsapp_no_edit' => 'required|numeric|digits_between:8,15',
    ];

 
    public static $updateMessage = [
        'shop_name_edit.required' => 'shop name is required',
		'contact_person_edit.required' => 'Contact person name is required',
        'email_edit.required' => 'Email is required',
        'email_edit.email' => 'Incorrect Email format',
        'mobile_edit.required' => 'Mobile Number is required',
        'mobile_edit.numeric' => 'Enter number in correct format ',
		'whatsapp_no_edit.required' => 'Whatsapp number is required',
        'whatsapp_no_edit.numeric' => 'Enter number in correct format ',
    ];

	//public static $passwordRule = ['password' => 'required|min:6|confirmed'];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

    public function scopeActive()
    {
            return $this->where('status',1);
    }

    /**
     * @return mixed
     */
	 
    public static function getVendorId()
    {
        if(auth()->check()){
            if (Auth::user()->role_id == self::ADMIN) {
                $userId = Auth::user()->pk_user_id;
            } elseif (Auth::user()->role_id == self::USERS) {
                $userId = Auth::user()->pk_user_id;
            } else {
                $userId = Auth::user()->pk_user_id;
            }
            return $userId;
        }else{
            return null;
        }
    }

    public function isAdmin()
    {
        if (Auth::user()->role_id == Self::ADMIN) {
            return true;
        }
    }
	
	public function isUser()
    {
        if (Auth::user()->role_id == self::USERS) {
            return true;
        }
    }


	public static function totalUserCount()
	{
		return self::count();
	}

public static function activeUserCount()
	{
		return self::where('status',1)->count();
	}

public static function inactiveUserCount()
	{
		return self::where('status',0)->count();
	}
}
