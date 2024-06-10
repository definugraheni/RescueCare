import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:resquecare/Models/pengaduan_model.dart';
import 'package:resquecare/View-Model/enum.dart';

class AdminPengaduanProvider extends ChangeNotifier {
  Stream<List<PengaduanModel>>? _getDataPengaduan;
  ViewState _state = ViewState.none;

  ViewState get state => _state;
  Stream<List<PengaduanModel>>? get getDataPengaduan => _getDataPengaduan;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  void getDataPengaduanUser() {
    setState(ViewState.loading);
    try {
      final data = FirebaseFirestore.instance.collection("Pengaduan").snapshots().map(
            (event) => event.docs.map((e) => PengaduanModel.fromJson(e.data())).toList(),
          );
      print(data);
      _getDataPengaduan = data;
      print("abc");
      print("get data here $_getDataPengaduan");
      setState(ViewState.none);
    } on FirebaseException catch (e) {
      print(e);
      setState(ViewState.error);
    }
    notifyListeners();
  }

  void konfirmasiPengaduan(PengaduanModel data) {
    final docData = FirebaseFirestore.instance.collection("Pengaduan").doc(data.id);
    data.id = docData.id;
    final json = data.toJson();
    docData.update(json);
    notifyListeners();
  }
}
