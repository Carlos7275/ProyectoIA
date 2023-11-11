<?php

namespace App\Http\Controllers;

use App\Models\Image;
use App\Models\Paths;
use App\Models\Response\Message;
use App\Repositories\InfoPlantasRepository;
use App\Repositories\MapaRepository;
use App\Utils\Utils;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;

class MapaController extends Controller
{
    private MapaRepository $_mapaRepository;
    private InfoPlantasRepository $_infoPlantasRepository;

    public function __construct(
        MapaRepository $mapaRepository,
        InfoPlantasRepository $infoPlantasRepository
    ) {
        $this->middleware('auth:api', ['except' => ["ObtenerPlantas,ObtenerPlantaEspecifica"]]);
        $this->_mapaRepository = $mapaRepository;
        $this->_infoPlantasRepository = $infoPlantasRepository;
    }

    public function RegistrarPlanta(Request $request)
    {
        try {
            $request->validate([
                "latitud" => 'required|numeric',
                "longitud" => 'required|numeric',
                "imagen" => 'required',
            ]);

            $zona = $this->_mapaRepository->ObtenerZona($request->latitud, $request->longitud);

            $url = Image::base64toUrl($request->imagen);

            $nombrePlanta = $this->_infoPlantasRepository->IdentificarPlantaConImagen(Paths::getRelativePath($url))->bestMatch;
            $infoPlanta = $this->_infoPlantasRepository->ObtenerInformacionPlanta($nombrePlanta);
            $idPlanta = $infoPlanta["data"][0]["id"];
            if (!$this->_infoPlantasRepository->exists($idPlanta)) {
                $nombreCientifico = $infoPlanta["data"][0]["slug"];
                $especie = $this->_infoPlantasRepository->ObtenerInformacionEspecie($nombreCientifico);

                $arrayPlantas = array(
                    "id" => $idPlanta,
                    "nombre_planta" => $nombrePlanta,
                    "nombre_cientifico" => $nombreCientifico,
                    "toxicidad" => $especie["data"]["specifications"]["toxicity"],
                    "año" => intval($infoPlanta["data"][0]["year"]),
                    "familia" => $infoPlanta["data"][0]["family"],
                    "nombres_comunes" => $especie["data"]["common_names"],
                    "distribucion" => $especie["data"]["distributions"],
                    "colores" => $especie["data"]["flower"]["color"],
                    "humedad_atmosferica" => $especie["data"]["growth"]["atmospheric_humidity"],
                    "cantidad_luz" => $especie["data"]["growth"]["light"],
                    "meses_crecimiento" => $especie["data"]["growth"]["bloom_months"],
                    "genero" => $infoPlanta["data"][0]["genus"],
                    "estatus" => $infoPlanta["data"][0]["status"]
                );
            }

            $arrayMapa = array(
                "id_planta" => $idPlanta,
                "zona" => $zona,
                "latitud" => $request->latitud,
                "longitud" => $request->longitud,
                "url_imagen" => $url
            );

            DB::beginTransaction();

            try {
                if (!$this->_infoPlantasRepository->exists($idPlanta))
                    $this->_infoPlantasRepository->create($arrayPlantas);

                $this->_mapaRepository->create($arrayMapa);
                DB::commit();
                return response()->json(Message::success($this->_infoPlantasRepository->find($idPlanta)), 201);
            } catch (\Exception $e) {
                DB::rollBack();
                throw $e;
            }
        } catch (ValidationException $e) {
            return response()->json(Message::Error(Utils::ConvertirErroresALinea($e->errors())), 422);
        }
    }

    public function ObtenerPlantas()
    {
    }

    public function ObtenerPlantaEspecifica($id)
    {
    }

    public function DarBajaPlanta($id)
    {
    }
}
