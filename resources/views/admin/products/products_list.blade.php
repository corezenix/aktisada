@extends('layouts.master')
@section('title','Aktisada')
@section('contents')
<style>
.card-body{
	padding-top:2px !important;
}
.td-count
{
	width:10%;
}
.td-desc
{
	width:30%;
}				

.select2-selection--single
{
	height: 38px !important;
    border: 1px solid #dfdbdb !important;
    padding: 3px 3px !important;		
}
.select2-selection__arrow
{
	margin-top:4px;
}
</style>

		<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
              <div class="breadcrumb-title pe-3">Products</div>
 
             <!-- <div class="ms-auto">
                <div class="btn-group">
                  <button type="button" class="btn btn-primary">Settings</button>
                  <button type="button" class="btn btn-primary split-bg-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown">	<span class="visually-hidden">Toggle Dropdown</span>
                  </button>
                  <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-end">	<a class="dropdown-item" href="javascript:;">Action</a>
                    <a class="dropdown-item" href="javascript:;">Another action</a>
                    <a class="dropdown-item" href="javascript:;">Something else here</a>
                    <div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Separated link</a>
                  </div>
                </div>
              </div>  -->
            </div>
            <!--end breadcrumb-->

              <div class="card">
                <div class="card-header p-y-3">
				<div class="row">
				<div class="col-lg-9 col-xl-9 col-xxl-9 col-9">
				   <h6 class="mb-0 pt5 mt-2"><i class="fa fa-users"></i> Products List</h6>
				  </div>
				  <div class="col-lg-3 col-xl-3 col-xxl-3 col-3 text-right">
				  
				     <a href="javascript:;" class="btn btn-primary" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" ><i class="lni lni-funnel"></i></a>&nbsp;&nbsp;&nbsp;
					 <a href="javascript:;" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add-product" ><i class="lni lni-plus"></i> Add Product</a>
				    
				  </div>
				  </div>
                </div>
                <div class="card-body">
				
					<div class="accordion-item accordion-item-bm" >
                        <div id="flush-collapseOne" class="accordion-collapse collapse show" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample" >
                         <div class="accordion-body">
						 <!-- <label style="font-weight:500;padding:5px 10px;" > Filter By: </label>-->
						  
						  
						  <!--<form method="POST" id="export_redeem_history"  action="{{url('users/export-web-customers-list')}}" enctype="multipart/form-data" >
							@csrf  -->
						  
						   <div class="row" style="padding:10px 10px 10px 10px;" >						
							<div class="col-6 col-lg-3 col-xl-3 col-xxl-3 d-flex">
								<label class="mt-2" style="width:150px;font-weight:500;">Filter Branch</label>
								<select id="branch_user" name="branch_user" class="form-control" >
                                 <option value="">Select Branch</option>
								  
								</select>
							</div>

								
							<div class="col-6 col-lg-3 col-xl-3 col-xxl-3 d-flex">
								<label class="mt-2" style="width:150px;font-weight:500;">Filter Branch</label>
								<select id="branch_user" name="branch_user" class="form-control" >
                                 <option value="">Select Branch</option>
								 
								</select>
							</div>

							<!--<div class="col-3 col-lg-3 col-xl-3 col-xxl-3" style="padding-top:22px;">
							<button type="button" class="btn btn-primary btn-xs" id="btn-filter" > <i class="lni lni-funnel"></i> Filter</button>&nbsp;&nbsp;
							<button type="button" class="btn btn-secondary btn-xs me-2" id="btn-clear-filter" > Clear</button>&nbsp;&nbsp;
							<button type="submit" class="btn btn-secondary btn-xs"  > <i class="lni lni-download"></i> Download</button>
							</div> -->

						   </div>

						   <!--</form>-->
						   
						</div>
					  </div>
				</div>

				
				<!---  filer end ----------------------------------------->
				<div class="row mt-3">
                     <div class="col-12 col-lg-12  text-right">
					 <label>Total : <span style="font-weight:600;" id="web_count"></span></label>
					 
					 </div>
				</div>
	
                <div class="row">
                     <div class="col-12 col-lg-12 d-flex">
                      <div class="card  shadow-none w-100">
					  
						<ul class="nav nav-tabs nav-primary mt-2" role="tablist">
							<li class="nav-item" role="presentation">
								<a class="nav-link active" data-bs-toggle="tab" href="#primaryhome" role="tab" aria-selected="false" tabindex="-1">
									<div class="d-flex align-items-center">
										<div class="tab-icon"><i class="bx bx-user-pin font-18 me-1"></i>
										</div>
										<div class="tab-title">Products List</div>
									</div>
								</a>
							</li>

						</ul>
					  <div class="tab-content py-3">
						<div class="tab-pane fade show active" id="primaryhome" role="tabpanel">

						  <div class="table-responsive">
	
                             <table id="datatable" class="table align-middle" style="width:100% !important;" >
                               <thead class="thead-semi-dark" >
								<tr>
									<th>Sl No</th>
									<th>Image</th>
									<th>Title</th>
									<th>Category</th>
									<th>Brand</th>
									<th>Type</th>
									<th>Material</th>
									<th>Size</th>
									<th>Qty</th>
									<th>Flush Type</th>
									<th>Description</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
                               </thead>
                               <tbody>
                                  
                               </tbody>
                             </table>
                          </div>
						  
						  </div>
					  </div>

					  
                        <!--<div class="card-body">-->
                          

                       <!-- </div>-->
                      </div> 
                    </div>
                   </div><!--end row-->
                </div>
        </div>
 
 
 
