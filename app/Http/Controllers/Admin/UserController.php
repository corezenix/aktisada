<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Facades\FileUpload;

use App\Models\User;
use App\Models\PurchaseScratch;
use App\Models\ScratchCount;
use App\Models\Settings;

use Validator;

use DataTables;
use Session;
use Auth;
use Log;
use DB;
use Carbon\Carbon;

class UserController extends Controller
{
  public function __construct()
  {
     //$this->middleware('admin');
  }
  
  public function index()
  {
	return view('admin.users.users_list');
  }	
    
  public function store(Request $request)
    {
        // return $request;

		DB::beginTransaction();

        $validator=validator::make($request->all(),User::$userRule,User::$userRuleMessage);
		
        if ($validator->fails()) 
		{
			return response()->json(['msg'=>$validator->messages()->first(),'status'=>false]);
		}
		else
		{
            try
			{
				$mob=User::where('mobile',$request->mobile)->first();
				if($mob)
				{
					return response()->json(['msg'=>'Mobile number already exisits, try again.','status'=>false]);
				}

				$data=[
					'shop_name'=>$request->shop_name,
					'contact_person'=>$request->contact_person,
					'country_code'=>$request->country_code,
					'mobile'=>$request->mobile,
					'user_mobile'=>$request->country_code.$request->mobile,
					'whatsapp_no'=>$request->whatsapp_no,
					'email'=>$request->email,
					'role_id'=>$request->role_id,
					'address'=>$request->addtess,
					'location'=>$request->location,
					'city'=>$request->city,
					'district'=>$request->district,
					'state'=>$request->state,
					'password'=>Hash::make($request->password),
					'status'=>1,
					'created_by'=>Auth::user()->id
				];
				
				$result=User::create($data);
				$user_id=$result->pk_user_id;
				
				//update unique id------------
				/*$le=str::length($user_id);
				$uniq_id="DS".str_pad("0",(8-$le),'0').$user_id;
				$res=User::where('pk_int_user_id',$user_id)->update(['unique_id'=>$uniq_id]);
				//---------------
				*/
				
				if($result)
        		{   
					DB::commit();
					return response()->json(['msg'=>'User successfully added.','status'=>true]);
        		}
        		else
        		{
					DB::rollback();
					return response()->json(['msg'=>'Something wrong, Try again.','status'=>false]);
        		}

           }
            catch(\Exception $e)
            {
				DB::rollback();
			  return response()->json(['msg'=>$e->getMessage(),'status'=>false]);
            }
        } 
    }
	
 public function viewUsers()
    {
      $id=User::getVendorId();

      $users = User::where('users.role_id','!=',0)->orderby('users.pk_user_id','Desc')->get();	  
	  
        return Datatables::of($users)
		->addIndexColumn()
			
		
		->editColumn('address', function ($row) {
            
			return $row->address??"--";
        })
		->editColumn('location', function ($row) {
            
			return $row->location??"--";
        })
		->editColumn('district', function ($row) {
            
			return $row->district??"--";
        })
		->editColumn('state', function ($row) {
            
			return $row->state??"--";
        })
		->editColumn('status', function ($row) {
            if ($row->status==1) {
                $status='<span class="badge rounded-pill bg-success">Active</span>';
            } else {
                $status='<span class="badge rounded-pill bg-danger">Inactive</span>';
            }
			
			return $status;
        })
        ->addColumn('action', function ($row)
        {
			if ($row->status == 1)
			{
				$btn='<li><a class="dropdown-item btn-act-deact" href="javascript:void(0)" id="'.$row->pk_user_id.'" data-option="2" ><i class="lni lni-close"></i> Deactivate</a></li>';
			}
			else
			{
				$btn='<li><a class="dropdown-item btn-act-deact" href="javascript:void(0)" id="'.$row->pk_user_id.'" data-option="1"><i class="lni lni-checkmark"></i> Activate</a></li>';
			}
			
			$action='<div class="fs-5 ms-auto dropdown">
                          <div class="dropdown-toggle dropdown-toggle-nocaret cursor-pointer" data-bs-toggle="dropdown"><i class="fadeIn animated bx bx-dots-vertical"></i></div>
                            <ul class="dropdown-menu">
                              <li><a class="dropdown-item edit-user" href="javascript:void(0)" id="'.$row->pk_user_id.'" data-bs-toggle="offcanvas" data-bs-target="#edit-user"  ><i class="lni lni-pencil-alt"></i> Edit</a></li>
                              <li><a class="dropdown-item delete-user" href="javascript:void(0)" id="'.$row->pk_user_id.'"><i class="lni lni-trash"></i> Delete</a></li>
							  <li><a class="dropdown-item change-pass" href="javascript:;" id="'.$row->pk_user_id.'" data-bs-toggle="modal" data-bs-target="#change-pass-modal"><i class="lni lni-lock"></i> Change Password</a></li>'
							   .$btn.
							  '</ul>
                        </div>';
			return $action;
        })
        ->rawColumns(['action','status'])
        ->make(true);
    }


public function edit($id)
{
	$usr=User::where('pk_user_id',$id)->first();
	return view('admin.users.edit_user',compact('usr'));
}


