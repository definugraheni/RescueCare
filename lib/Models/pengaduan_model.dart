class PengaduanModel {
  String id;
  String deskripsiKejadian;
  String keteranganLokasi;
  String lokasiKejadian;
  String buktiFoto;
  String tanggalKejadian;
  String status;
  PengaduanModel({
    this.id = '',
    required this.deskripsiKejadian,
    required this.keteranganLokasi,
    required this.lokasiKejadian,
    required this.buktiFoto,
    required this.tanggalKejadian,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "deskripsiKejadian": deskripsiKejadian,
        "keteranganLokasi": keteranganLokasi,
        "lokasiKejadian": lokasiKejadian,
        "buktiFoto": buktiFoto,
        "tanggalKejadian": tanggalKejadian,
        "status": status,
      };

  static PengaduanModel fromJson(Map<String, dynamic> json) => PengaduanModel(
        id: json["id"],
        deskripsiKejadian: json["deskripsiKejadian"],
        lokasiKejadian: json["lokasiKejadian"],
        buktiFoto: json["buktiFoto"],
        keteranganLokasi: json["keteranganLokasi"],
        tanggalKejadian: json["tanggalKejadian"],
        status: json["status"],
      );
}
