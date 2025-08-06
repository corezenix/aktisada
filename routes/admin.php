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

use App\Http\Controllers\Auth\LoginController;


Route::get('/', function () {
    return redirect('Login');
});

Route::controller(LoginController::class)->group(function() {
	Route::get('Login', 'showLoginForm')->name('login');
	Route::post('login', 'userLogin')->name('user-login');
	Route::post('logout', 'logout')->name('logout');
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
	
	Route::post('/save-type', 'saveItemType')->name('save-type');
	Route::get('/get-item-types', 'getItemTypes')->name('get-item-types');
	Route::get('/delete-type/{id}', 'deleteType')->name('delete-type');
	
	Route::post('/save-material', 'saveMaterial')->name('save-material');
	Route::get('/get-materials', 'getMaterials')->name('get-materials');
	Route::get('/delete-material/{id}', 'deleteMaterial')->name('delete-material');
});

Route::controller(CampaignGiftController::class)->group(function() {
	Route::get('/scratch-gifts-list', 'index')->name('scratch-gifts-list');
	Route::get('/view-campaign-gifts-list', 'viewCampaignGiftListings')->name('view-campaign-gifts-list');
	Route::get('/deleted-gifts-list', 'deletedGiftsList')->name('deleted-gifts-list');
	Route::get('/view-deleted-gifts-list', 'viewDeletedGiftListings')->name('view-deleted-gifts-list');
});

Route::controller(ScratchWebController::class)->group(function() {

	Route::get('/scratch-customers', 'index')->name('scratch-customers');
	Route::get('/get-scratch-web-customers', 'getWebCustomers')->name('get-scratch-web-customers');
	Route::get('/get-scratch-app-customers', 'getAppCustomers')->name('get-scratch-app-customers');
	Route::get('/get-branches/{id}', 'getBranches')->name('get-branches');
	Route::get('/get-offers/{id}', 'getOffers')->name('get-offers');
	Route::get('/scratch-web-redeem/{id}', 'redeem')->name('scratch-web-redeem');
	Route::post('/sractch-web-history-download', 'downloadHistory')->name('sractch-web-history-download');	
	Route::post('/export-customers-list', 'exportCustomersList')->name('export-customers-list');
	
});

});