  public function updateUser(Request $request)
    {

        $validator=validator::make($request->all(), User::$userUpdate, User::$updateMessage);
        if ($validator->fails()) 
		{
			return response()->json(['msg'=>$validator->messages()->first(),'status'=>false]);
		}
		else
		{
			try{

				$user_id=$request->user_id;

				$data=[
					'shop_name'=>$request->shop_name_edit,
					'contact_person'=>$request->contact_person_edit,
					'country_code'=>$request->country_code_edit,
					'mobile'=>$request->mobile_edit,
					'user_mobile'=>$request->country_code_edit.$request->mobile_edit,
					'whatsapp_no'=>$request->whatsapp_no_edit,
					'email'=>$request->email_edit,
					'role_id'=>$request->role_id_edit,
					'address'=>$request->address_edit,
					'location'=>$request->location_edit,
					'city'=>$request->city_edit,
					'district'=>$request->district_edit,
					'state'=>$request->state_edit,
				];
	
				$result=User::where('pk_user_id',$user_id)->update($data); 
				
				if($result)
        		{   
					return response()->json(['msg'=>'User successfully updated.','status'=>true]);
        		}
        		else
        		{
					return response()->json(['msg'=>'Something wrong, try again.','status'=>false]);
        		}
	
            }
            catch(\Exception $e)
            {
                return response()->json(['msg'=>$e->getMessage(),'status'=>false]);
            }
        } 
    }


public function destroy($id)
{
	try
	{
		$users=User::where('pk_user_id',$id)->first();
		
		if($users)
		{
			$res=$users->delete();
			if($res)
			{   
				return response()->json(['msg'=>'User successfully removed.','status'=>true]);
			}
			else
			{
				return response()->json(['msg'=>'Something wrong, Try again.','status'=>false]);
			}
		}
	}
	catch(\Exception $e)
	{
		return response()->json(['msg'=>$e->getMessage(),'status'=>false]);
	}
}

public function activateDeactivate($op,$id)
	{
		if($op==1)
		{
		   $new=['status'=>1];
		}
		else
		{	
		   $new=['status'=>0];
		}

		$result=User::where('pk_user_id',$id)->update($new);
		
			if($result)
			{
				if($op==1)
					return response()->json(['msg' =>'User successfully activated!' , 'status' => true]);
				else
				    return response()->json(['msg' =>'User successfully deactivated!' , 'status' => true]);
			}
			else
			{
				return response()->json(['msg' =>'Something wrong, try again!' , 'status' => false]);
			}				

	}

