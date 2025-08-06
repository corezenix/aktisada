<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> Aktisada </title>
    <!-- MOBILE -->
    <meta name='HandheldFriendly' content='true' />
    <meta name='format-detection' content='telephone=no' />
    <meta name="apple-mobile-web-app-title" content=" " />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <!-- / common / -->

    <!--begin::Fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;400;500;600;700&display=swap" rel="stylesheet">
    <!--end::Fonts-->

    <!--begin::Page Custom Styles(used by this page)-->
    <link rel="stylesheet" href="{{url('login/assets/css/owl.carousel.min.css')}}">
    <link rel="stylesheet" href="{{url('login/assets/css/owl.theme.default.min.css')}}">
    <!--end::Page Custom Styles-->

    <!--begin::Global Theme Styles(used by all pages)-->
    <link href="{{url('login/assets/plugins/global/plugins.bundle.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{url('login/assets/css/style.bundle.css')}}" rel="stylesheet" type="text/css" />
    <!--end::Global Theme Styles-->

    <!--end::Layout Themes-->
    <link rel="shortcut icon" href="{{url('login/assets/media/logos/favicon.ico')}}" />
    <link rel="stylesheet" type="text/css" href="{{ url('login/libs/noty/noty.css') }}">
    <link href="{{ url('assets/css/jquery.ccpicker.css') }}" rel="stylesheet">
	<link href="{{url('assets/plugins/toastr/css/toastr.min.css')}}" rel="stylesheet" />
    <link href="{{ url('login/assets/css/pages/form/login.css') }}" rel="stylesheet">
	<link href="{{ url('login/fonts/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet">	

<style>
	.field_icon {
		top: 38px !important;
	}
</style>

</head>

<body>

    <!--begin::Body-->
	<body id="kt_body" class="header-mobile-fixed subheader-enabled aside-enabled aside-fixed aside-secondary-enabled page-loading">
		<!--begin::Main-->

		<div class="d-flex flex-column flex-root">
			<!--begin::Login-->
			<div class="login login-1 login-signin-on d-flex flex-column flex-lg-row flex-column-fluid bg-white" id="kt_login">


		<div class="login-content flex-row-fluid d-flex flex-column justify-content-center position-relative overflow-hidden p-7 mx-auto gsign-up">
			<!--begin::Content body-->
			<div class="d-flex flex-column-fluid flex-center">
				<!--begin::Signin-->
				<div class="login-form login-signin main-login">
					<!--begin::Form-->
					
						<div class="pb-5 pt-lg-0 pt-5 mx-auto">
							<img class="logo-mob" src="{{url('login/assets/media/mob-logo.svg')}}" width="80%">
						
							<h3 class="sign-title"><span style="color:#ee3448;">AKTI</span>SADA</h3>
							<p class="pt-10" style="font-size:16px;" > Log in to your account</p> 
						</div>
						
						<form class="form" method="post"  action="{{route('admin.user-login')}}"  name="loginForm"> <!--id="kt_login_signin_form"-->
						<!--begin::Title-->
						@csrf
						<!--begin::Title-->
						<!--begin::Form group-->
							<div class="form-group form-feild-row  country-code-row text-left position-relative">
								<label class="sign-label">Mobile number </label><br>
								<input class="form-control form-control-solid h-auto phone-field text-input" type="number" placeholder="Mobile number" name="mobile" id="phoneField1" autocomplete="off" value="{{ old('mobile')}}" required />
								<input type="hidden" id="country_code" name="country_code" value="{{ $countryCode }}">
							</div>
							<!--end::Form group-->
							<!--begin::Form group-->
							<div class="form-group position-relative">
								<div class="d-flex justify-content-between mt-n5">
									<label class="sign-label pt-5">Password</label>
								</div>
								<input class="form-control form-control-solid h-auto" type="password" placeholder="Type your password here" name="password" autocomplete="off" id="password" required />
								<span id="toggle_pwd" class="fa fa-lg fa-fw field_icon fa-eye-slash mt-5"></span>
								{{--<a href="{{route('forgot-password')}}" class="text-right text-hover-primary float-right d-block mt-2 forgot-password pt-2" >Forgot Password ?</a>--}}
							</div>
							<!--end::Form group-->
							<!--begin::Action-->
							<div class="pb-lg-0 pb-5 sign-d-flex  align-items-center w-100 mt-5 pt-5">
								<button type="submit"  class="btn btn-primary font-weight-bolder font-size-h6 px-8 py-4 " style="width:100%;" >Sign In</button> <!--id="kt_login_signin_submit"-->
								<!-- <h6 class="have-acc mt-5 pt-5">Don’t have an account ? <a href="#">Signup</a></h6>	-->
							</div>
							<!--end::Action-->
						
					</form>

			</div>
		</div>

			</div>
            <!--end::Content-->
        </div>
        <!--end::Login-->
    </div>
	
	@push('script')
	
	@if(Session::get('success'))
		<script>
			toastr.success("{{Session::get('success')}}");
		</script>
	@endif

	@if (Session::get('error'))
		<script>
			toastr.error("{{Session::get('error')}}");
		</script>
	@endif
	
	@if (Session::get('fp-success'))
		<script>
			toastr.success("{{Session::get('fp-success')}}");
		</script>
	@endif
	

	@endpush

