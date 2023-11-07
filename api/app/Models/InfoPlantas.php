<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InfoPlantas extends Model
{
    use HasFactory;
    protected $table = "info_plantas";

    protected $fillable = [
        "id",
        "nombre",
        "nombre_cientifico",
        "toxicidad",
        "año",
        "familia",
        "nombres_comunes",
        "distribucion",
        "color",
        "humedad_atmosferica",
        "cantidad_luz",
        "meses_crecimiento",
        "genero",
        "estatus"
    ];

    protected $hidden = [
        "created_at",
        "updated_at"
    ];
}