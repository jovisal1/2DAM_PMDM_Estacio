import 'package:flutter/material.dart';
import 'package:flutter_visitas_app/domain/entities/visit_entity.dart';

class VisitModel {
  final String nombre;
  final String email;
  final String motivo;
  // final DateTime fecha;
  // final TimeOfDay horaInicio;
  // final TimeOfDay horaFin;

  VisitModel({
    required this.nombre,
    required this.email,
    required this.motivo,
    // required this.fecha,
    // required this.horaInicio,
    // required this.horaFin
  });

  factory VisitModel.fromJson(Map<String, dynamic> json, String id) {
    return VisitModel(
      nombre: json["nombre"],
      email: json["email"],
      motivo: json["motivo"],
      // fecha: json["fecha"],
      // horaInicio: json["horaInicio"],
      // horaFin: json["horaFin"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'email': email,
      'motivo': motivo,
      // 'fecha': fecha,
      // 'horaInicio': horaInicio,
      // 'horaFin': horaFin,
    };
  }

  VisitEntity toEntity() {
    return VisitEntity(
      nombre: nombre,
      email: email,
      motivo: motivo,
      // fecha: fecha,
      // horaInicio: horaInicio,
      // horaFin: horaFin,
    );
  }

  static VisitModel fromEntity(VisitEntity visit) {
    return VisitModel(
      nombre: visit.nombre,
      email: visit.email,
      motivo: visit.motivo,
      // fecha: visit.fecha,
      // horaInicio: visit.horaInicio,
      // horaFin: visit.horaFin,
    );
  }
}
