@extends('layouts.master')
@section('title','Dashboard')
@section('contents')
<style>
.card-body{
	padding-top:2px !important;
}


</style>

<link href="{{ asset('assets/intl-tel-input17.0.3/intlTelInput.min.css')}}" rel="stylesheet"/>

<!-- for message -------------->
		<input type="hidden" id="view_message" value="{{ Session::get('message') }}">
<!-- for message end-------------->	


<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
              <div class="breadcrumb-title pe-3">Category</div>
 
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
                  <h6 class="mb-0 pt5">Category List&nbsp;</h6>
				  </div>
				  <div class="col-lg-3 col-xl-3 col-xxl-3 col-3 text-right">
				     <!--<a href="javascript:;" class="btn btn-gl-primary btn-xs"  data-bs-toggle="offcanvas" data-bs-target="#add-user" ><i class="fa fa-plus"></i>&nbsp;Add User</a>-->
				  </div>

				  </div>
                </div>
                <div class="card-body">

                   <div class="row mt-2">
                     <div class="col-12 col-lg-4 col-xl-4 col-xxl-4">
					 
					 <label><b> Add Category</b></label>
					 
					 <form id="formAddCategory"  method="post" action="{{url('admin/save-category')}}" enctype="multipart/form-data">
						@csrf
						
						<!-- for update ------------>
						<input type="hidden" name="old_image_file" id="old_image_file">
						<input type="hidden" name="category_id" id="category_id">
						<!-- ----------------->
						
						<div class="row mb-3 mt-3" >
							<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
								<label for="category" class="form-label">Category Name<span class="required">*</span></label>
								<input type="text" class="form-control"  name="category" id="category" placeholder="category" required>
							</div>
						</div>

						<div class="row mb-2" >
							<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
								<label for="user_name" class="form-label">Image(size: 150x125)<span class="required">*</span></label>
								<input type="file" class="form-control"  name="image_file" id="image_file" placeholder="image" required>
							</div>
							
							<img class="mt-2 mb-2" src="" id="img_cat_output" style="width:200px;">

						</div>
					 
					 <div class="row mb-2">
						<div class="col-lg-12 col-xl-12 col-xxl-12 d-flex">
						    <button type="button" class="btn btn-danger hide" id="btn-clear">Clear</button> &nbsp;&nbsp;
							<button class="btn btn-primary" name="submit" id="btn-submit" value="submit" type="submit"> Submit </button>
						</div>
					</div>
					</form>
					 
					 </div>
					 <div class="col-12 col-lg-8 col-xl-8 col-xxl-8">
					 					 
                      <div class="card  shadow-none w-100">
                        <!--<div class="card-body">-->
                          <div class="table-responsive">
	
                             <table id="datatable" class="table align-middle" style="width:100% !important;" >
                               <thead class="thead-semi-dark">
                                 <tr>
									<th>SlNo</th>
									<th>Image</th>
									<th>Category </th>
									<th>Created by</th>
									<th>Status</th>
									<th class="no-content" style="width:50px;">Action</th>
								</tr>
                               </thead>
                               <tbody>
                                  
                               </tbody>
                             </table>
                          </div>

                       <!-- </div>-->
                      </div> 
                    </div>
                   </div><!--end row-->
                </div>
       </div>
			

<form id='foto' method="post" action="{{url('admin/update-category-image')}}" method="POST" enctype="multipart/form-data" >
	@csrf
	    <div style="height:0px;overflow:hidden"> 
        <input type="file" id="picField" name="picField" onchange="this.form.submit()" class="d-none"/> 
        <input type="hidden" id="scrId" name="scrId" /> 
        </div>
      
        <!--<i class='fa fa-camera' onclick="fileInput.click();"></i>-->
    </form> 



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


<script src="{{asset('assets/intl-tel-input17.0.3/intlTelInput.min.js')}}"></script>

<script>

BASE_URL ={!! json_encode(url('/')) !!}

/*
var phone_number = window.intlTelInput(document.querySelector("#mobile"), {
	  separateDialCode: true,
	  preferredCountries:["in"],
	  hiddenInput: "full_number",
	  utilsScript:"{{url('assets/intl-tel-input17.0.3/utils.js')}}"
	});
*/


//---------------------------------------------------------------------------

 $(document).on('click','#imgUpload',function(e){
        $('#picField').trigger('click');
        scrId = $(this).data('id')
        $('#scrId').val(scrId);
    })

