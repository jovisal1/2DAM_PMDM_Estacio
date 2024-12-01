import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_visitas_app/data/models/visit_model.dart';

abstract class VisitsRemoteDataSource {
  Future<List<VisitModel>> getVisits();
}

class VisitsRemoteDataSourceImpl implements VisitsRemoteDataSource {
  final FirebaseDatabase database;

  VisitsRemoteDataSourceImpl(this.database);

  @override
  Future<List<VisitModel>> getVisits() async {
    List<VisitModel> tasksList = [];
    final snapshot = await database.ref('visits').get();

    if (snapshot.value != null) {
      final visitsMap = Map<String, dynamic>.from(snapshot.value as Map);
      return visitsMap.entries
          .map((e) =>
              VisitModel.fromJson(Map<String, dynamic>.from(e.value), e.key))
          .toList();
    }
    return tasksList;
  }
}
