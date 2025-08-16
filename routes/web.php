<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\CampaignGiftController;
use App\Http\Controllers\Admin\ScratchWebController;

use App\Http\Controllers\Admin\CommonController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\SlideImageController;
use App\Http\Controllers\Admin\BrandTypeMaterialController;
use App\Http\Controllers\Admin\ProductController;

use App\Http\Controllers\Auth\LoginController;


Route::get('/', function () {
    //return redirect('login');
	$countryCode="IN";
	return view('login.login_page',compact('countryCode'));
});
Route::group(['prefix'=>'admin','as'=>'admin.'], function()
{
	Route::controller(LoginController::class)->group(function() {
		
		Route::get('login', 'showLoginForm')->name('login');
		Route::post('login', 'userLogin')->name('user-login');
	});
});

Route::controller(LoginController::class)->group(function() {
	Route::post('logout', 'logout')->name('logout');
	Route::get('logout', 'logout')->name('logout');
});

Route::group(['prefix'=>'admin','as'=>'admin.','middleware' => 'authware'], function()
{


Route::controller(DashboardController::class)->group(function() {
	Route::get('/dashboard', 'index')->name('dashboard');
});

Route::controller(CommonController::class)->group(function() {
	Route::get('/get-user-offers/{id}', 'getUserCampaigns')->name('get-user-offers');
});

Route::controller(UserController::class)->group(function() {
	Route::get('/users-list', 'index')->name('users-list');
	Route::post('/save-user', 'store')->name('save-user');
	Route::get('/view-users', 'viewUsers')->name('view-users');
	Route::get('/delete-user/{id}', 'destroy')->name('delete-user');
	Route::get('/edit-user/{id}', 'edit')->name('edit-user');
	Route::post('/update-user', 'updateUser')->name('update-user');
	Route::get('/act-deact-user/{op}/{id}', 'activateDeactivate')->name('act-deact-user');
	
	Route::post('/change-user-password', 'changeUserPassword')->name('change-user-password');
	Route::post('/change-password', 'changePassword')->name('change-password');
	Route::post('/user-imports', 'importUser')->name('user-imports');
	Route::post('/user-profile', 'userProfile')->name('user-profile');
		
});

Route::controller(CategoryController::class)->group(function() {
	Route::get('/category-list', 'index')->name('category-list');
	Route::post('/save-category', 'store')->name('save-category');
	Route::get('/view-categories', 'viewCategories')->name('view-categories');
	Route::get('/delete-category/{id}', 'destroy')->name('delete-category');
	Route::get('/edit-category/{id}', 'edit')->name('edit-category');
	Route::post('/update-category', 'updateCategory')->name('update-category');
	Route::post('/update-category-image', 'updateCategoryImage')->name('update-category-image');
    Route::get('/act-deact-category/{op}/{id}', 'activateDeactivate')->name('act-deact-category');
});

Route::controller(SlideImageController::class)->group(function() {
	Route::get('/slides', 'index')->name('slides');
	Route::post('/save-slide', 'store')->name('save-slide');
	Route::get('/get-slide-images', 'getSlideImages')->name('get-slide-images');
	Route::get('/delete-slide/{id}', 'destroy')->name('delete-slide');
	Route::get('/act-deact-slide-image/{op}/{id}', 'activateDeactivate')->name('act-deact-slide-image');	
});

Route::controller(BrandTypeMaterialController::class)->group(function() {
	Route::get('/brands', 'index')->name('brands');
	Route::post('/save-brand', 'store')->name('save-brand');
	Route::get('/get-brands', 'getBrands')->name('get-brands');
	Route::get('/delete-brand/{id}', 'destroy')->name('delete-brand');
	
	Route::get('/item-types', 'itemType')->name('item-types');
	Route::post('/save-type', 'saveItemType')->name('save-type');
	Route::get('/get-item-types', 'getItemTypes')->name('get-item-types');
	Route::get('/delete-type/{id}', 'deleteType')->name('delete-type');
	
	Route::get('/material-types', 'materialType')->name('material-types');
	Route::post('/save-material', 'saveMaterial')->name('save-material');
	Route::get('/get-materials', 'getMaterials')->name('get-materials');
	Route::get('/delete-material/{id}', 'deleteMaterial')->name('delete-material');
	
	Route::get('/item-sizes', 'itemSize')->name('item-sizes');
	Route::post('/save-item-size', 'saveItemSize')->name('save-item-size');
	Route::get('/get-item-sizes', 'getItemSizes')->name('get-item-sizes');
	Route::get('/delete-item-size/{id}', 'deleteItemSize')->name('delete-item-sizes');
});


Route::controller(ProductController::class)->group(function() {
	Route::get('/products', 'index')->name('products');
	//Route::post('/save-slide', 'store')->name('save-slide');
	Route::get('/get-products-list', 'getProductsList')->name('get-products-list');
	//Route::get('/delete-slide/{id}', 'destroy')->name('delete-slide');
	//Route::get('/act-deact-slide-image/{op}/{id}', 'activateDeactivate')->name('act-deact-slide-image');	
});




});