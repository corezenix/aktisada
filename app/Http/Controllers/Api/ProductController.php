<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Facades\FileUpload;

use App\Models\SlideImage;
use App\Models\User;
use App\Models\Brand;
use App\Models\Category;
use App\Models\ItemType;
use App\Models\Material;
use App\Models\Product;

use Carbon\Carbon;
use Hash;
use Validator;
use DB;
use Log;


class ProductController extends Controller
{
    //use CrmApiService;
	
	/**
    * To add new products .
    * Method : POST
    * @return \Illuminate\Http\Response
    */
    public function addProduct(Request $request)
    {
        $rule=[ 
			  'product_title'=>'required',
			  'user_id' =>'required',
			  'category_id'=>'required',
			  'brand_id'=>'required',
			  'type_id' =>'required',
			  'material_id' =>'required',
			  'item_size' =>'required',
			  'quantity' =>'required',
			  'image_file' =>'required',
        ];
        
        $validator = Validator::make($request->all(),$rule);
        if ($validator->passes()) 
        {
            try
            {
				$path='products/';
				$fname="";
				if($request->file('image_file'))
					{
						$image = $request->file('image_file');
						$name = rand(10, 100). date_timestamp_get(date_create()). '.' . $image->getClientOriginalExtension();
						FileUpload::uploadFile($image, $path,$name,'local');
						$fname=$path.$name;
					}
									
				$data=[
				  'product_title'=>$request->product_title,
				  'user_id' =>$request->user_id,
				  'category_id'=>$request->category_id,
				  'brand_id'=>$request->brand_id,
				  'type_id' =>$request->type_id,
				  'material_id' =>$request->material_id,
				  'item_size' =>$request->item_size,
				  'quantity' =>$request->quantity,
				  'image_file' =>$fname,
				  'flush_type'=>$request->flush_type,
				  'status'=>1
				];
				
				$result=Product::create($data);
				if($result)
				{
                    return response()->json(['message' => 'Product Successfully added','data'=>$result,'status' => true]); 
                }else
                    return response()->json(['message' => 'Something wrong, Try again.', 'status' => false]); 
			
            }catch(\Exception $e){
                return response()->json(['message' => $e->getMessage(), 'status' => false]);
            }
        } else{
            return response()->json(['message' => $validator->messages(), 'status' => false]);
        }
    }
	
