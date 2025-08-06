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
              <div class="breadcrumb-title pe-3">Users</div>
 
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
                  <h6 class="mb-0 pt5">&nbsp;</h6>
				  </div>
				  <div class="col-lg-3 col-xl-3 col-xxl-3 col-3 text-right">
				     <a href="javascript:;" class="btn btn-gl-primary btn-xs"  data-bs-toggle="offcanvas" data-bs-target="#add-user" ><i class="fa fa-plus"></i>&nbsp;Add User</a>
					 <a href="javascript:;" class="btn btn-primary btn-xs"  data-bs-toggle="modal" data-bs-target="#import_user" ><i class="fa fa-plus"></i>&nbsp;Import User</a>
				  </div>

				  </div>
                </div>
                <div class="card-body">
					<div class="accordion-item accordion-item-bm" >
                        <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample" >
                          <div class="accordion-body">
						   <div class="row" style="padding:3px 10px 0px 10px;" >
							<div class="col-3 col-lg-3">
								<label>Center</label>
								<select class="form-control mb-3" id="flt_center" placeholder="center" required>
								<option value="">select</option>

								</select>
							</div>
							
							<div class="col-3 col-lg-3">
								<label>District</label>
								<select class="form-control mb-3" id="flt_district" placeholder="district" required>
								<option value="">select</option>

								</select>
							</div>
						   </div>
						</div>
					  </div>
					</div>
				
                   <div class="row mt-2">
                     <div class="col-12 col-lg-12 d-flex">
                      <div class="card  shadow-none w-100">
                        <!--<div class="card-body">-->
                          <div class="table-responsive">
	
                             <table id="datatable" class="table align-middle" style="width:100% !important;" >
                               <thead class="thead-semi-dark">
                                 <tr>
									<th>SlNo</th>
									<th>Id</th>
									<th>Shop Name</th>
									<th>Contact Person</th>
									<th>Country Code</th>
									<th>Mobile</th>
									<th>Whatsapp No</th>
									<th>Email</th>
									<th>Role</th>
									<th>Address</th>
									<th>Location</th>
									<th>city</th>
									<th>District</th>
									<th>State</th>
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
			
			
	<div class="offcanvas offcanvas-end shadow border-start-0 p-2" id="add-user" style="width:35% !important" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" aria-modal="true" role="dialog">
          <div class="offcanvas-header border-bottom">
            <h5 class="offcanvas-title" id="offcanvasScrollingLabel">Add User</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
          </div>
			<div class="offcanvas-body">

			<form id="formAddUser">
			@csrf
			
			<div class="row mb-2" >
				<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
					<label for="user_name" class="form-label">Shop Name<span class="required">*</span></label>
					<input type="text" class="form-control"  name="shop_name" id="shop_name" placeholder="Shop Name" required>
				</div>
			</div>

			<div class="row mb-2" >
				<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
					<label for="user_name" class="form-label">Contact Person<span class="required">*</span></label>
					<input type="text" class="form-control"  name="contact_person" id="contact_person" placeholder="contact Person" required>
				</div>
			</div>
			<div class="row mb-2" >
				<div class="col-12 col-lg-2 col-xl-2 col-xxl-2">
					<label for="mobile" class="form-label">Code<span class="required">*</span></label>
					<select class="form-control" name="country_code" id="country_code" required>
					<!--<option value="">Code</option>-->
					<option value="91" selected>+91</option>
					</select>
				</div>	
				
				<div class="col-12 col-lg-5 col-xl-5 col-xxl-5">
					<label for="email" class="form-label">Whatsapp No<span class="required">*</span></label>
					<input type="text" class="form-control"  name="mobile" id="mobile" placeholder="mobile" required>
				</div>
				
				<div class="col-12 col-lg-5 col-xl-5 col-xxl-5">
					<label for="email" class="form-label">Whatsapp No<span class="required">*</span></label>
					<input type="text" class="form-control"  name="whatsapp_no" id="whatsapp_No" placeholder="Whatsapp No" required>
				</div>
				
				<!--<div class="col-12 col-lg-9 col-xl-9 col-xxl-9">
					<label for="mobile" class="form-label">Mobile<span class="required">*</span></label>
					<input type="hidden" class="form-control" name="country_code" id="country_code" value="91"  required>
					<br>
					<input type="tel" class="form-control" name="mobile" id="mobile" minlength=6 maxlength=15 required>
				</div>-->

			</div>
			
			<div class="row mb-2" >
				<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
					<label for="email" class="form-label">Email<span class="required">*</span></label>
					<input type="text" class="form-control"  name="email" id="email" placeholder="Email" required>
				</div>
			</div>
			
			<div class="row mb-2" >
				<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
					<label for="address" class="form-label">Address</label>
					<textarea rows=2  class="form-control"  name="address" id="address" placeholder="Address" ></textarea>
				</div>
			</div>

			<div class="row mb-2" >
				<div class="col-12 col-lg-6 col-xl-6 col-xxl-6">
					<label for="location" class="form-label">Location</label>
					<input type="text" class="form-control"  name="location" id="location" placeholder="Location">
				</div>
				<div class="col-12 col-lg-6 col-xl-6 col-xxl-6">
					<label for="location" class="form-label">City</label>
					<input type="text" class="form-control"  name="city" id="city" placeholder="City">
				</div>
			</div>
			
			
			<div class="row mb-2" >
				<div class="col-12 col-lg-6 col-xl-6 col-xxl-6">
					<label for="location" class="form-label">District</label>
					<input type="text" class="form-control"  name="district" id="district" placeholder="District">
				</div>
				<div class="col-12 col-lg-6 col-xl-6 col-xxl-6">
					<label for="location" class="form-label">State</label>
					<input type="text" class="form-control"  name="state" id="state" placeholder="state">
				</div>
			</div>
		
			<div class="row mb-2" >
				<div class="col-12 col-lg-4 col-xl-4 col-xxl-4">
					<label for="email" class="form-label">Pin-Code</label>
					<input type="text" class="form-control"  name="pincode" id="pincode" placeholder="Pincode" style="width:200px;" >
				</div>
	
				<div class="col-12 col-lg-8 col-xl-8 col-xxl-8">
					<label class="form-label">Password<span class="required">*</span></label>
					<input type="text" class="form-control"  name="password" id="password" value="123456" placeholder="Password" required>
				</div>
			</div>
			
			<div class="row mb-3" >
				<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
					<label for="user_role" class="form-label">Select Role<span class="required">*</span></label>
					<select  class="form-control"  name="role_id" id="role_id" placeholder="Role" required>
					<!--<option value="" > Select Role </option>-->
					<option value="1" selected> User </option>
					</select>
				</div>
			</div>
			
			
			<div class="row mb-2">
				<div class="col-lg-12 col-xl-12 col-xxl-12 text-end">
				<button type="button" class="btn btn-danger btn-offcanvas-close" data-bs-dismiss="offcanvas" aria-label="Close">Close</button>
				<button class="btn btn-primary" id="btn-submit" type="submit"> Submit </button>
				</div>
			</div>
			</form>
			  
            </div>
    </div>
		
		
		
	
	<div class="offcanvas offcanvas-end shadow border-start-0 p-2" id="edit-user" style="width:35% !important" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" aria-modal="true" role="dialog">
          <div class="offcanvas-header border-bottom">
            <h5 class="offcanvas-title" id="offcanvasScrollingLabel">Edit User</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
          </div>
			<div class="offcanvas-body">
  
            </div>
    </div>


