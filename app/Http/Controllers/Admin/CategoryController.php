<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Facades\FileUpload;

use App\Models\User;
use App\Models\Category;

use Validator;

use DataTables;
use Session;
use Auth;
use Log;
use DB;
use Carbon\Carbon;


class CategoryController extends Controller
{
  public function __construct()
  {
     //$this->middleware('admin');
  }
  
  public function index()
  {
	return view('admin.category.category_list');
  }	
    
  public function store(Request $request)
    {
        // return $request;


		$user_id=User::getVendorId();

		if($request->submit=="submit")
		{

				$validator=validator::make($request->all(), Category::$categoryMessage, Category::$categoryMessage);
				if ($validator->fails()) 
				{
					Session::flash('fail',$validator->messages());
					return back()->withInput();
				}
				else
				{

					try
					{
						$path = 'category/';
							$image = $request->file('image_file');
							$name = rand(10, 100). date_timestamp_get(date_create()). '.' . $image->getClientOriginalExtension();
							FileUpload::uploadFile($image, $path,$name,'local');
							$fname=$path.$name;
							
						$data=[
							'category'=>$request->category,
							'image_file'=>$fname,
							'created_by'=>$user_id,
							'status'=>1,
						];
										
						$result=Category::create($data);
			
						if($result)
						{   
							Session::flash('success',"Category successfully added.");
							return redirect('admin/category-list');
						}
						else
						{
							Session::flash('fail',"Something wrong, Try again.");
							return back()->withInput();
						}
			
				   }
					catch(\Exception $e)
					{
						Session::flash('fail',$e->getMessage());
						return back()->withInput();
					}
				} 
		}
		else
		{

			$validator=validator::make($request->all(), ['category'=>'required'],[]);
			if ($validator->fails()) 
			{
				Session::flash('fail',$validator->messages());
				return back()->withInput();
			}
			else
			{

				try
				{
					$path = 'category/';
					if($request->file('image_file'))
					{
						$image = $request->file('image_file');
						$name = rand(10, 100). date_timestamp_get(date_create()). '.' . $image->getClientOriginalExtension();
						FileUpload::uploadFile($image, $path,$name,'local');
						Storage::disk('local')->delete($request->old_image_file);
						$fname=$path.$name;
					}
					else
					{
						$fname=$request->old_image_file;
					}
				
					$data=[
						'category'=>$request->category,
						'image_file'=>$fname,
						'created_by'=>$user_id,
					];
									
					$result=Category::where('pk_category_id',$request->category_id)->update($data);
		
					if($result)
					{   
						Session::flash('success',"Category successfully updated.");
						return redirect('admin/category-list');
					}
					else
					{
						Session::flash('fail',"Something wrong, Try again.");
						return back()->withInput();
					}
		
			   }
				catch(\Exception $e)
				{
					Session::flash('fail',$e->getMessage());
					return back()->withInput();
				}
			} 
		}
	}


public function viewCategories(Request $request)
    {
      $id=User::getVendorId();

	  $cats = Category::select ('category.*','users.shop_name')
	  ->leftJoin('users','category.created_by','=','users.pk_user_id')->orderby('pk_category_id','Desc')->get();
	
        return Datatables::of($cats)
		->addIndexColumn()
		->editColumn('image_file', function ($row) {
            if ($row->image_file !='') {
                return  '<img src='.FileUpload::viewFile($row->image_file,'local').' width="75" height="60" data-id='.$row->pk_category_id.'" id="imgUpload" style="cursor:pointer" title="Click to change image"> </img>';
            } else {
                return "--Nil--";
            }
        })
		
		->editColumn('created_by', function ($row) {
            
			$usr_na=substr($row->shop_name,0,8)."...";
			$usr_na='<span style="color:#175dc7;" title="'.$row->shop_name.'">'.$usr_na."<span>";
			return $usr_na;
        })
		
		->addColumn('status', function ($row) {
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
				$btn='<li><a class="dropdown-item btn-act-deact" href="javascript:void(0)" id="'.$row->pk_category_id.'" data-option="2" ><i class="lni lni-close"></i> Deactivate</a></li>';
			}
			else
			{
				$btn='<li><a class="dropdown-item btn-act-deact" href="javascript:void(0)" id="'.$row->pk_category_id.'" data-option="1"><i class="lni lni-checkmark"></i> Activate</a></li>';
			}

			$action='<div class="fs-5 ms-auto dropdown">
                          <div class="dropdown-toggle dropdown-toggle-nocaret cursor-pointer" data-bs-toggle="dropdown"><i class="fadeIn animated bx bx-dots-vertical"></i></div>
                            <ul class="dropdown-menu">
                              <li><a class="dropdown-item cat-edit" href="javascript:void(0)" id="'.$row->pk_category_id.'"  ><i class="lni lni-pencil-alt"></i> Edit</a></li>
                              <li><a class="dropdown-item cat-delete" href="javascript:void(0)" id="'.$row->pk_category_id.'"><i class="lni lni-trash"></i> Delete</a></li>'
							   .$btn.
							  '</ul>
                        </div>';
			return $action;
        })
        ->rawColumns(['action','image_file','created_by','status'])
        ->make(true);
    }
	
public function updateCategoryImage(Request $request)
{
		$file_image= $request->picField;  
        $cat =  Category::where('pk_category_id',$request->scrId)->first();
        $file_image= $request->picField;
        $path_list='/category/';
        $filename = mt_rand(). '.' . $file_image->getClientOriginalExtension();
        FileUpload::uploadFile($file_image, $path_list,$filename,'local');

        $cat->image_file=$path_list.$filename;                    
        $cat->save();

        return redirect()->back()->with('success', 'Image update successfully!');

}


public function edit($id)
{
	$cat=Category::where('pk_category_id',$id)->first();
	return response()->json(['data'=>$cat,'status'=>True]);
}


public function destroy($id)
{
	try
	{
		$cat=Category::where('pk_category_id',$id)->first();
		
		if($cat)
		{
			Storage::disk('local')->delete($cat->image_file);
			$res=$cat->delete();
			if($res)
			{   
				return response()->json(['msg'=>'Category successfully removed.','status'=>true]);
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

		$result=Category::where('pk_category_id',$id)->update($new);
		
			if($result)
			{
				if($op==1)
					return response()->json(['msg' =>'Category successfully activated!' , 'status' => true]);
				else
				    return response()->json(['msg' =>'Category successfully deactivated!' , 'status' => true]);
			}
			else
			{
				return response()->json(['msg' =>'Something wrong, try again!' , 'status' => false]);
			}				

	}


}
