<form id="formUpdateUser">
			@csrf
			
			<input type="hidden" name="user_id" value="{{$usr->id}}">

			
			<div class="row mb-2" >
				<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
					<label for="user_name" class="form-label">Shop Name<span class="required">*</span></label>
					<input type="text" class="form-control"  name="shop_name_edit" id="shop_name_edit" placeholder="Shop Name" value="{{$usr->shop_name}}" required>
				</div>
			</div>

			<div class="row mb-2" >
				<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
					<label for="user_name" class="form-label">Contact Person<span class="required">*</span></label>
					<input type="text" class="form-control"  name="contact_person_edit" id="contact_person_edit" placeholder="contact Person"  value="{{$usr->contact_person}}"required>
				</div>
			</div>
			<div class="row mb-2" >
				<!--<div class="col-12 col-lg-6 col-xl-6 col-xxl-6">
					<label for="mobile" class="form-label">Mobile<span class="required">*</span></label>
					<input type="hidden" class="form-control" name="country_code_edit" id="country_code_edit" value="91"  required>
					<br>
					<input type="tel" class="form-control" name="mobile_edit" id="mobile_edit" minlength=6 maxlength=15 value="+{{$usr->country_code.$usr->mobile}}" required>
				</div>-->
				
				<div class="col-12 col-lg-2 col-xl-2 col-xxl-2">
					<label for="mobile" class="form-label">Code<span class="required">*</span></label>
					<select class="form-control" name="country_code" id="country_code" required>
					<!--<option value="">Code</option>-->
					<option value="91" selected>+91</option>
					</select>
				</div>	
				<div class="col-12 col-lg-4 col-xl-4 col-xxl-4">
					<label for="email" class="form-label">Mobile<span class="required">*</span></label>
					<input type="text" class="form-control"  name="mobile_edit" id="mobile_edit" placeholder="mobile" value="{{$usr->mobile}}"required>
				</div>
				<div class="col-12 col-lg-6 col-xl-6 col-xxl-6">
					<label for="email" class="form-label">Whatsapp No<span class="required">*</span></label>
					<input type="text" class="form-control"  name="whatsapp_no_edit" id="whatsapp_No_edit" placeholder="Whatsapp No" value="{{$usr->whatsapp_no}}"required>
				</div>
				
				
			</div>
			
			<div class="row mb-2" >
				<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
					<label for="email" class="form-label">Email<span class="required">*</span></label>
					<input type="text" class="form-control"  name="email_edit" id="email_edit" placeholder="Email" value="{{$usr->email}}" required>
				</div>
			</div>
			
			<div class="row mb-2" >
				<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
					<label for="address" class="form-label">Address</label>
					<textarea rows=2  class="form-control"  name="address_edit" id="address_edit" placeholder="Address" >{{$usr->address}}</textarea>
				</div>
			</div>

			<div class="row mb-2" >
				<div class="col-12 col-lg-6 col-xl-6 col-xxl-6">
					<label for="location" class="form-label">Location</label>
					<input type="text" class="form-control"  name="location_edit" id="location_edit" placeholder="Location" value="{{$usr->location}}">
				</div>
				<div class="col-12 col-lg-6 col-xl-6 col-xxl-6">
					<label for="location" class="form-label">City</label>
					<input type="text" class="form-control"  name="city_edit" id="city_edit" placeholder="City" value="{{$usr->city}}">
				</div>
			</div>
			
			
			<div class="row mb-2" >
				<div class="col-12 col-lg-6 col-xl-6 col-xxl-6">
					<label for="location" class="form-label">District</label>
					<input type="text" class="form-control"  name="district_edit" id="district_edit" placeholder="District" value="{{$usr->district}}">
				</div>
				<div class="col-12 col-lg-6 col-xl-6 col-xxl-6">
					<label for="location" class="form-label">State</label>
					<input type="text" class="form-control"  name="state_edit" id="state_edit" placeholder="state" value="{{$usr->state}}">
				</div>
			</div>
		
			<div class="row mb-2" >
				<div class="col-12 col-lg-4 col-xl-4 col-xxl-4">
					<label for="email" class="form-label">Pin-Code</label>
					<input type="text" class="form-control"  name="pincode_edit" id="pincode_edit" placeholder="Pincode" style="width:200px;" value="{{$usr->pincode}}" >
				</div>

			</div>
			
			<div class="row mb-3" >
				<div class="col-12 col-lg-12 col-xl-12 col-xxl-12">
					<label for="user_role" class="form-label">Select Role<span class="required">*</span></label>
					<select  class="form-control"  name="role_id_edit" id="role_id_edit" placeholder="Role" required>
					<!--<option value="" > Select Role </option>-->
					<option value="2" @if($usr->role_id==2) selected @endif> User </option>
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

<script>
/*var phone_number = window.intlTelInput(document.querySelector("#mobile_edit"), {
	  separateDialCode: true,
	  preferredCountries:["in"],
	  hiddenInput: "full_number",
	  utilsScript:"{{url('assets/intl-tel-input17.0.3/utils.js')}}"
	});
*/
	
				
var addValidator=$('#formUpdateUser').validate({ 
	
	rules: {
		shop_name_edit: {required: true,},
		contact_person_edit: {required: true,},
		mobile_edit: {required: true,},
		whatsapp_no_edit: {required: true,},
		email_edit: {required: true,},
		role_id_edit: {required: true,},
	},

	submitHandler: function(form) 
	{
		//$("#btn-submit").attr('disabled',true).html('Saving <i class="fa fa-spinner fa-spin"></i>')
		
		//var code=phone_number.getSelectedCountryData()['dialCode'];
		//$("#country_code_edit").val(code);
		
		$.ajax({
		url: "{{ url('admin/update-user') }}",
		method: 'post',
		data: $('#formUpdateUser').serialize(),
		success: function(result){
			if(result.status == 1)
			{
				$('#datatable').DataTable().ajax.reload(null,false);
				toastr.success(result.msg);
				$('#formUpdateUser')[0].reset();
				$('#mobile_edit').val('');
				$('.btn-offcanvas-close').trigger('click');
			}
			else
			{
				toastr.error(result.msg);
			}
		}
		});
	  }
	});



</script>
