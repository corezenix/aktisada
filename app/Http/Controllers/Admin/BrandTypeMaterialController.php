<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Str;

use App\Models\SlideImage;
use App\Common\Variables;
use App\Facades\FileUpload;
use App\Models\User;
use App\Models\Brand;
use App\Models\ItemType;
use App\Models\Material;
use App\Models\ItemSize;
use App\Models\Category;

use DB;
use Auth;
use Validator;
use DataTables;

//use App\Http\Resources\Testimonial\TestimonialResource;

class BrandTypeMaterialController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.brand_type_material.brands');
    }
	
	 public function itemType()
    {
        return view('admin.brand_type_material.item_type');
    }
	
	 public function materialType()
    {
        return view('admin.brand_type_material.material_type');
    }
	
	 public function itemSize()
    {
		$cat=Category::all();       
	   return view('admin.brand_type_material.item_size',compact('cat'));
    }
	
	
    public function getBrands()
    {
		
      $vendorId=User::getVendorId();
	  
      $ads = Brand::orderby('pk_brand_id','Desc')->get();
        
        return Datatables::of($ads)
        ->addIndexColumn()
        
        ->addColumn('action', function ($row) {

				$action='<a href="javascript:;" class="brand-delete" id="'.$row->pk_brand_id.'"><i class="lni lni-trash" style="font-size:16px;"></i></a>';
				return $action;
        })
        ->rawColumns(['action'])
        ->toJson(true);
    }
		

    public function store(Request $request)
    {
      	$input = $request->all();
      	$userId=Auth::user()->pk_user_id;
        $validator=Validator::make($input, ['brand_name'=>'required'],[]);
        if ($validator->fails()) 
        {
			return response()->json(['msg'=>$validator->messages(), 'status' => false]);
		}
		else
		{
       		try
            {
					$br = new Brand();
					$br->brand_name = $request->brand_name;
					$flag=$br->save();
					
					if($flag)
					{
						 return response()->json(['msg'=>'Brand successfully added.', 'status'=>true]);
					}
					else
					{
						 return response()->json(['msg'=>'Something went wrong, please try again later.', 'status'=>false]);
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
            $sld = Brand::find($id);
                if ($sld) {
                    $sld->delete();
                    return response(['msg' => 'Brand has been deleted.', 'status' => true]);
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
//--------------------------------------------------------------------------------------------


public function getItemTypes()
    {
		
      $vendorId=User::getVendorId();
	  
      $ads = ItemType::orderby('pk_type_id','Desc')->get();
        
        return Datatables::of($ads)
        ->addIndexColumn()
        
        ->addColumn('action', function ($row) {

				$action='<a href="javascript:;" class="type-delete" id="'.$row->pk_type_id.'"><i class="lni lni-trash"></i></a>';
				return $action;
        })
        ->rawColumns(['action'])
        ->toJson(true);
    }
		

    public function saveItemType(Request $request)
    {
      	$input = $request->all();
      	$userId=Auth::user()->pk_user_id;
        $validator=Validator::make($input, ['type_name'=>'required'],[]);
        if ($validator->fails()) 
        {
			return response()->json(['msg'=>$validator->messages(), 'status' => false]);
		}
		else
		{
       		try
            {
					$ity = new ItemType();
					$ity->type_name = $request->type_name;
					$flag=$ity->save();
					
					if($flag)
					{
						 return response()->json(['msg'=>'Type successfully added.', 'status'=>true]);
					}
					else
					{
						 return response()->json(['msg'=>'Something went wrong, please try again later.', 'status'=>false]);
					}

            }
            catch(\Exception $e)
            {
                return response()->json(['msg'=>$e->getMessage(), 'status' => false]);
            }
        } 

    }


    public function deleteType($id)
    {
       try 
       {
            $sld = ItemType::find($id);
                if ($sld) {
                    $sld->delete();
                    return response(['msg' => 'Type has been deleted.', 'status' => true]);
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


//--------------------------------------------------------------------------------------------


public function getMaterials()
    {
		
      $vendorId=User::getVendorId();
	  
      $mat = Material::orderby('pk_material_id','Desc')->get();
        
        return Datatables::of($mat)
        ->addIndexColumn()
        
        ->addColumn('action', function ($row) {

				$action='<a href="javascript:;" class="mat-delete" id="'.$row->pk_material_id.'"><i class="lni lni-trash"></i></a>';
				return $action;
        })
        ->rawColumns(['action'])
        ->toJson(true);
    }
		

    public function saveMaterial(Request $request)
    {
      	$input = $request->all();
      	$userId=Auth::user()->pk_user_id;
        $validator=Validator::make($input, ['material'=>'required'],[]);
        if ($validator->fails()) 
        {
			return response()->json(['msg'=>$validator->messages(), 'status' => false]);
		}
		else
		{
       		try
            {
					$ma = new Material();
					$ma->material_name = $request->material;
					$flag=$ma->save();
					
					if($flag)
					{
						 return response()->json(['msg'=>'Material successfully added.', 'status'=>true]);
					}
					else
					{
						 return response()->json(['msg'=>'Something went wrong, please try again later.', 'status'=>false]);
					}

            }
            catch(\Exception $e)
            {
                return response()->json(['msg'=>$e->getMessage(), 'status' => false]);
            }
        } 

    }


    public function deleteMaterial($id)
    {
       try 
       {
            $sld = Material::find($id);
                if ($sld) {
                    $sld->delete();
                    return response(['msg' => 'Material has been deleted.', 'status' => true]);
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


//--------------------------------------------------------------------------------------------



public function getItemSizes()
    {
		
      $vendorId=User::getVendorId();
	  
      $dat = ItemSize::select('item_sizes.*','category.pk_category_id','category.category')
			->leftJoin('category','item_sizes.category_id','=','category.pk_category_id')->orderby('pk_size_id','Desc')->get();
        
        return Datatables::of($dat)
        ->addIndexColumn()
        
        ->addColumn('action', function ($row) {

				$action='<a href="javascript:;" class="size-delete" id="'.$row->pk_size_id.'"><i class="lni lni-trash"></i></a>';
				return $action;
        })
        ->rawColumns(['action'])
        ->toJson(true);
    }
		

    public function saveItemSize(Request $request)
    {
      	$input = $request->all();
      	$userId=Auth::user()->pk_user_id;
        $validator=Validator::make($input, ['item_size'=>'required','category'=>'required'],[]);
        if ($validator->fails()) 
        {
			return response()->json(['msg'=>$validator->messages(), 'status' => false]);
		}
		else
		{
       		try
            {
					$its = new ItemSize();
					$its->category_id = $request->category;
					$its->item_size = $request->item_size;
					$flag=$its->save();
					
					if($flag)
					{
						 return response()->json(['msg'=>'Item size successfully added.', 'status'=>true]);
					}
					else
					{
						 return response()->json(['msg'=>'Something went wrong, please try again later.', 'status'=>false]);
					}

            }
            catch(\Exception $e)
            {
                return response()->json(['msg'=>$e->getMessage(), 'status' => false]);
            }
        } 

    }


    public function deleteItemSize($id)
    {
       try 
       {
            $sld = ItemSize::find($id);
                if ($sld) {
                    $sld->delete();
                    return response(['msg' => 'Item size has been deleted.', 'status' => true]);
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


//--------------------------------------------------------------------------------------------




}
