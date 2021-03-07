<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/
Auth::routes();

/**
 * / Authentication Routes...
* $this->get('login', 'Auth\LoginController@showLoginForm')->name('login');
* $this->post('login', 'Auth\LoginController@login');
* $this->post('logout', 'Auth\LoginController@logout')->name('logout');

* Registration Routes...
* $this->get('register', 'Auth\RegisterController@showRegistrationForm')->name('register');
* $this->post('register', 'Auth\RegisterController@register');

* Password Reset Routes...
* $this->get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm');
* $this->post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail');
* $this->get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm');
* $this->post('password/reset', 'Auth\ResetPasswordController@reset');
 */



Auth::routes();

Route::get('/', 'HomeController@index');
Route::get('api/task', 'TaskController@getTask');

Route::get('404', function(){
    return view('errors.503');
})->name(404);
Route::get('500', function(){
    return view('errors.500');
})->name(500);
Route::get('403', function(){
    return view('errors.403');
})->name(403);
