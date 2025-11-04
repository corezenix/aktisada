<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Facades\FileUpload;

use App\Models\SlideImage;
use App\Models\UserOtp;
use App\Models\User;
use App\Models\Brand;
use App\Models\Category;
use App\Models\ItemType;
use App\Models\ItemSize;
use App\Models\Material;
use App\Models\AppVersion;

/*
use App\Common\WhatsappSend;
use App\Services\WhatsappService;
*/

use Carbon\Carbon;
use Hash;
use Validator;
use DB;
use Log;


class AktisadaApiController extends Controller
{
    //use CrmApiService;
	
	/**
    * Display a listing of the resource.
    *
    * @return \Illuminate\Http\Response
    */
    public function login(Request $request)
    {
        $input=$request->all();
        $rule=[ 
            'mobile' => 'required',
            'password'=>'required'
        ];
        
		$ver=AppVersion::where('id',1)->first();
		if($ver)
			$version=$ver->app_version;
		else
			$version="1.0.1";
				
        $validator = Validator::make($input,$rule);
        if ($validator->passes()) 
        {
            try
            {
                $user = User::where('status',1)->where('mobile', $request->mobile)->first();
                if ($user && Hash::check($request->password,$user->password)) {
					$success['token'] =  $user->createToken('aktisada')->plainTextToken; 
					$success['user'] =  $user;
					$success['version']=$version;
								
                    return response()->json(['message' => 'Logged Successfully','data'=>$success,'status' => true]); 
                }else
                    return response()->json(['message' => 'Invalid Login', 'status' => false]); 
			
            }catch(\Exception $e){
                return response()->json(['message' => $e->getMessage(), 'status' => false]);
            }
        } else{
            return response()->json(['message' => $validator->messages(), 'status' => false]);
        }
    }
	
	//to check existing mobile and password
	
	public function checkUserExist(Request $request)
    {
        $input=$request->all();
        $rule=[ 
            'mobile' => 'required',
            'password'=>'required'
        ];
        
        $validator = Validator::make($input,$rule);
        if ($validator->passes()) 
        {
            try
            {
                $user = User::where('status',1)->where('mobile', $request->mobile)->first();
                if ($user && Hash::check($request->password,$user->password)) {
					$success['user'] =  $user;	
                    return response()->json(['message' => 'User Found!','data'=>$success,'status' => true]); 
                }else
                    return response()->json(['message' => 'User  were not found!', 'status' => false]); 
			
            }catch(\Exception $e){
                return response()->json(['message' => $e->getMessage(), 'status' => false]);
            }
        } else{
            return response()->json(['message' => $validator->messages(), 'status' => false]);
        }
    }
	

//to check existing mobile and password
	
	public function checkAppVersion(Request $request)
    {
        $input=$request->all();
        $rule=[ 
            'app_version' => 'required',
        ];
        
        $validator = Validator::make($input,$rule);
        if ($validator->passes()) 
        {
            try
            {
                $ver = AppVersion::where('app_version',$request->app_version)->first();
                if ($ver) {
					
					return response()->json(['message' => 'Success!','version'=>$ver->app_version,'status' => true]); 
                }else
                    return response()->json(['message' => 'Invalid version!', 'status' => false]); 
			
            }catch(\Exception $e){
                return response()->json(['message' => $e->getMessage(), 'status' => false]);
            }
        } else{
            return response()->json(['message' => $validator->messages(), 'status' => false]);
        }
    }

	/**
    * Display a listing of the lides.
    * Method: GET
    * @return \Illuminate\Http\Response
    */	
	
	
    public function getSlides()
    {
		try
		{
			$slides = SlideImage::where('status',1)->orderBy('pk_slide_id','ASC')->get()->map(function($q)
			{
				$q['image_path']=url('uploads').'/'.$q->image_file;
				return $q;
			});
			if (!$slides->isEmpty()) 
			{
				return response()->json(['message'=> 'Slides Successfully listed','slides'=>$slides,'status' => true]);
			}else{
				return response()->json(['message'=> 'Slides Not Found', 'status' => false]); 
			}  
		}catch(\Exception $e){
			return response()->json(['message'=>$e->getMessage(), 'status' => false]);
		}
        
    }
    
	/**
    * Display a listing of the categorie sonly.
    * Method: GET
    * @return \Illuminate\Http\Response
    */	
	
	
	public function getUser(Request $request)
    {
		$rule=[ 
			  'user_id' =>'required',
        ];
        
        $validator = Validator::make($request->all(),$rule);
        if ($validator->passes()) 
        {

			try
			{
				$usrs = User::where('pk_user_id',$request->user_id)->get();
				if (!$usrs->isEmpty()) 
				{
					return response()->json(['message'=> 'User details successfully listed','user'=>$usrs,'status' => true]);
				}else{
					return response()->json(['message'=> 'User Not Found', 'status' => false]); 
				}  
			}catch(\Exception $e){
				return response()->json(['message'=>$e->getMessage(), 'status' => false]);
			}
        }
		else
		{
			return response()->json(['message'=>$validator->messages()->first(), 'status' => false]);
		}
    }
    
