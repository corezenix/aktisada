<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\AktisadaApiController;
use App\Http\Controllers\Api\ProductController;


/*Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
*/
//api-prefix = 'api/v1'

Route::controller(AktisadaApiController::class)->group(function() {
	Route::post('login', 'login')->name('login');
});

Route::middleware('auth:sanctum')->group( function () {

	Route::controller(AktisadaApiController::class)->group(function()
	{
		Route::get('get-slides', 'getslides')->name('get-slides');
		Route::get('get-categories', 'getCategories')->name('get-categories');
		Route::get('get-brand-type-material', 'getBrandTypeMaterial')->name('get-brand-type-material');
		Route::post('add-brand', 'addBrand')->name('add-brand');
		Route::post('get-filters', 'getFilters')->name('get-filters');
		
	});
	
	Route::controller(ProductController::class)->group(function()
	{
		Route::post('add-product', 'addProduct')->name('add-product');
		Route::post('product-list', 'getProducts')->name('product-list');
		Route::post('delete-product', 'deleteProduct')->name('delete-product');
		Route::post('edit-product', 'editProduct')->name('edit-product');
		Route::post('update-product', 'updateProduct')->name('update-product');
		Route::post('product-details', 'getProductDetails')->name('product-details');
		
	});
	
	
	

});