<div class="modal fade" id="add-product" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" >
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			
			<div class="modal-body" style="padding:20px 40px;">
			
				<form id="formChangePassword">
				@csrf
					<input type="hidden" name="user_id" id="user_id">
					
					<div class="row mb-2" >
						<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
							<label for="address" class="form-label">Product Title</label>
							<input type="text" class="form-control"  name="product_title" id="product_title" placeholder="product name" required>
						</div>
					</div>
					<div class="row mb-2" >
						<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
							<label for="address" class="form-label">Category</label>
							<select class="form-control"  name="category" id="category" placeholder="category" required>
							<option value="">select</option>
							</select>
						</div>
					</div>
					
					<div class="row mb-2" >
						<div class="col-12 col-lg-6 col-xl-6 col-xxl-6">
							<label for="address" class="form-label">Brand Name</label>
							<select class="form-control"  name="brand_name" id="brand_name" placeholder="brand name" required>
							<option value="">select</option>
							</select>
						</div>

						<div class="col-12 col-lg-6 col-xl-6 col-xxl-6">
							<label for="address" class="form-label">Type Name</label>
							<select class="form-control"  name="type_name" id="type_name" placeholder="type name" required>
							<option value="">select</option>
							</select>
						</div>
					</div>
					
					<div class="row mb-2" >
						<div class="col-12 col-lg-6 col-xl-6 col-xxl-6">
							<label for="address" class="form-label">Material Type</label>
							<select class="form-control"  name="material_type" id="material_type" placeholder="material_type" required>
							<option value="">select</option>
							</select>
						</div>

						<div class="col-12 col-lg-6 col-xl-6 col-xxl-6">
							<label for="address" class="form-label">Item Size</label>
							<select class="form-control"  name="item_size" id="item_size" placeholder="item_size" required>
							<option value="">select</option>
							</select>
						</div>
					</div>
					
					<div class="row mb-2" >
						<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
							<label for="address" class="form-label">Flush Type</label>
							<select class="form-control"  name="flush_type" id="flush_type" placeholder="flush type" required>
							<option value="">select</option>
							</select>
						</div>
					</div>
					
					<div class="row mb-2" >
						<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
							<label for="address" class="form-label">Quantity</label>
							<input type="text" class="form-control"  name="quantity" id="quantity" placeholder="quantity">
						</div>
					</div>
					<div class="row mb-2" >
						<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
							<label for="address" class="form-label">Description</label>
							<textarea rows=2 class="form-control"  name="description" id="description" placeholder="description"></textarea>
						</div>
					</div>
					
					<div class="row mb-2" >
						<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
							<label for="address" class="form-label">Image size(150x125)</label>
							<input type="file" class="form-control"  name="image_file" id="image_file" placeholder="image_file">
						</div>
					</div>
					
					
					<div class="row mb-2" >
						<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
							<label for="address" class="form-label">Select User</label>
							<select class="form-control"  name="user_id" id="user_id" placeholder="user" required>
							<option value="">select</option>
							</select>
						</div>
					</div>
					
					<div class="modal-footer mt-3">
								<div class="col-lg-12 col-xl-12 col-xxl-12 text-end">
								<button type="button" class="btn btn-danger" data-bs-dismiss="modal" aria-label="Close">Close</button>
								<button class="btn btn-primary" type="submit"> Submit </button>
								</div>
					</div>
				</form>
				
			</div>
		</div>
	</div>