	/**
    * Display a listing of the categorie sonly.
    * Method: GET
    * @return \Illuminate\Http\Response
    */	
	
	
    public function getCategories()
    {
		try
		{
			$category = Category::where('status',1)->orderBy('pk_category_id','ASC')->get()->map(function($q)
			{
				$q['image_path']=url('uploads').'/'.$q->image_file;
				return $q;
			});
			
			$data['categories']=$category;

			return response()->json(['message'=> 'Category Successfully listed','data'=>$data,'status' => true]);

		}catch(\Exception $e){
			return response()->json(['message'=>$e->getMessage(), 'status' => false]);
		}
        
    }
	
	
	/**
    * Display a listing of the categories,brand,types, materials,and users.
    * Method: GET
    * @return \Illuminate\Http\Response
    */	
	
	
    public function getBrandTypeMaterial(Request $request)
    {
		
		$rule=[ 
			  'category_id' =>'required',
        ];
        
        $validator = Validator::make($request->all(),$rule);
        if ($validator->passes()) 
        {

			try
			{
				//$category = Category::where('status',1)->orderBy('pk_category_id','ASC')->get();
				$brands = Brand::orderBy('pk_brand_id','ASC')->get();
				$types = ItemType::where('category_id',$request->category_id)->orderBy('pk_type_id','ASC')->get();
				$sizes = ItemSize::where('category_id',$request->category_id)->orderBy('pk_size_id','ASC')->get();
				$material = Material::where('category_id',$request->category_id)->orderBy('pk_material_id','ASC')->get();
				$users = User::where('status',1)->where('role_id',2)->orderBy('pk_user_id','ASC')->get();
				
				//$data['categories']=$category;
				$data['brands']=$brands;
				$data['types']=$types;
				$data['size']=$sizes;
				$data['material']=$material;
				$data['shops']=$users;
				
				return response()->json(['message'=> 'Details Successfully listed','data'=>$data,'status' => true]);

			}catch(\Exception $e){
				return response()->json(['message'=>$e->getMessage(), 'status' => false]);
			}
        }
		else{
			return response()->json(['message'=>"Category missing..!", 'status' => false]);
		}
		
    }
	
	/**
    * to filters.
    * Method: Post
    * @return \Illuminate\Http\Response
    */
	
	
	public function getFilters(Request $request)
    {
		$rule=[ 
			  'category_id' =>'required',
        ];
        
        $validator = Validator::make($request->all(),$rule);
        if ($validator->passes()) 
        {
			try
			{
				$category = Category::where('status',1)->orderBy('pk_category_id','ASC')->get();
				$brands = Brand::orderBy('pk_brand_id','ASC')->get();
				$types = ItemType::where('category_id',$request->category_id)->orderBy('pk_type_id','ASC')->get();
				$material = Material::where('category_id',$request->category_id)->orderBy('pk_material_id','ASC')->get();
				$users = User::where('status',1)->where('role_id',2)->orderBy('pk_user_id','ASC')->get();
				$sizes = ItemSize::where('category_id',$request->category_id)->orderBy('pk_size_id','ASC')->get();
				
				$data['categories']=$category;
				$data['brands']=$brands;
				$data['types']=$types;
				$data['material']=$material;
				$data['shops']=$users;
				$data['sizes']=$sizes;
				
				return response()->json(['message'=> 'Details Successfully listed','data'=>$data,'status' => true]);

			}catch(\Exception $e){
				return response()->json(['message'=>$e->getMessage(), 'status' => false]);
			}
		}
		else{
			return response()->json(['message'=>"Category missing..!", 'status' => false]);
		}
        
    }
	
	
	
	/**
    * to add brand.
    * Method: Post
    * @return \Illuminate\Http\Response
    */	
	
	
    public function addBrand(Request $request)
    {
		
		$rule=[ 
			  'brand_name' =>'required',
        ];
        
        $validator = Validator::make($request->all(),$rule);
        if ($validator->passes()) 
        {

			$cnt=Brand::where(strtoupper('brand_name'),strtoupper($request->brand_name))->count();
			if($cnt>0)
			{
				return response()->json(['message'=>"Brand already exists. Try again with new one.", 'status' => false]);
			}
 
			try
			{
				$data=[
					'brand_name'=>$request->brand_name
				  ];
				
				$result=Brand::create($data);
				if($result)
				{
					return response()->json(['message'=> 'Brand successfully added','data'=>$result,'status' => true]);
				}
				else
				{
					return response()->json(['message'=>"Something wrong, Try again", 'status' => false]);
				}

			}catch(\Exception $e){
				return response()->json(['message'=>$e->getMessage(), 'status' => false]);
			}
        
		}
		else{
			return response()->json(['message'=>$validator->messages()->first(), 'status' => false]);
		}
	}

}