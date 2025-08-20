<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Str;

use App\Models\Product;
use App\Common\Variables;
use App\Facades\FileUpload;
use App\Models\User;
use App\Models\Category;
use App\Models\Brand;
use App\Models\ItemType;
use App\Models\ItemSize;
use App\Models\Material;

use DB;
use Auth;
use Validator;
use DataTables;
use Session;

//use App\Http\Resources\Testimonial\TestimonialResource;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
	 
    public function index()
    {
       $cats=Category::all();
	   $brands=Brand::all();
	   $usrs=User::where('role_id',2)->get();
	   return view('admin.products.products_list',compact('cats','brands','usrs'));
    }
	
	
    public function getProductsList(Request $request)
    {
		
      $vendorId=User::getVendorId();
	  
      $ads = Product::select('products.*','category.category','brands.brand_name','item_types.type_name',
	  'item_sizes.item_size','materials.material_name','users.shop_name')
	  ->leftJoin('users','products.user_id','=','users.pk_user_id')
	  ->leftJoin('category','products.category_id','=','category.pk_category_id')
	  ->leftJoin('brands','products.brand_id','=','brands.pk_brand_id')
	  ->leftJoin('item_types','products.type_id','=','item_types.pk_type_id')
	  ->leftJoin('item_sizes','products.item_size_id','=','item_sizes.pk_size_id')
	  ->leftJoin('materials','products.material_id','=','materials.pk_material_id');
	  	  
	  if($request->shop_id!="")
	  {
		  $ads->where('user_id',$request->shop_id);
	  }
	  
	  $res=$ads->orderBy('pk_product_id','DESC')->get();
        
        return Datatables::of($res)
        ->addIndexColumn()
		->editColumn('image', function ($row) {
            if ($row->image_file !='') {
                return  '<a href="'.FileUpload::viewFile($row->image_file,'local').'" target="_blank" title="View Image"><img class="img-border" src='.FileUpload::viewFile($row->image_file,'local').' width="80"></a>';
            } else {
                return "--Nil--";
            }
        })
				
		->addColumn('status', function ($row) {
            if ($row->status==1) {
                $status='<span class="badge rounded-pill bg-success">Active</span>';
            } else {
                $status='<span class="badge rounded-pill bg-danger">Inactive</span>';
            }
			return $status;
        })
        
        ->addColumn('action', function ($row) {
            if ($row->status == 1)
			{
				//$btn='<li><a class="dropdown-item btn-act-deact" href="javascript:void(0)" id="'.$row->pk_slide_id.'" data-option="2" ><i class="lni lni-close"></i> Deactivate</a></li>';
				$btn="";
			}
			else
			{
				$btn='<li><a class="dropdown-item btn-act-deact" href="javascript:void(0)" id="'.$row->pk_slide_id.'" data-option="1"><i class="lni lni-checkmark"></i> Activate</a></li>';
			}
				$action='<div class="fs-5 ms-auto dropdown">
							  <div class="dropdown-toggle dropdown-toggle-nocaret cursor-pointer" data-bs-toggle="dropdown"><i class="fadeIn animated bx bx-dots-vertical"></i></div>
								<ul class="dropdown-menu">
								  <li><a class="dropdown-item pro-delete" href="javascript:void(0)" id="'.$row->pk_product_id.'"><i class="lni lni-trash"></i> Delete</a></li>
								  '.$btn.'
								  </ul>
							</div>';
							
				return $action;
        })
        ->rawColumns(['action','status','image'])
        ->toJson(true);
    }
	
	public function getTypeSizeMaterial($catid)
	{
		$opt1=$opt2=$opt3="<option value=''>select</option>";
		
		$types=ItemType::where('category_id',$catid)->get();
		foreach($types as $row)
		{
			$opt1.="<option value='".$row->pk_type_id."'>".$row->type_name."</option>";
		}
		
		$sizes=ItemSize::where('category_id',$catid)->get();
		foreach($sizes as $row)
		{
			$opt2.="<option value='".$row->pk_size_id."'>".$row->item_size."</option>";
		}
		
		$mats=Material::where('category_id',$catid)->get();
		foreach($mats as $row)
		{
			$opt3.="<option value='".$row->pk_material_id."'>".$row->material_name."</option>";
		}
		
		$data['types']=$opt1;
		$data['sizes']=$opt2;
		$data['mats']=$opt3;
		
		return $data;
		
	}
	

    public function store(Request $request)
    {
      	$input = $request->all();
      	$userId=Auth::user()->pk_user_id;
		
		$rule=[
			'product_title'=>'required',
			'category'=>'required',
			'brand_name'=>'required',
			'user_id'=>'required',
			'type_name'=>'required',
			'material_type'=>'required',
			'description'=>'required',
			'item_size'=>'required',
			'quantity'=>'required',
			'image_file'=>'required',
		];
		
		
        $validator=Validator::make($input, $rule,[]);
       // if validator passes
        if ($validator->fails()) 
        {
			Session::flush('fail',$validator->messages()->first());
			return back()->withInput();
			//return response()->json(['msg'=>$validator->messages(), 'status' => false]);
		}
		else
		{
			$path = 'products/';
			$fname="";
			if ($request->hasFile('image_file')) 
			{
				$file = $request->file('image_file');
				$extension = $file->getClientOriginalExtension();
				$fileName = Str::random(5)."-".date('his')."-".Str::random(3).".".$extension;
				FileUpload::uploadFile($file, $path,$fileName,'local');
				$fname=$path.$fileName;
			}
				
				$pro = new Product();
				$pro->product_title=$request->product_title;
				$pro->category_id=$request->category;
				$pro->brand_id=$request->brand_name;
				$pro->user_id=$request->user_id;
				$pro->type_id=$request->type_name;
				$pro->material_id=$request->material_type;
				$pro->item_size_id=$request->item_size;
				$pro->quantity=$request->quantity;
				$pro->description=$request->description;
				$pro->flush_type=$request->flush_type??null;
				$pro->description=$request->description;
				$pro->image_file = $fname;
				$pro->status=1;
				$flag=$pro->save();
				
				if($flag)
				{
					Session::flash('success','Product image successfully added.');
					return redirect('/admin/products');
					 //return response()->json(['msg'=>'Product image successfully added.', 'status'=>true]);
				}
				else
				{
					Session::flash('fail','Something went wrong, please try again later.');
					// return response()->json(['msg'=>'Something went wrong, please try again later.', 'status'=>false]);
					return redirect()->back();
				}
        } 
    }


    public function destroy($id)
    {
       try 
       {
            $sld = Product::find($id);
                if ($sld) {

					FileUpload::deleteFile($sld->image_file,'local');
                    $sld->delete();
                    return response(['msg' => 'Product has been deleted.', 'status' => true]);
				}
                else
                {
                    return response(['msg' => 'Something Went Wrong', 'status' => false]);
                }
            
        }
        catch (\Exception $ex) {
          return response(['msg' => 'Something Went Wrong', 'status' => false]);

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

		$result=SlideImage::where('pk_slide_id',$id)->update($new);
		
			if($result)
			{
				if($op==1)
					return response()->json(['msg' =>'Slide successfully activated!' , 'status' => true]);
				else
				    return response()->json(['msg' =>'Slide successfully deactivated!' , 'status' => true]);
			}
			else
			{
				return response()->json(['msg' =>'Something wrong, try again!' , 'status' => false]);
			}				

	}


}
