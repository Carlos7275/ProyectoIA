<?php

namespace App\Http\Controllers;

use App\Models\Response\Message;
use App\Repositories\ConfiguracionRepository;
use App\Utils\Utils;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

class ConfiguracionController extends Controller
{
    private ConfiguracionRepository $_configuracionRepository;

    public function __construct(ConfiguracionRepository $configuracionRepository)
    {
        $this->middleware('auth:api', ['except' => []]);

        $this->_configuracionRepository = $configuracionRepository;
    }

    public function ActualizarConfiguracion(Request $request)
    {
        try {

            $request->validate([
                "tokentreffle" => 'required|string',
                "tokenipinfo" => 'required|string',
                "tokenplantsnet" => 'required|string',
                "distanciamin" => 'required|numeric',
                "distanciamax" => 'required|numeric'
            ]);

            $this->_configuracionRepository->update(1, $request->json()->all());
            return response()->json(Message::success("¡Se guardaron la configuracion con exito!"));
        } catch (ValidationException $e) {
            return response()->json(Message::Error(Utils::ConvertirErroresALinea($e->errors())), 422);
        }
    }

    public function ObtenerConfiguracion()
    {
        return response()->json(Message::success($this->_configuracionRepository->find(1)));
    }
}