 public function importUser(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'user_file' => 'required|mimes:xlsx',
        ]);

        if ($validator->fails()) {
            return response()->json(['msg' =>'Invalid file, Ty again!' , 'status' => false]);
        }

        Excel::import(new UserImport, $request->file, $request->file('user_file'),\Maatwebsite\Excel\Excel::XLSX);

        return response()->json(['msg'=>'User(s) successfully imported.','status'=>true]);

    }



//---------------------------------------------------------------------------

public function userProfile($user_id)
{
	///dd(request()->segment(3));

	$usr=User::where('pk_user_id',$user_id)->get()->map(function($q)
	{
		  if($q->vchr_logo!="")
			  $q->user_logo=FileUpload::viewFile($q->vchr_logo,'local');
		  else
			  $q->user_logo=asset('assets/images/avatars/1.png');
		  return $q;
	  })->first();
	
	
	if($usr->subscription_end_date<date('Y-m-d') && $usr->subscription_end_date!='')
	{
		$subscription="Expired";
	}
	else if($usr->subscription_end_date=='' && $usr->subscription_end_date=='')
	{
		$subscription='No Subscription';
	}
	else
	{
		$subscription='Active';
	}

	$data['tot_count']=ScratchCount::getTotalScratchCount($user_id);
	$data['used_count']=ScratchCount::getUsedScratchCount($user_id);
	$data['bal_count']=ScratchCount::getBalanceScratchCount($user_id);
	
	$data['ch_users']=User::where('parent_user_id',$user_id)->get();
	
	return view('admin.users.user_profile',compact('user_id','usr','data','subscription'));
}

public function viewScratchHistory($id)
{

  $data = PurchaseScratch::where('fk_int_user_id',$id)->orderby('id','ASC')->get();

	return Datatables::of($data)
	->addIndexColumn()
	->addColumn('narration', function ($row) {
		return $row->narration;
	})
	
	->addColumn('cdate', function ($row) {
		return date_create($row->created_at)->format('d-m-Y');
	})
			
	->addColumn('action', function ($row)
	{
		$btn='';
		if($row->status==1)
			$btn='<a class="link-delete" href="javascript:void(0)" id="'.$row->id.'" data-userid="'.$row->fk_int_user_id.'" title="delete" ><i class="lni lni-trash"></i></a>';
					
		return $btn;
	})
	->rawColumns(['action','status'])
	->make(true);
}

public function changeUserPassword(Request $request)
{
	
	$validator=validator::make($request->all(),[
		'new_pass' => 'required|max:15',
        'confirm_pass' => 'required|max:15',
        ]);
        if ($validator->fails()) 
		{
			return response()->json(['msg'=>$validator->messages()->first(),'status'=>false]);
		}
		else
		{
	
			$user_id=Auth::user()->pk_user_id;
			
			$npas=$request->new_pass;
			$data=['password'=>Hash::make($npas)];
			
			$result=User::where('pk_user_id',$user_id)->update($data);
			if($result)
			{   
				return response()->json(['msg'=>'User password updated.','status'=>true]);
			}
			else
			{
				return response()->json(['msg'=>'Something wrong, try again.','status'=>false]);
			}
		}
	
}

public function changePassword(Request $request)
{
	
	$validator=validator::make($request->all(),[
		'password' => 'required|max:15',
        'confirm_password' => 'required|max:15',
        ]);
        if ($validator->fails()) 
		{
			return response()->json(['msg'=>$validator->messages()->first(),'status'=>false]);
		}
		else
		{
	
			$user_id=$request->user_id;
			
			$npas=$request->password;
			$data=['password'=>Hash::make($npas)];
			
			$result=User::where('pk_user_id',$user_id)->update($data);
			if($result)
			{   
				return response()->json(['msg'=>'User password updated.','status'=>true]);
			}
			else
			{
				return response()->json(['msg'=>'Something wrong, try again.','status'=>false]);
			}
		}
	
}



}