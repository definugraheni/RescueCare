import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:resquecare/View-Model/enum.dart';

class OtherProvider extends ChangeNotifier {
  ViewState _state = ViewState.none;
  bool _isCheckedTnC = false;
  bool _isEditProfile = false;
  File? _selectedIMage;
  List<File> listImage = [];
  List<File> listImageProfile = [];

  File get selectImage => _selectedIMage!;
  ViewState get state => _state;
  bool get isEditProfile => _isEditProfile;
  bool get isCheckedTnC => _isCheckedTnC;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

   void editProfile() {
    _isEditProfile = !isEditProfile;
    notifyListeners();
  }

  void changeTnC() {
    _isCheckedTnC = !isCheckedTnC;
    notifyListeners();
  }
}