<!--begin::Global Config(global config for global JS scripts)-->
<!--<script>var KTAppSettings = { "breakpoints": { "sm": 576, "md": 768, "lg": 992, "xl": 1200, "xxl": 1200 }, "colors": { "theme": { "base": { "white": "#ffffff", "primary": "#1BC5BD", "secondary": "#E5EAEE", "success": "#1BC5BD", "info": "#6993FF", "warning": "#FFA800", "danger": "#F64E60", "light": "#F3F6F9", "dark": "#212121" }, "light": { "white": "#ffffff", "primary": "#1BC5BD", "secondary": "#ECF0F3", "success": "#C9F7F5", "info": "#E1E9FF", "warning": "#FFF4DE", "danger": "#FFE2E5", "light": "#F3F6F9", "dark": "#D6D6E0" }, "inverse": { "white": "#ffffff", "primary": "#ffffff", "secondary": "#212121", "success": "#ffffff", "info": "#ffffff", "warning": "#ffffff", "danger": "#ffffff", "light": "#464E5F", "dark": "#ffffff" } }, "gray": { "gray-100": "#F3F6F9", "gray-200": "#ECF0F3", "gray-300": "#E5EAEE", "gray-400": "#D6D6E0", "gray-500": "#B5B5C3", "gray-600": "#80808F", "gray-700": "#464E5F", "gray-800": "#1B283F", "gray-900": "#212121" } }, "font-family": "Poppins" };</script>-->
<!--begin::Global Theme Bundle(used by all pages)-->
<script src="{{url('login/assets/plugins/global/plugins.bundle.js')}}"></script>
<!--<script src="https://preview.keenthemes.com/metronic/theme/html/demo3/dist/assets/plugins/custom/prismjs/prismjs.bundle.js?v=7.2.9"></script>-->
<script src="{{url('login/assets/js/scripts.bundle.js')}}"></script>
<script type= "text/javascript" src="{{url('assets/js/jquery-validation/jquery.validate.min.js')}}"></script>
<!--end::Global Theme Bundle-->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
<script src="{{url('login/assets/js/pages/form/login.js')}}"></script>
<script src="{{url('login/assets/js/owl.carousel.min.js')}}"></script>
<script src="{{ url('login/libs/noty/noty.min.js') }}"></script>
<script src="{{ url('assets/js/jquery.ccpicker.js') }}"></script>
<script src="{{url('assets/plugins/toastr/js/toastr.min.js')}}"></script>
<!--end::Global Config-->

<script>
    //country code
    var countryCode=$('#country_code').val();
    $("#phoneField1").CcPicker();
    $("#phoneField1").CcPicker("setCountryByCode", countryCode);

</script>
<!--end::Page Scripts-->
@stack('script')
</body>
</html>
