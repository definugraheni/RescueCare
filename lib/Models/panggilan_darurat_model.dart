class PanggilanDaruratModel {
  String id;
  String fullname;
  String phoneNumber;
  PanggilanDaruratModel({
    this.id = '',
    required this.fullname,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "phoneNumber": phoneNumber,
      };

  static PanggilanDaruratModel fromJson(Map<String, dynamic> json) => PanggilanDaruratModel(
        id: json["id"],
        fullname: json["fullname"],
        phoneNumber: json["phoneNumber"],
      );
}