image_file.onchange = evt => {
  const [file] = image_file.files

	var size=file.size;
	if(size>524288)
	{
		alert("Image size too large. Maximum 500Kb only");
		$(this).val('');
	}
	else
	{

        var allowedExtensions="";
	    allowedExtensions = /(\.jpg|\.jpeg|\.jpe|\.png)$/i; 
	    var filePath = file.name;
		console.log(file);
	
		if (!allowedExtensions.exec(filePath)) { 
			alert('Invalid file type, Try again.'); 
			$("#category_image").val('');
			$("#img_cat_output").prop('src','');
		}
		else
		{
			if (file) {
				img_cat_output.src = URL.createObjectURL(file)
			  }
		}  
	}
}






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
			url:BASE_URL+"/admin/view-categories",
			data: function (data) 
		    {
               //data.search = $('input[type="search"]').val();
		    },
        },

        columns: [
            {"data": 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false  },
			{"data": "category" },
			{"data": "image_file" },
			{"data": "created_by" },
			{"data": "status" },
			{"data": "action" ,name: 'Action',orderable: false, searchable: false },
        ],

});

			
var addValidator=$('#formAddUser').validate({ 
	
	rules: {
		user_name: {required: true,},
		email: {required: true,},
		//location: {required: true,},
		password: {required: true,minlength:6, maxlength:15},
		mobile: {required: true,},
	},

	submitHandler: function(form) 
	{
		//$("#btn-submit").attr('disabled',true).html('Saving <i class="fa fa-spinner fa-spin"></i>')
		
		//var code=phone_number.getSelectedCountryData()['dialCode'];
		//$("#country_code").val(code);
		
		$.ajax({
		url: "{{ url('admin/save-user') }}",
		method: 'post',
		data: $('#formAddUser').serialize(),
		success: function(result){
			if(result.status == 1)
			{
				$("#btn-submit").attr('disabled',false).html('Submit')
				$('#datatable').DataTable().ajax.reload(null,false);
				toastr.success(result.msg);
				$('#formAddUser')[0].reset();
			}
			else
			{
				toastr.error(result.msg);
			}
		}
		});
	  }
	});



$('#datatable tbody').on('click','.cat-delete',function()
{
	Swal.fire({
	  //title: "Are you sure?",
	  text: "Are you sure, You want to delete this category?",
	  icon: "question",
	  showCancelButton: true,
	  confirmButtonColor: "#3085d6",
	  cancelButtonColor: "#d33",
	  confirmButtonText: "Yes, Delete it!"
	}).then((result) => {
	  if (result.isConfirmed) {
		
		var tid=$(this).attr('id');
		
		  $.ajax({
          url: "{{url('admin/delete-category')}}"+'/'+tid,
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


$('#datatable tbody').on('click','.cat-edit',function()
{

	var id=$(this).attr('id');
	
		jQuery.ajax({
			type: "GET",
			url: "{{url('admin/edit-category')}}"+"/"+id,
			dataType: 'html',
			//data: {vid: vid},
			success: function(res)
			{
			   var dat=JSON.parse(res);
			   $("#category_id").val(dat.data.pk_category_id);
			   $("#category").val(dat.data.category);
			   var file="/uploads/"+dat.data.image_file;
			   $("#image_file").prop('required',false);
			   $("#old_image_file").val(dat.data.image_file);
			   $("#img_cat_output").attr('src',file);
			   $("#btn-submit").val('update').html("Update Category");
			   $("#btn-clear").removeClass('hide').addClass('show');
			}
		});
});


$(document).on('click','#btn-clear',function()
{
	$("#formAddCategory")[0].reset();
	$("#img_cat_output").attr('src','');
	$("#btn-submit").html("Submit").val('submit');
	$("#old_image_file").val("");	
	$("#btn-clear").removeClass('show').addClass('hide');
	$("#image_file").prop('required',true);
});




$("#datatable tbody").on('click','.btn-act-deact',function()
{
	var opt=$(this).data('option');
	var id=$(this).attr('id');
	
	var opt_text=(opt==1)?"activate":"deactivate";
	optText=opt_text.charAt(0).toUpperCase()+opt_text.slice(1);
	
	Swal.fire({
	  title: optText+"?",
	  text: "You want to "+opt_text+" this user?",
	  icon: "question",
	  showCancelButton: true,
	  confirmButtonColor: "#3085d6",
	  cancelButtonColor: "#d33",
	  confirmButtonText: "Yes, "+opt_text+" it!"
	}).then((result) => {
	  if (result.isConfirmed) {
		
		
		  jQuery.ajax({
			type: "get",
			url: BASE_URL+"/admin/act-deact-category/"+opt+"/"+id,
			dataType: 'json',
			//data: {vid: vid},
			success: function(res)
			{
			   if(res.status==true)
			   {
				   toastr.success(res.msg);
				   $('#datatable').DataTable().ajax.reload(null, false);
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