<div class="modal fade" id="change-pass-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			
			<div class="modal-body">
			
				<form id="formChangePassword">
				@csrf
					<input type="hidden" name="user_id" id="user_id">
					
					<div class="row mb-2" >
						<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
							<label for="address" class="form-label">Password</label>
							<input type="text" class="form-control"  name="password" id="password" placeholder="Password" required>
						</div>
					</div>

					<div class="row mb-2" >
						<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
							<label>Confirm Password<span class="required">*</span></label>
							<input type="text" class="form-control"  name="confirm_password" id="confirm_password" value="" placeholder="confirm Password" required>
						</div>
					</div>
					<div class="row mb-2" >
						<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
							<label id="msg_err" class="text-red"></label><label id="msg" class="text-success"></label>
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

<div class="modal fade" id="import_user" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog ">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Import Users</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			
			<div class="modal-body">
			
				<form method="post" action="{{url('admin/user-imports')}}" enctype="multipart/form-data">
				@csrf
					<input type="hidden" name="user_id" id="user_id">
					
					<div class="row mb-2" >
						<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
							<label for="address" class="form-label">Select Excel file</label>
							<input type="file" class="form-control"  name="user_file" id="user_file" placeholder="select file" required>
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

/*
var mes=$('#view_message').val().split('#');

if(mes[0]=="success")
{	
	toastr.success(mes[1]);
}
else if(mes[0]=="danger")
{
	toastr.error(mes[1]);
}
*/

