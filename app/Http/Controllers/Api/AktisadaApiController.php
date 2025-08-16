<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Facades\FileUpload;

use App\Models\ScratchBranch;
use App\Models\ScratchWebCustomer;
use App\Models\ScratchOffer;
use App\Models\ScratchOffersListing;
use App\Models\ScratchType;
use App\Models\SlideImage;
use App\Models\UserOtp;
use App\Models\User;
use App\Models\Brand;
use App\Models\Category;
use App\Models\ItemType;
use App\Models\Material;

use App\Models\Settings;

use App\Common\Variables;
use App\Common\WhatsappSend;
use App\Services\WhatsappService;
use App\Services\WhatsappGiftConfirmMsgService;
use App\Notification\WhatsappGiftConfirmSend;

use App\Jobs\SentCrmServiceJob;

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
        
        $validator = Validator::make($input,$rule);
        if ($validator->passes()) 
        {
            try
            {
                $user = User::where('status',1)->where('mobile', $request->mobile)->first();
                if ($user && Hash::check($request->password,$user->password)) {
					$success['token'] =  $user->createToken('aktisada')->plainTextToken; 
					$success['user'] =  $user;	
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
	
	
    public function getBrandTypeMaterial()
    {
		try
		{
			$category = Category::where('status',1)->orderBy('pk_category_id','ASC')->get();
			$brands = Brand::orderBy('pk_brand_id','ASC')->get();
			$types = ItemType::orderBy('pk_type_id','ASC')->get();
			$material = Material::orderBy('pk_material_id','ASC')->get();
			$users = User::where('status',1)->where('role_id',2)->orderBy('pk_user_id','ASC')->get();
			
			$data['categories']=$category;
			$data['brands']=$brands;
			$data['types']=$types;
			$data['material']=$material;
			$data['shops']=$users;
			
			return response()->json(['message'=> 'Details Successfully listed','data'=>$data,'status' => true]);

		}catch(\Exception $e){
			return response()->json(['message'=>$e->getMessage(), 'status' => false]);
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
				$types = ItemType::orderBy('pk_type_id','ASC')->get();
				$material = Material::orderBy('pk_material_id','ASC')->get();
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
 
			try
			{
				$data=[
					'brand_name'=>$request->brand_name
				  ];
				
				$result=Brand::create($data);
				if($result)
				{
					return response()->json(['message'=> 'Detild Successfully listed','data'=>$result,'status' => true]);
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
	/**
    * Display a listing of the scratch types.
    * Method: POST
	* Parms: user_id (int),campaign_id (int)
    * @return \Illuminate\Http\Response
    */	
	
	
	
	/**
    * Display a listing of the scratch types.
    * Method: POST
	* Parms: user_id (int),campaign_id (int)
    * @return \Illuminate\Http\Response
    */	
	
    public function scratchType(Request $request)
    {
        $input=$request->all();
        $userid=User::getVendorIdApi($request->user_id);
        $rule=[ 
            'user_id' => 'required',
            'campaign_id' => 'required'
        ];
        
        $validator = Validator::make($input,$rule);
        if ($validator->passes()) 
        {
            try
            {
                $type = ScratchType::select('scratch_type.id','scratch_type.type')->where('scratch_type.status',ScratchType::ACTIVATE)
                ->whereNull('scratch_type.deleted_at')
                ->get();
				
                if($type->isEmpty()){
                    return response()->json(['message'=> 'No Offer type available.!','status' => 'fail','user'=>$type]);
                }
                return response()->json(['message'=> 'Successfully listed','user'=>$type,'status' => true]);
            }catch(\Exception $e){
                return response()->json(['message'=>$e->getMessage(), 'status' => false]);
            }
        }else {   
            return response()->json(['msg'=>$validator->messages(), 'status' => false]);
        }
    }
    
	/**
    * to send otp for verify mobile.
    * Method: POST
	* Parms: user_id (int),campaign_id (int), name (string), country_code (string), mobile_no (string), type_id (int)
    * @return \Illuminate\Http\Response
    */	
	
    public function sendOtp(Request $request)
    {
        $input=$request->all();
        $rule=[
            'user_id' => 'required',
            //'campaign_id' => 'required',
            'name' => 'required',
			'country_code' => 'required',
            'mobile_no' => 'required|numeric|digits_between:8,14',
            'type_id'=>'required',
        ];

        $validator = Validator::make($request->all(),$rule);
        if (!$validator->passes()) 
        {
            return response()->json(['msg'=>$validator->messages(), 'status' => false]);
        }
        $userid=User::getVendorIdApi($request->user_id);
		
		$user = User::active()->where('pk_int_user_id', $userid)->first();			
		if($user->subscription_end_date!=null  and $user->subscription_end_date <= (Carbon::today()->format('Y-m-d')))
		    {
                return response()->json(['msg' => 'You are not subscribed to GL Scratch or plan expired. please contact your administrator.', 'status' => false]); 
            }
        if(request()->has('bill_no')){
            $check_bill = ScratchWebCustomer::where('bill_no', $request->bill_no)->where('user_id',$userid)->first();
            if($check_bill){
                return response()->json(['msg' => "You already Scratched with this bill number.Please try with other.", 'status' => false]);
            }
        }
        
        // Get the last 10 digits
        //$last10Digits = substr($request->mobile_no, -10);
        $check_num = ScratchWebCustomer::where('bill_no', $request->bill_no)->where('mobile',$request->mobile_no)->where('user_id',$userid)->first();
        if($check_num){
            return response()->json(['msg' => "You have already used up your chance.Please try with a different number", 'status' => false]);
        }
        
		//only one offer/campaign ----		
		$offer_id=ScratchOffer::where('fk_int_user_id',$userid)->where('int_status',1)->pluck('pk_int_scratch_offers_id')->first(); //newly added
				
        //$offerListing = ScratchOffersListing::where('fk_int_scratch_offers_id', request('campaign_id'))
		$offerListing = ScratchOffersListing::where('fk_int_scratch_offers_id', $offer_id)
                ->where('int_scratch_offers_balance', '!=', '0')
                ->where('int_status',1)
                ->inRandomOrder()
                ->first();
        
        if(!$offerListing)
        return response()->json(['msg' => "Scratch offers corrently not available. Please try after sometimes.", 'status' => false]);
        
		
		$country_code=91;
		if($request->has('country_code'))
		{
			$country_code=$request->country_code;
		}
				
        $mobile = $country_code . $request->mobile_no;
        try {
            $number = $mobile;
            $otp = rand(1111, 9999);
            $matchThese = ['user_id' => $userid, 'otp_type' => 'scratch_api'];
            UserOtp::updateOrCreate($matchThese, ['otp' => $otp]);
			
			$otp_enabled=Variables::getScratchBypass($userid);
			
			if($otp_enabled=="Disabled")
                return response()->json(['msg' => "Scratch otp bypass enabled", 'status' => true, 'otp'=>null]);

            try {
					$dataSend = [
						'mobile_no' => $mobile,
						'otp' => $otp
					];
				
					(new WhatsappSend(resolve(WhatsappService::class)))->sendWhatsappOtp($dataSend);
				
            } catch (\Exception $e) {
               Log::info($e->getMessage());
            }
            
			return response()->json(['msg' => "OTP successfully send!", 'status' => true,'otp'=>$otp]);
			
        } catch (\Exception $e) {
            Log::error($e->getMessage());
            return $e->getMessage();
        }
    }
	
	
	/**
    * to verify the customer mobile no.
    * Method: POST
	* Parms: user_id (int),otp (int)
    * @return \Illuminate\Http\Response
    */	
    
    public function verifyOtp(){
        $rule=[
            'user_id' => 'required', 
            'otp' => 'required'
        ];
        $validator = Validator::make(request()->all(),$rule);
        if ($validator->passes()) 
        {
            $requestOtp = request('otp');
            $otpOld = UserOtp::where('user_id',request('user_id'))->where('otp_type','scratch_api')->latest()->first();
            
            // Check if an OTP was found and if it has expired by 2 minutes
            if ($otpOld) {
                $now = Carbon::now();
                // Check if the OTP is expired by 3 minutes
                if ($now->diffInMinutes($otpOld->updated_at) > 3) {
                    return response()->json(['message' => "OTP Expired!! Try again", 'status' => false]);
                }
            } else {
                // No OTP found
                return response()->json(['message' => "OTP Expired!! Try again", 'status' => false]);
            }
            
            if((int)$requestOtp != (int)$otpOld->otp){
                return response()->json(['message' => "Invalid otp!! Try again", 'status' => false]);
            }
            
            $offerListing = ScratchOffersListing::where('fk_int_scratch_offers_id', request('campaign_id'))
                ->where('int_scratch_offers_balance', '!=', '0')
                ->where('int_status',1)
                ->inRandomOrder()
                ->first();
            
            return response()->json(['message' => "Otp verified successfull", 'status' => true,'data' => $offerListing]);
            
        }else{
            return response()->json(['message' => $validator->messages(), 'status' => false]);
        }
    }


/**
    * Display a listing of the branches.
    * Method: POST
	* Parms: user_id (int)
    * @return \Illuminate\Http\Response
    */	
	
	
public function getBranches(){
	$rule=[ 
		'user_id' => 'required',
		];

		$validator = Validator::make(request()->all(),$rule);
		if ($validator->passes()) 
		{
			$userid=User::getVendorIdApi(request('user_id'));
			try
			{
				$branches = ScratchBranch::where('scratch_branches.vendor_id', $userid)->where('scratch_branches.status',ScratchBranch::ACTIVATE)
									->select('scratch_branches.id','scratch_branches.branch_name')->groupBy('id','scratch_branches.branch_name')
									->get();
			
				if($branches->isEmpty()){
					return response()->json(['message'=> 'No Branches Available Now ...','status' => 'fail','branches'=>$branches]);
				}
				
				return response()->json(['message'=> 'Successfully listed','branches'=>$branches,'status' => false]);
			}catch(\Exception $e){
				return response()->json(['message'=>$e->getMessage(), 'status' => false]);
			}
		}else{     
			return response()->json(['message'=>$validator->messages(), 'status' => false]);
		}
}

/**
    * Display a slide images .
    * Method: POST
	* Parms: user_id (int)
    * @return \Illuminate\Http\Response
    */	
	
public function getSlideImages()
{
	$rule=[ 
		'user_id' => 'required',
		];
		
		$userid=User::getVendorIdApi(request('user_id'));

		$validator = Validator::make(request()->all(),$rule);
		if ($validator->passes()) 
		{
			$user=User::where('pk_int_user_id',$userid)->first();
			if($user)
			{
				if($user->parent_user_id!=null)
					$userid=$user->parent_user_id;
			}
			
			try
			{
				$images = SlideImage::where('user_id', $userid)->get()->map(function($q)
				{
					$q['image']=FileUpload::viewFile($q['image_file'],'local');
					return $q;
				});

				if($images->isEmpty()){
					return response()->json(['message'=> 'No images were found..','status' => false,'slides'=>$images]);
				}

				return response()->json(['message'=> 'Successfully listed','slides'=>$images,'status' => true]);
			}catch(\Exception $e){
				return response()->json(['message'=>$e->getMessage(), 'status' => false]);
			}
		}else{     
			return response()->json(['message'=>$validator->messages(), 'status' => false]);
		}
}
 

}