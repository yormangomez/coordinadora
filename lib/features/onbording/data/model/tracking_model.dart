class TrackingModel {
  TrackingModel({
    required this.guias,
  });

  List<Guia> guias;

  factory TrackingModel.fromJson(Map<String, dynamic> json) => TrackingModel(
        guias: List<Guia>.from(json["guias"].map((x) => Guia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "guias": List<dynamic>.from(guias.map((x) => x.toJson())),
      };
}

class Guia {
  Guia({
    required this.destinatario,
    required this.estadoGuia,
    required this.fechaEnvio,
    required this.guia,
    required this.totalUnidades,
    required this.ubicacionGuia,
    required this.unidades,
    this.fechaNovedad,
    this.novedad,
  });

  Destinatario destinatario;
  String estadoGuia;
  DateTime fechaEnvio;
  String guia;
  int totalUnidades;
  List<double> ubicacionGuia;
  List<Unidade> unidades;
  DateTime? fechaNovedad;
  String? novedad;

  factory Guia.fromJson(Map<String, dynamic> json) => Guia(
        destinatario: Destinatario.fromJson(json["destinatario"]),
        estadoGuia: json["estado_guia"],
        fechaEnvio: DateTime.parse(json["fecha_envio"]),
        guia: json["guia"],
        totalUnidades: json["total_unidades"],
        ubicacionGuia:
            List<double>.from(json["ubicacion_guia"].map((x) => x?.toDouble())),
        unidades: List<Unidade>.from(
            json["unidades"].map((x) => Unidade.fromJson(x))),
        fechaNovedad: json["fecha_novedad"] == null
            ? null
            : DateTime.parse(json["fecha_novedad"]),
        novedad: json["novedad"],
      );

  Map<String, dynamic> toJson() => {
        "destinatario": destinatario.toJson(),
        "estado_guia": estadoGuia,
        "fecha_envio":
            "${fechaEnvio.year.toString().padLeft(4, '0')}-${fechaEnvio.month.toString().padLeft(2, '0')}-${fechaEnvio.day.toString().padLeft(2, '0')}",
        "guia": guia,
        "total_unidades": totalUnidades,
        "ubicacion_guia": List<dynamic>.from(ubicacionGuia.map((x) => x)),
        "unidades": List<dynamic>.from(unidades.map((x) => x.toJson())),
        "fecha_novedad":
            "${fechaNovedad!.year.toString().padLeft(4, '0')}-${fechaNovedad!.month.toString().padLeft(2, '0')}-${fechaNovedad!.day.toString().padLeft(2, '0')}",
        "novedad": novedad,
      };
}

class Destinatario {
  Destinatario({
    required this.nombre,
    required this.telefono,
    required this.tipoPoblacionDestino,
    required this.zonificacion,
  });

  String nombre;
  String telefono;
  String tipoPoblacionDestino;
  Zonificacion zonificacion;

  factory Destinatario.fromJson(Map<String, dynamic> json) => Destinatario(
        nombre: json["nombre"],
        telefono: json["telefono"],
        tipoPoblacionDestino: json["tipo_poblacion_destino"],
        zonificacion: Zonificacion.fromJson(json["zonificacion"]),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "telefono": telefono,
        "tipo_poblacion_destino": tipoPoblacionDestino,
        "zonificacion": zonificacion.toJson(),
      };
}

class Zonificacion {
  Zonificacion({
    required this.ciudad,
    required this.codigoTerminal,
    required this.dane,
    required this.direccion,
    required this.equipo,
    required this.lat,
    required this.lng,
    required this.zonaHub,
    required this.zonaPostal,
  });

  String ciudad;
  String codigoTerminal;
  String dane;
  String direccion;
  String equipo;
  double lat;
  double lng;
  String zonaHub;
  String zonaPostal;

  factory Zonificacion.fromJson(Map<String, dynamic> json) => Zonificacion(
        ciudad: json["ciudad"],
        codigoTerminal: json["codigo_terminal"],
        dane: json["dane"],
        direccion: json["direccion"],
        equipo: json["equipo"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        zonaHub: json["zona_hub"],
        zonaPostal: json["zona_postal"],
      );

  Map<String, dynamic> toJson() => {
        "ciudad": ciudad,
        "codigo_terminal": codigoTerminal,
        "dane": dane,
        "direccion": direccion,
        "equipo": equipo,
        "lat": lat,
        "lng": lng,
        "zona_hub": zonaHub,
        "zona_postal": zonaPostal,
      };
}

class Unidade {
  Unidade({
    required this.etiqueta1D,
    required this.etiqueta2D,
    required this.guia,
    required this.numeroUnidad,
    required this.referenciaDetalle,
  });

  String etiqueta1D;
  String etiqueta2D;
  String guia;
  int numeroUnidad;
  String referenciaDetalle;

  factory Unidade.fromJson(Map<String, dynamic> json) => Unidade(
        etiqueta1D: json["etiqueta1d"],
        etiqueta2D: json["etiqueta2d"],
        guia: json["guia"],
        numeroUnidad: json["numero_unidad"],
        referenciaDetalle: json["referencia_detalle"],
      );

  Map<String, dynamic> toJson() => {
        "etiqueta1d": etiqueta1D,
        "etiqueta2d": etiqueta2D,
        "guia": guia,
        "numero_unidad": numeroUnidad,
        "referencia_detalle": referenciaDetalle,
      };
}
