import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:resquecare/Models/profile_model.dart';
import 'package:resquecare/View-Model/auth_services.dart';
import 'package:resquecare/View-Model/others_provider.dart';
import 'package:resquecare/Widgets/button_purple.dart';
import 'package:resquecare/Widgets/custom_text_form_field.dart';
import 'package:resquecare/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isLoading = false;
  File? _image; //mengambil gambar
  String profileUrl = "";
  List<File> listImage = [];

  //Gallery
  Future _pickImageFromGallery(context) async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      if (listImage.isNotEmpty) {
        listImage.clear();
      }
      _image = File(returnImage.path);
      listImage.add(_image!);
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera(context) async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      if (listImage.isNotEmpty) {
        listImage.clear();
      }
      _image = File(returnImage.path);
      listImage.add(_image!);
    });
    Navigator.of(context).pop();
  }

  Future<void> uploadImage(File selectedImage) async {
    setState(() {
      _isLoading = true;
    });
    final ref = FirebaseStorage.instance.ref().child('files').child(selectedImage.path.split("/").last);
    try {
      await ref.putFile(selectedImage);
      String downloadUrl = await ref.getDownloadURL();
      setState(() {
        profileUrl = downloadUrl;
      });
      setState(() {
        _isLoading = false;
      });
    } on FirebaseException catch (e) {
      _isLoading = false;
      print(e);
    }
  }

  void deleteImage(data) {
    listImage.remove(data);
  }

  final usernameController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final updateProfile = Provider.of<AuthServicesProvider>(context, listen: false);
    return Consumer2<OtherProvider, AuthServicesProvider>(builder: (context, value, auth, child) {
      return StreamBuilder<List<Accounts>>(
          stream: auth.streamUser,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.hasError.toString());
            } else if (snapshot.hasData) {
              Accounts data = snapshot.data![0];
              return Scaffold(
                resizeToAvoidBottomInset: false, //agar tidak overflow ketika keyboard muncul
                body: CustomScrollView(
                  slivers: [
                    const SliverAppBar(
                      leading: BackButton(
                        color: Colors.white,
                      ),
                      title: Text("Akun"),
                    ),
                    SliverToBoxAdapter(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            bottom: -170,
                            child: Container(
                              height: MediaQuery.of(context).size.height / 1.2,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: AppColors.purpleRandom,
                                borderRadius: BorderRadius.circular(70),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(60, 100, 60, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                value.isEditProfile
                                    ? Stack(
                                        children: [
                                          listImage.isNotEmpty //kondisi antara menyimpan gambar atau tidak
                                              ? Container(
                                                  width: double.infinity,
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    height: 120,
                                                    width: 120,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: FileImage(listImage[0]),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: AppColors.purpleRandom,
                                                        width: 3,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : profileUrl == ""
                                                  ? Container(
                                                      width: double.infinity,
                                                      alignment: Alignment.center,
                                                      child: Container(
                                                        height: 120,
                                                        width: 120,
                                                        decoration: BoxDecoration(
                                                          image: const DecorationImage(
                                                            image: AssetImage("assets/icons/person.png"),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          shape: BoxShape.circle,
                                                          border: Border.all(
                                                            color: AppColors.purpleRandom,
                                                            width: 3,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      width: double.infinity,
                                                      alignment: Alignment.center,
                                                      child: Container(
                                                        height: 120,
                                                        width: 120,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: NetworkImage(profileUrl),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          shape: BoxShape.circle,
                                                          border: Border.all(
                                                            color: AppColors.purpleRandom,
                                                            width: 3,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                          Positioned(
                                            bottom: -0,
                                            left: 160,
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: IconButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      backgroundColor: AppColors.purpleRandom,
                                                      context: context,
                                                      builder: (builder) {
                                                        return Padding(
                                                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                                                          child: SizedBox(
                                                            width: MediaQuery.of(context).size.width,
                                                            height: MediaQuery.of(context).size.height / 4.5,
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    const Text(
                                                                      "Foto Profil",
                                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                                    ),
                                                                    InkWell(
                                                                      onTap: () {
                                                                        setState(() {
                                                                          deleteImage(listImage[0]);
                                                                        });
                                                                      },
                                                                      child: const ImageIcon(
                                                                        AssetImage("assets/icons/trash.png"),
                                                                        size: 70,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const Gap(20),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child: InkWell(
                                                                        onTap: () {
                                                                          _pickImageFromCamera(context);
                                                                          // otherProvider.pickImageFromCamera();
                                                                          // Navigator.pop(context);
                                                                        },
                                                                        child: Column(
                                                                          children: [
                                                                            Container(
                                                                              height: 50,
                                                                              width: 50,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                                border: Border.all(
                                                                                  color: AppColors.purpleAppbar,
                                                                                  width: 3,
                                                                                ),
                                                                                color: Colors.white,
                                                                              ),
                                                                              child: const Icon(
                                                                                Icons.camera_alt,
                                                                                size: 28,
                                                                              ),
                                                                            ),
                                                                            const Text("Kamera")
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: InkWell(
                                                                        onTap: () {
                                                                          _pickImageFromGallery(context);
                                                                          // otherProvider.pickImageFromGallery();
                                                                          // Navigator.pop(context);
                                                                        },
                                                                        child: Column(
                                                                          children: [
                                                                            Container(
                                                                              height: 50,
                                                                              width: 50,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                                border: Border.all(
                                                                                  color: AppColors.purpleAppbar,
                                                                                  width: 3,
                                                                                ),
                                                                                color: Colors.white,
                                                                              ),
                                                                              child: const Icon(
                                                                                Icons.image,
                                                                                size: 28,
                                                                              ),
                                                                            ),
                                                                            const Text("Gallery")
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                },
                                                icon: const Icon(
                                                  Icons.camera_alt,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : profileUrl == ""
                                        ? Container(
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            child: Container(
                                              height: 120,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                image: const DecorationImage(
                                                  image: AssetImage("assets/icons/person.png"),
                                                  fit: BoxFit.cover,
                                                ),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: AppColors.purpleRandom,
                                                  width: 3,
                                                ),
                                              ),
                                            ),
                                          )
                                        : _isLoading
                                            ? Container(
                                                width: double.infinity,
                                                alignment: Alignment.center,
                                                child: Container(
                                                  height: 120,
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                    // image: DecorationImage(
                                                    //   image: NetworkImage(profileUrl),
                                                    //   fit: BoxFit.cover,
                                                    // ),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: AppColors.purpleRandom,
                                                      width: 3,
                                                    ),
                                                  ),
                                                  child: const Center(
                                                    child: CircularProgressIndicator(),
                                                  ),
                                                ))
                                            : Container(
                                                width: double.infinity,
                                                alignment: Alignment.center,
                                                child: Container(
                                                  height: 120,
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(profileUrl),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: AppColors.purpleRandom,
                                                      width: 3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                value.isEditProfile
                                    ? Container()
                                    : Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: InkWell(
                                          onTap: () {
                                            context.read<OtherProvider>().editProfile();
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset("assets/icons/pencil.png"),
                                              const Text(
                                                "Edit",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                // const Gap(10),
                                const Text(
                                  "Username :",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: usernameController,
                                  readOnly: value.isEditProfile ? false : true,
                                  hintText: data.username,
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                const Gap(20),
                                const Text(
                                  "Email :",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                                ),
                                const Gap(5),
                                CustomTextField(
                                  readOnly: true,
                                  hintText: data.email,
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                const Gap(20),
                                const Text(
                                  "Nama Lengkap :",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: fullNameController,
                                  readOnly: value.isEditProfile ? false : true,
                                  hintText: data.fullname,
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                const Gap(20),
                                const Text(
                                  "No HP :",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                                ),
                                const Gap(5),
                                CustomTextField(
                                  controller: phoneNumberController,
                                  readOnly: value.isEditProfile ? false : true,
                                  hintText: data.phoneNumber,
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                const Gap(30),
                                value.isEditProfile // tombol akan berubah sesuai dengan kondisi mengedit akun atau tidak
                                    ? Container(
                                        width: MediaQuery.of(context).size.width,
                                        alignment: Alignment.center,
                                        child: ButtonPurple(
                                          buttonText: "Simpan",
                                          onPressed: () {
                                            if (listImage.isNotEmpty) {
                                              uploadImage(listImage[0]);
                                            }
                                            print("After Uploading image");
                                            final editableData = Accounts(
                                              id: data.id,
                                              fullname: fullNameController.text,
                                              username: usernameController.text,
                                              email: data.email,
                                              phoneNumber: phoneNumberController.text,
                                              role: data.role,
                                              profilePict: profileUrl,
                                            );
                                            print("=" * 15);
                                            print(profileUrl);
                                            updateProfile.editDataUser(editableData);
                                            context.read<OtherProvider>().editProfile();

                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                Future.delayed(const Duration(seconds: 3), () {
                                                  Navigator.pop(context);
                                                });
                                                return AlertDialog(
                                                  content: SizedBox(
                                                    height: 192,
                                                    width: 252,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Image.asset("assets/icons/done.png"),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        const Text(
                                                          "Perubahan disimpan",
                                                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.purpleAppbar),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      )
                                    : Container(
                                        width: MediaQuery.of(context).size.width,
                                        alignment: Alignment.center,
                                        child: ButtonPurple(
                                          buttonText: "Logout",
                                          onPressed: () {
                                            context.read<AuthServicesProvider>().signOut(context);
                                          },
                                        ),
                                      ),
                                const Gap(20)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    });
  }
}
