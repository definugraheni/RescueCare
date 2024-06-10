class Accounts {
  String id;
  String fullname;
  String username;
  String email;
  String phoneNumber;
  String role;
  String profilePict;
  Accounts({
    this.id = '',
    required this.fullname,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.profilePict,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "username": username,
        "email": email,
        "phoneNumber": phoneNumber,
        "role": role,
        "profilePict": profilePict,
      };

  static Accounts fromJson(Map<String, dynamic> json) => Accounts(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        username: json["username"],
        role: json["role"],
        profilePict: json["profilePict"],
      );
}
