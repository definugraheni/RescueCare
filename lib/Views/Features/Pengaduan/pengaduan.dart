import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:resquecare/Models/pengaduan_model.dart';
import 'package:resquecare/View-Model/others_provider.dart';
import 'package:resquecare/View-Model/pengaduan_provider.dart';
import 'package:resquecare/Views/Features/Pengaduan/maps.dart';
import 'package:resquecare/Widgets/button_purple.dart';
import 'package:resquecare/Widgets/custom_text_form_field.dart';
import 'package:resquecare/Widgets/transition.dart';
import 'package:resquecare/colors.dart';
import 'package:resquecare/main.dart';

class PengaduanPage extends StatefulWidget {
  const PengaduanPage({super.key});

  @override
  State<PengaduanPage> createState() => _PengaduanPageState();
}

class _PengaduanPageState extends State<PengaduanPage> {
  final descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final locationDescController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String address = '';
  String pictUrl = "";
  File? _image; //mengambil gambar
  List<File> listImage = [];

  Future<Position> _getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location service is not enabled");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permission are permanently denied");
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}';
    setState(() {});
  }

  Future<void> uploadImage(File selectedImage) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('pengaduan')
        .child(selectedImage.path.split("/").last);
    try {
      await ref.putFile(selectedImage);
      String downloadUrl = await ref.getDownloadURL();
      setState(() {
        pictUrl = downloadUrl;
        print("=*=" * 30);
        print(pictUrl);
      });
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  //Gallery
  Future _pickImageFromGallery(context) async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
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
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
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

  void deleteImage(data) {
    listImage.remove(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Pengaduan"),
      ),
      body: Consumer<OtherProvider>(builder: (context, value, child) {
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Deskripsi  :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(5),
                  CustomTextField(
                    controller: descController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Description cannot be empty";
                      }
                      return null;
                    },
                    hintText: "Deskripsi",
                    maxLine: 3,
                  ),
                  const Gap(20),
                  const Text(
                    "Tanggal :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(5),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please select date";
                      }
                      return null;
                    },
                    controller: dateController,
                    onTap: () async {
                      final selectDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2010),
                        lastDate: DateTime(DateTime.now().year + 3),
                        initialDate: DateTime.now(),
                      );
                      setState(() {
                        if (selectDate != null) {
                          dateController.text = DateFormat('EEEE, dd MMMM yyyy')
                              .format(selectDate);
                        }
                      });
                    },
                    prefixIcon: const Icon(Icons.date_range_rounded),
                    readOnly: true,
                    hintText: "Klik Untuk Menambahkan Tanggal",
                  ),
                  const Gap(20),
                  const Text(
                    "Lokasi Kejadian :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(5),
                  CustomTextField(
                    controller: locationController,
                    readOnly: true,
                    onTap: () async {
                      Position getPosition = await _getCurrentPosition();
                      print(
                          "Coornidate ${getPosition.latitude}, ${getPosition.longitude}");
                      getAddressFromLatLong(getPosition);
                      // print(address);
                      locationController = TextEditingController(text: address);
                      Navigator.push(
                          context,
                          createRoute(MapsPage(
                              latitude: getPosition.latitude,
                              longitude: getPosition.longitude)));
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Location cannot be empty";
                      }
                      return null;
                    },
                    prefixIcon: const Icon(
                      Icons.location_on,
                    ),
                    hintText: "Klik Untuk Menambahkan Lokasi",
                    maxLine: address == "" ? 1 : 4,
                  ),
                  const Gap(20),
                  const Text(
                    "Keterangan :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(5),
                  CustomTextField(
                    controller: locationDescController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Location description cannot be empty";
                      }
                      return null;
                    },
                    hintText: "Tambahkan  Keterangan Lokasi",
                  ),
                  const Gap(20),
                  const Text(
                    "Tambahkan Bukti Kejadian  :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(5),
                  Row(
                    children: [
                      listImage.isEmpty
                          ? Container()
                          : Expanded(
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: listImage.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                ),
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: FileImage(
                                                  File(listImage[index].path)),
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                      Positioned(
                                          top: 0,
                                          right: 0,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                deleteImage(listImage[index]);
                                              });
                                            },
                                            child: const Icon(Icons.cancel,
                                                color: Colors.red),
                                          ))
                                    ],
                                  );
                                },
                              ),
                            ),
                      Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColors.purpleButton),
                        ),
                        child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  backgroundColor: AppColors.purpleRandom,
                                  context: context,
                                  builder: (builder) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 50, 20, 0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4.5,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  _pickImageFromCamera(context);
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: AppColors
                                                              .purpleAppbar,
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
                                                  _pickImageFromGallery(
                                                      context);
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: AppColors
                                                              .purpleAppbar,
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
                                      ),
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                              size: 40,
                            )),
                      ),
                    ],
                  ),
                  const Gap(40),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: ButtonPurple(
                      fixedSize: const Size(200, 46),
                      buttonText: "Ajukan Pengaduan",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (listImage.isNotEmpty) {
                            uploadImage(listImage[0]).then(
                              (value) {
                                final data = PengaduanModel(
                                  deskripsiKejadian: descController.text,
                                  keteranganLokasi: locationDescController.text,
                                  lokasiKejadian: locationController.text,
                                  buktiFoto: pictUrl,
                                  tanggalKejadian: dateController.text,
                                  status: 'waiting',
                                );
                                descController.clear();
                                dateController.clear();
                                locationController.clear();
                                locationDescController.clear();
                                listImage.clear();
                                context
                                    .read<PengaduanProvider>()
                                    .tambahPengaduan(data);
                              },
                            );
                          }

                          showDialog(
                            context: context,
                            builder: (context) {
                              Future.delayed(const Duration(seconds: 3), () {
                                Navigator.push(
                                    context, createRoute(const Navbar()));
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
                                        "Aduan berhasil",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: AppColors.purpleAppbar),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
