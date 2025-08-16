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
</style>

<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
              <div class="breadcrumb-title pe-3">Brands</div>
 
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

 <div class="row">
	<div class="col-lg-4 col-xl-4 col-xxl-4">
					  

              <div class="card">
                <div class="card-header p-y-3">
				<div class="row">
				<div class="col-lg-9 col-xl-9 col-xxl-9 col-9">
				   <h6 class="mb-0 pt5 mt-2">Brands</h6>
				  </div>
				  <div class="col-lg-3 col-xl-3 col-xxl-3 col-3 text-right">
				     <!--<a href="javascript:;" class="btn btn-gl-primary" ><i class="lni lni-upload"></i>&nbsp;Export</a>-->
				  </div>
				  </div>
                </div>
                <div class="card-body">

                      <div class="card  shadow-none w-100 mt-2">
					  
							<!--  <form method="POST" id="SaveAdsImage" action="{{url('users/save-ads-image')}}"enctype="multipart/form-data">--->
							
							<form id="AddBrand" enctype="multipart/form-data">
								@csrf
							  <div class="mb-2 row">
																  
									<div class="col-lg-11 col-xl-11 col-xxl-11 mt-2">
										<label for="example-text-input" class="col-form-label">Brand Name </label>
										<input class="form-control" type="text" name="brand_name" id="brand_name" required>
										</div>
																
									<div class="col-lg-11 col-xl-11 col-xxl-11 mt-3">
									<button type="submit" id="btnBrandSave" class="btn btn-primary">Submit </button>
									</div>
							  </div>
							  </form>
					  
						  </div>
						  </div>
                       <!-- </div>-->
                   </div><!--end row-->
                </div>
				
			<div class="col-lg-8 col-xl-8 col-xxl-8">

              <div class="card">
                <div class="card-header p-y-3">
				<div class="row">
				<div class="col-lg-9 col-xl-9 col-xxl-9 col-9">
				   <h6 class="mb-0 pt5 mt-2">Brands</h6>
				  </div>
				  <div class="col-lg-3 col-xl-3 col-xxl-3 col-3 text-right">
				     <!--<a href="javascript:;" class="btn btn-gl-primary" ><i class="lni lni-upload"></i>&nbsp;Export</a>-->
				  </div>
				  </div>
                </div>
                <div class="card-body">

                      <div class="card  shadow-none w-100 mt-2">
					  
                        <!--<div class="card-body">-->
                          <div class="mt-3 table-responsive">
	
                             <table id="datatable" class="table align-middle" style="width:100% !important;" >
                               <thead class="thead-semi-dark">
								<tr>
									<th style="width:60px;">Sl No</th>
									<th>Brand</th>
									<th style="width:60px;">Action</th>
								</tr>
                               </thead>
                               <tbody>
                                
                               </tbody>
                             </table>
                          </div>
						  
						  </div>
						  </div>
                       <!-- </div>-->
                   </div><!--end row-->
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


var table = $('#datatable').DataTable({
        processing: true,
        serverSide: true,
		stateSave:true,
		paging     : true,
        pageLength :50,
		scrollX: true,
		
		'pagingType':"simple_numbers",
        'lengthChange': true,
				
		ajax:
		{
			url:BASE_URL+"/admin/get-brands",
			data: function (data) 
		    {
               //data.search = $('input[type="search"]').val();
		    },
        },
		columns: [
		   {"data": 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false  },
		   {data: 'brand_name', name: 'brand_name'},
		   {data: 'action', name: 'action', orderable: false, searchable: false}
	   ],

});


 $(document).on('submit', '#AddBrand', function(event) {
           event.preventDefault();
			$.ajax({
                    url: BASE_URL + '/admin/save-brand',
                    type: 'POST',
                    dataType: 'json',
                    data:  new FormData(this),
                    contentType: false,
                    processData:false,
                })
                .done(function(res) {
                    if(res.status == true){
                    toastr.success(res.msg);
					 $('#datatable').DataTable().ajax.reload(null, false);
					 $("#brand_name").val("");
					
                }else{
                   toastr.error(res.msg);
                }
                })
                .fail(function() {
                })
                 .always(function(com) {
            });
       });


$('#datatable tbody').on('click','.brand-delete',function()
{
	Swal.fire({
	  //title: "Are you sure?",
	  text: "Are you sure, You want to delete this slide?",
	  icon: "question",
	  showCancelButton: true,
	  confirmButtonColor: "#3085d6",
	  cancelButtonColor: "#d33",
	  confirmButtonText: "Yes, Delete it!"
	}).then((result) => {
	  if (result.isConfirmed) {
		
		var tid=$(this).attr('id');
		
		  $.ajax({
          url: "{{url('admin/delete-brand')}}"+'/'+tid,
          type: 'get',
		  dataType: 'json',
          //data:{'track_id':tid},
          success: function (res) 
		  {
			if(res.status==1)
			{
				 toastr.success(res.msg);
				 $("#datatable").DataTable().ajax.reload(null,false);
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



</script>
@endpush
@endsection