	/**
    * Display a listing of the products.
    * Method: POST
    * @return \Illuminate\Http\Response
    */	
	
	
    public function getProducts(Request $request)
    {
		
		$rule=[ 
			  'category_id'=>'required',
        ];
        
        $validator = Validator::make($request->all(),$rule);
        if ($validator->passes()) 
        {
			try
			{
				$query=Product::select('products.*','category.pk_category_id','category.category','brands.pk_brand_id','brands.brand_name',
					'item_types.pk_type_id','item_types.type_name','materials.pk_material_id','materials.material_name','users.pk_user_id','users.shop_name')
					->leftJoin('category','products.category_id','=','category.pk_category_id')
					->leftJoin('brands','products.brand_id','=','brands.pk_brand_id')
					->leftJoin('item_types','products.type_id','=','item_types.pk_type_id')
					->leftJoin('materials','products.material_id','=','materials.pk_material_id')
					->leftJoin('users','products.user_id','=','users.pk_user_id')
					->where('products.category_id',$request->category_id);
					
					if($request->has('brand_id') && $request->brand_id!='')
					{
						$query->where('products.brand_id',$request->brand_id);
					}
					
					if($request->has('type_id') && $request->type_id!='')
					{
						$query->where('products.type_id',$request->type_id);
					}
					
					if($request->has('material_id') && $request->material_id!='')
					{
						$query->where('products.material_id',$request->material_id);
					}
					
					if($request->has('item_size') && $request->item_size!='')
					{
						$query->where('products.item_size','like','%'.$request->item_size.'%');
					}
					
					if($request->has('user_id') && $request->user_id!='')
					{
						$query->where('products.user_id',$request->user_id);
					}
				
				$products=$query->orderBy('products.pk_product_id','ASC')->simplePaginate(1)
				->through(function ($q) 
				{ 
					$q['image_path']=url('uploads').'/'.$q->image_file;
					return $q;
				 });

				
				if(!$products->isEmpty())
				{
					return response()->json(['message'=> 'products Successfully listed','data'=>$products,'status' => true]);
				}else{
					return response()->json(['message'=> 'Products Not Found', 'status' => false]); 
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
    * to remove the specified product.
    * Method: POST
    * @return \Illuminate\Http\Response
    */	


    public function deleteProduct(Request $request)
    {
		
		$rule=[ 
			  'product_id'=>'required',
        ];
        
        $validator = Validator::make($request->all(),$rule);
        if ($validator->passes()) 
        {
			try
			{
				$prod = Product::where('pk_product_id',$request->product_id)->first();
				if($prod)
				{
					FileUpload::deleteFile($prod->image_file,'local');
					$prod->delete();
					return response()->json(['message'=> 'Product successfully removed','status' => true]);
				}
				else
				{
					return response()->json(['message'=> 'Product not found.!','status' => false]);
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
    * to remove the specified product.
    * Method: POST
    * @return \Illuminate\Http\Response
    */	


    public function editProduct(Request $request)
    {
		
		$rule=[ 
			  'product_id'=>'required',
        ];
        
        $validator = Validator::make($request->all(),$rule);
        if ($validator->passes()) 
        {
			try
			{
				$prod = Product::where('pk_product_id',$request->product_id)->get()->map(function($q)
				{
					$q['image_path']=url('uploads').'/'.$q->image_file;
					return $q;
				});
				
				if(!$prod->isEmpty())
				{
					return response()->json(['message'=> 'products Successfully listed','data'=>$prod,'status' => true]);
				}
				else
				{
					return response()->json(['message'=> 'Product not found.!','status' => false]);
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
    * To update product.
    * Method: POST
    * @return \Illuminate\Http\Response
    */	
	

public function updateProduct(Request $request)
    {
        $rule=[ 
			  'product_id'=>'required',
			  'product_title'=>'required',
			  'category_id'=>'required',
			  'brand_id'=>'required',
			  'type_id' =>'required',
			  'material_id' =>'required',
			  'item_size' =>'required',
			  'quantity' =>'required',
			  'image_file' =>'required',
        ];
        
        $validator = Validator::make($request->all(),$rule);
        if ($validator->passes()) 
        {
            try
            {
				
				$prod=Product::where('pk_product_id',$request->product_id)->first();
								
				$path='products/';
				$fname=$prod->image_file;
				if($request->hasFile('image_file') and $request->file('image_file'))
					{
						$image = $request->file('image_file');
						$name = rand(10, 100). date_timestamp_get(date_create()). '.' . $image->getClientOriginalExtension();
						FileUpload::uploadFile($image, $path,$name,'local');
						FileUpload::deleteFile($prod->image_file,'local');
						$fname=$path.$name;
					}

				  $prod->product_title=$request->product_title;
				  $prod->user_id =$request->user_id;
				  $prod->category_id=$request->category_id;
				  $prod->brand_id=$request->brand_id;
				  $prod->type_id =$request->type_id;
				  $prod->material_id =$request->material_id;
				  $prod->item_size =$request->item_size;
				  $prod->quantity =$request->quantity;
				  $prod->image_file =$fname;
				  $prod->flush_type=$request->flush_type;
				  $result=$prod->save();
				  
                  return response()->json(['message' => 'Product Successfully updated','data'=>$prod,'status' => true]); 
               
			
            }catch(\Exception $e){
                return response()->json(['message' => $e->getMessage(), 'status' => false]);
            }
        } else{
            return response()->json(['message' => $validator->messages(), 'status' => false]);
        }
    }




/**
    * to remove the specified product.
    * Method: POST
    * @return \Illuminate\Http\Response
    */	


    public function getProductDetails(Request $request)
    {
		
		$rule=[ 
			  'product_id'=>'required',
        ];
        
        $validator = Validator::make($request->all(),$rule);
        if ($validator->passes()) 
        {
			try
			{
				$prod = Product::with('user')->where('pk_product_id',$request->product_id)->get()->map(function($q)
				{
					$q['image_path']=url('uploads').'/'.$q->image_file;
					return $q;
				});
				
				
				if(!$prod->isEmpty())
				{
					return response()->json(['message'=> 'Product Successfully listed','data'=>$prod,'status' => true]);
				}
				else
				{
					return response()->json(['message'=> 'Product not found.!','status' => false]);
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
			return response()->json(['message'=>$e->getMessage(), 'status' => 'fail']);
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
			$users = User::where('status',1)->where('role_id',2)->orderBy('id','ASC')->get();
			
			$data['categories']=$category;
			$data['brands']=$brands;
			$data['types']=$types;
			$data['material']=$material;
			$data['shops']=$users;
			
			return response()->json(['message'=> 'Detild Successfully listed','data'=>$data,'status' => true]);

		}catch(\Exception $e){
			return response()->json(['message'=>$e->getMessage(), 'status' => 'fail']);
		}
        
    }
	
	/**
    * Display a listing of the scratch types.
    * Method: POST
	* Parms: user_id (int),campaign_id (int)
    * @return \Illuminate\Http\Response
    */	
	
	

}