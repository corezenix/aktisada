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

use DB;
use Auth;
use Validator;
use DataTables;

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
        return view('admin.products.products_list');
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
	  ->leftJoin('materials','products.material_id','=','materials.pk_material_id')
	  ->orderby('pk_product_id','Desc')->get();
        
        return Datatables::of($ads)
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
				$btn='<li><a class="dropdown-item btn-act-deact" href="javascript:void(0)" id="'.$row->pk_slide_id.'" data-option="2" ><i class="lni lni-close"></i> Deactivate</a></li>';
			}
			else
			{
				$btn='<li><a class="dropdown-item btn-act-deact" href="javascript:void(0)" id="'.$row->pk_slide_id.'" data-option="1"><i class="lni lni-checkmark"></i> Activate</a></li>';
			}
				$action='<div class="fs-5 ms-auto dropdown">
							  <div class="dropdown-toggle dropdown-toggle-nocaret cursor-pointer" data-bs-toggle="dropdown"><i class="fadeIn animated bx bx-dots-vertical"></i></div>
								<ul class="dropdown-menu">
								  <li><a class="dropdown-item slide-delete" href="javascript:void(0)" id="'.$row->pk_slide_id.'"><i class="lni lni-trash"></i> Delete</a></li>
								  '.$btn.'
								  </ul>
							</div>';
							
				return $action;
        })
        ->rawColumns(['action','status','image'])
        ->toJson(true);
    }
		

    public function store(Request $request)
    {
      	$input = $request->all();
      	$userId=Auth::user()->pk_user_id;
        $validator=Validator::make($input, ['image'=>'required'],[]);
       // if validator passes
        if ($validator->fails()) 
        {
			return response()->json(['msg'=>$validator->messages(), 'status' => false]);
		}
		else
		{
       		try
            {

				if ($request->hasFile('image')) 
            	{
					
					$path = 'slides/';

            		$file = $request->file('image');
					
					$sld = new SlideImage();
					$fileName="";
					$extension = $file->getClientOriginalExtension();
					$fileName = Str::random(5)."-".date('his')."-".Str::random(3).".".$extension;
					
					FileUpload::uploadFile($file, $path,$fileName,'local');
					$sld->image_file = $path.$fileName;
					$sld->created_by = $userId;
					$sld->status=1;
					$flag=$sld->save();
					
					if($flag)
					{
						 return response()->json(['msg'=>'Slide image successfully added.', 'status'=>true]);
					}
					else
					{
						 return response()->json(['msg'=>'Something went wrong, please try again later.', 'status'=>false]);
					}

            	}
				else
				{
					 return response()->json(['msg'=>'Image not found, Try again.', 'status'=>false]);
				}
                
            }
            catch(\Exception $e)
            {
                return response()->json(['msg'=>$e->getMessage(), 'status' => false]);
            }
        } 

    }


    public function destroy($id)
    {
       try 
       {
            $sld = SlideImage::find($id);
                if ($sld) {

					FileUpload::deleteFile($sld->image_file,'local');
                    $sld->delete();
                    return response(['msg' => 'Slide image has been deleted.', 'status' => true]);
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