//---------------------------------------------------------------------------


$(document).on('change','#user_role', function()
{
	if($(this).val()=="child")
	{
		$(".admin-user-list").removeClass('hide').addClass('show');
		$(".admin_user_id").prop('required',true);
	}
	else
	{
		$(".admin-user-list").removeClass('show').addClass('hide');
		$(".admin_user_id").prop('required',false);
	}
});


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
			url:BASE_URL+"/admin/view-users",
			data: function (data) 
		    {
               //data.search = $('input[type="search"]').val();
		    },
        },

        columns: [
            {"data": 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false  },
			{"data": "pk_user_id" },
			{"data": "shop_name" },
			{"data": "contact_person" },
			{"data": "country_code" },
			{"data": "mobile" },
			{"data": "whatsapp_no" },
			{"data": "email" },
			{"data": "role_id" },
			{"data": "address" },
			{"data": "location" },
			{"data": "city" },
			{"data": "district" },
			{"data": "state" },
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



$('#datatable tbody').on('click','.delete-user',function()
{
	Swal.fire({
	  //title: "Are you sure?",
	  text: "Are you sure, You want to delete this user and it's all data?",
	  icon: "question",
	  showCancelButton: true,
	  confirmButtonColor: "#3085d6",
	  cancelButtonColor: "#d33",
	  confirmButtonText: "Yes, Delete it!"
	}).then((result) => {
	  if (result.isConfirmed) {
		
		var tid=$(this).attr('id');
		
		  $.ajax({
          url: "{{url('admin/delete-user')}}"+'/'+tid,
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




$('#datatable tbody').on('click','.edit-user',function()
{

	var id=$(this).attr('id');
	var Result=$("#edit-user .offcanvas-body");

			jQuery.ajax({
			type: "GET",
			url: "{{url('admin/edit-user')}}"+"/"+id,
			dataType: 'html',
			//data: {vid: vid},
			success: function(res)
			{
			   Result.html(res);
			}
		});
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
			url: BASE_URL+"/admin/act-deact-user/"+opt+"/"+id,
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

$('#datatable tbody').on('click','.change-pass',function()
{
	var id=$(this).attr('id');
	
	$('#formChangePassword')[0].reset();
	$("#user_id").val(id);
	
});
 
 
var validator=$('#formChangePassword').validate({ 
	
	rules: {
		password: {required: true,minlength:6, maxlength:20},
		confirm_password: {required: true,minlength:6, maxlength:20,
		equalTo: "#password"
		},
	},

	submitHandler: function(form) 
	{

		if($("#password").val()!=$("#confirm_password").val())
		{
			$("#msg_err").html("Password does not match!!!");
		}
		else
		{

			$.ajax({
			url: "{{ url('admin/change-password') }}",
			method: 'POST',
			data: $('#formChangePassword').serialize(),
			success: function(result){
				if(result.status == 1)
				{
					$("#msg_err").html('');
					toastr.success(result.msg);
					$('#formChangePassword')[0].reset();
					$("#change-pass-modal").modal('hide');
				}
				else
				{
					toastr.error(result.msg);
				}
			}
			});
		}
	}
 });


</script>
@endpush
@endsection