</div>	  
			  
 
 
 
 
		
@push('scripts')


@if(Session::get('success'))
	<script>
		toastr.success("{{Session::get('success')}}");
	</script>
@endif

@if (Session::get('fail'))
	<script>
		toastr.error("{{Session::get('fail')}}");
	</script>
@endif

<script>

BASE_URL ={!! json_encode(url('/')) !!}

$("#branch").select2();
$("#campaign").select2();


var table2 = $('#datatable').DataTable({
        processing: true,
        serverSide: true,
		stateSave:true,
		paging     : true,
        pageLength :50,
		
		'pagingType':"simple_numbers",
        'lengthChange': true,
				
		ajax:
		{
			url:BASE_URL+"/admin/get-products-list",
			data: function (data) 
		    {
               //data.branch_user = $('#branch_user').val();
		    },
        },
		columns: [
		   {"data": 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false  },
		   {data: 'image', name: 'image'},
		   {data: 'product_title', name: 'product_title'},
		   {data: 'category', name: 'category'},
		   {data: 'brand_name', name: 'brand_name'},
		   {data: 'type_name', name: 'type_name'},
		   {data: 'material_name', name: 'material_name'},
		   {data: 'item_size', name: 'item_size'},
		   {data: 'quantity', name: 'quantity'},
		   {data: 'flush_type', name: 'flush_type'},
		   {data: 'description', name: 'description'},
		   {data: 'status', name: 'status'},
		   {data: 'action', name: 'action', orderable: false, searchable: false}
	   ],
		

});

$("#branch_user").change(function()
{
	$('#datatable').DataTable().ajax.reload(function (json) {
		$("#app_count").html(json.recordsTotal);
	});
	
});

$("#btn-filter").click(function()
{
	$('#datatable').DataTable().ajax.reload(function (json) {
		$("#web_count").html(json.recordsTotal);
	});

});


$('#datatable').on('click', '.scratch-web-redeem', function (event) {
           event.preventDefault();
           var customer_id = $(this).attr('customer-id');

           var url = BASE_URL + '/user/scratch-web-redeem/' + customer_id;
   
			Swal.fire({
				  //title: "Are you sure?",
				  text: "Are you sure, You want to redeem now?",
				  icon: "question",
				  showCancelButton: true,
				  confirmButtonColor: "#3085d6",
				  cancelButtonColor: "#d33",
				  confirmButtonText: "Yes, Redeem it!"
				}).then((result) => {
				  if (result.isConfirmed) {
					
					var tid=$(this).attr('id');
					
					  $.ajax({
					  url: BASE_URL + '/users/scratch-web-redeem/' + customer_id,
					  type: 'get',
					  dataType: 'json',
					  //data:{'track_id':tid},
					  success: function (res) 
					  {
						if(res.status==1)
						{
							 toastr.success(res.msg);
							 $('#datatable').DataTable().ajax.reload(null,false);
						}
						else
						{
							 toastr.error(res.msg);
						}
					  }
					});

				  }
				});
       });


$(document).on('click','#btn-clear-filter',function()
{
	
	location.reload();


});


/*

$("#export-to-excel").click(function()
{
	var sdt=new Date($("#start_date").val());
	var edt=new Date($("#end_date").val());
		
	if(sdt!="" && edt!="")
	{
		
		var sDate = [sdt.getFullYear(), sdt.getMonth() + 1,sdt.getDate()].join('-');
		var eDate = [edt.getFullYear(), edt.getMonth() + 1,edt.getDate()].join('-');
		
		var lnk="{{url('users/export-web-customers-list')}}"+"/"+sDate+"/"+eDate;
	    $("#export-to-excel").attr('href',lnk);	
	}
	else
	{
		var sDate="0";
		var eDate="0";
		var lnk="{{url('users/export-web-customers-list')}}"+"/"+sDate+"/"+eDate;
	    $("#export-to-excel").attr('href',lnk);
	}
});
*/


</script>
@endpush
@endsection
