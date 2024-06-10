import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resquecare/Models/profile_model.dart';
import 'package:resquecare/Views/Auth/login_page.dart';
import 'package:resquecare/Widgets/transition.dart';
import 'package:resquecare/main.dart';

class AuthServicesProvider extends ChangeNotifier {
  List<Accounts>? _dataUser;
  Stream<List<Accounts>>? _streamUser;

  List<Accounts> get dataUser => _dataUser!;
  Stream<List<Accounts>> get streamUser => _streamUser!;

  void signUp(Accounts data, String password, context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: data.email, password: password)
          .then(
            (value) => {createUserAccount(data, context)},
          );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void createUserAccount(Accounts data, context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      final docData =
          FirebaseFirestore.instance.collection("Profile").doc(user!.uid);
      data.id = user.uid;
      final json = data.toJson();
      docData.set(json);
      Navigator.pushReplacement(context, createRoute(const LoginPage()));
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  void signIn(String email, String password, context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("Sign In Success");
      getDataUserFromLogin();
      route(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    notifyListeners();
  }

  void getDataUserFromLogin() {
    print("get data user");
    User? user = FirebaseAuth.instance.currentUser;
    print(user!.email);
    final data = FirebaseFirestore.instance
        .collection("Profile")
        .where("email", isEqualTo: user.email)
        .snapshots()
        .map(
          (event) =>
              event.docs.map((e) => Accounts.fromJson(e.data())).toList(),
        );
    print("=" * 20);
    _streamUser = data;
    print(data);
    data.forEach(
      (element) => _dataUser = element,
    );
    notifyListeners();
  }

  void route(context) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("Profile").doc(user!.uid).get().then(
      (DocumentSnapshot value) {
        print("On Route");
        if (value.exists) {
          if (value.get("role") == "admin") {
            Navigator.pushReplacement(
                context, createRoute(const AdminNavbar()));
          } else {
            Navigator.pushReplacement(context, createRoute(const Navbar()));
          }
        } else {
          print("Document not found");
        }
      },
    );
  }

  void signOut(context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, createRoute(const LoginPage()));
    notifyListeners();
  }

  void editDataUser(Accounts data) {
    final docData =
        FirebaseFirestore.instance.collection("Profile").doc(data.id);
    data.id = docData.id;
    final json = data.toJson();
    docData.update(json);
    notifyListeners();
  }
}
