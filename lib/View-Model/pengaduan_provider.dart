import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resquecare/Models/pengaduan_model.dart';

class PengaduanProvider extends ChangeNotifier {
  void tambahPengaduan(PengaduanModel data) async {
    try {
      final docData = FirebaseFirestore.instance.collection("Pengaduan").doc();
      data.id = docData.id;
      final json = data.toJson();
      docData.set(json);
    } on FirebaseException catch (e) {
      print(e);
    }
    notifyListeners();
  }
  
}
