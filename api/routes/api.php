<?php

use App\Http\Controllers\UsuarioController;
use App\Http\Controllers\CodigoPostalController;
use App\Http\Controllers\EmailController;
use App\Http\Controllers\GenerosController;
use App\Http\Controllers\InfoPlantasController;
use App\Http\Controllers\MapaController;
use App\Http\Controllers\RecorridoController;
use App\Http\Controllers\RolesController;
use Illuminate\Support\Facades\Route;

Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {
    Route::post("login", [UsuarioController::class, "IniciarSesion"]);
    Route::post("loginAdmin", [UsuarioController::class, "IniciarSesionAdmin"]);
    Route::post('logout', [UsuarioController::class, 'CerrarSesion']);
    Route::post('refresh', [UsuarioController::class, 'RefrescarToken']);
    Route::get('me', [UsuarioController::class, 'me']);
    Route::post('valid', [UsuarioController::class, 'ValidarToken']);
});
Route::middleware(['role:1'])->group(function () {
    Route::get("Roles", [RolesController::class, "ObtenerRoles"]);
    Route::get("Recorridos", [RecorridoController::class, "ObtenerRecorridos"]);
    Route::get("Mapa/Plantas", [MapaController::class, "ObtenerPlantas"]);
});

Route::controller(UsuarioController::class)->group(function () {
    Route::get('Usuario/{id}', "ObtenerUsuarioEspecifico");
    Route::get('Usuarios', "ObtenerUsuarios");
    Route::post('Registrar/Usuario', "CrearUsuario");
    Route::put('Modificar/Usuario/{id}', "ModificarUsuario");
    Route::put("Cambiar/Contraseña/", "CambiarContraseña");
    Route::put("Crear/Contraseña/", "CrearContraseña");
    Route::get("Validar/Token/", "ValidarJWT");
    Route::put("Cambiar/Estatus/Usuario/{id}", "CambiarEstatus");
});

Route::controller(RecorridoController::class)->group(function () {
    Route::post("Registrar/Recorrido", "RegistrarRecorrido");
    Route::get("MisRecorridos", "ObtenerMisRecorridos");
});
Route::controller(InfoPlantasController::class)->group(function () {
    Route::get("Plantas","ObtenerPlantas");
    Route::get("Planta/{id}","ObtenerPlanta");

});

Route::controller(MapaController::class)->group(function () {
    Route::post("Registrar/Planta", "RegistrarPlanta");
    Route::get("Mapa/Plantas/Activas", "ObtenerPlantasActivas");
    Route::get("Mapa/Planta/{id}", "ObtenerPlanta");
    Route::put("Cambiar/Estatus/Planta/{id}", "CambiarEstatusPlanta");
});


Route::controller(CodigoPostalController::class)->group(function () {
    Route::get("CodigosPostales", "ObtenerCP");
    Route::get("CodigoPostal/{id_asenta}/{cp}", "ObtenerCPEspecifico");
    Route::get("CodigoPostal/{cp}", "BuscarCP");
});

Route::controller(GenerosController::class)->group(function () {
    Route::get("Generos", "ObtenerGeneros");
});

Route::controller(EmailController::class)->group(function () {
    Route::post("Recuperar/Cuenta", "RecuperarCuenta");
});
