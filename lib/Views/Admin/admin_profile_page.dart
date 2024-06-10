// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:resquecare/Widgets/button_purple.dart';
// import 'package:resquecare/Widgets/custom_text_form_field.dart';
// import 'package:resquecare/colors.dart';

// class AdminProfilePage extends StatefulWidget {
//   const AdminProfilePage({super.key});

//   @override
//   State<AdminProfilePage> createState() => _AdminProfilePageState();
// }

// class _AdminProfilePageState extends State<AdminProfilePage> {
//   bool isEdit = false; //untuk mengubah kondisi mengubah profile atau tidak
//   File? _image; //mengambil gambar
//   List<File> listImage = [];
//   //Gallery
//   Future _pickImageFromGallery(context) async {
//     final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (returnImage == null) return;
//     setState(() {
//       if (listImage.isNotEmpty) {
//         listImage.clear();
//       }
//       _image = File(returnImage.path);
//       listImage.add(_image!);
//     });
//     Navigator.of(context).pop(); //close the model sheet
//   }

// //Camera
//   Future _pickImageFromCamera(context) async {
//     final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (returnImage == null) return;
//     setState(() {
//       if (listImage.isNotEmpty) {
//         listImage.clear();
//       }
//       _image = File(returnImage.path);
//       listImage.add(_image!);
//     });
//     Navigator.of(context).pop();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       floatingActionButton: isEdit
//           ? ButtonPurple(
//               buttonText: "Simpan",
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     Future.delayed(const Duration(seconds: 3), () {
//                     });
//                     return AlertDialog(
//                       content: SizedBox(
//                         height: 192,
//                         width: 252,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset("assets/icons/done.png"),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             const Text(
//                               "Perubahan disimpan",
//                               style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.purpleAppbar),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//                 setState(() {
//                   isEdit = false;
//                 });
//               },
//             )
//           : ButtonPurple(
//               buttonText: "Logout",
//               onPressed: () {},
//             ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: const BackButton(
//           color: Colors.white,
//         ),
//         title: const Text("Akun"),
//       ),
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           Positioned(
//             bottom: -170,
//             child: Container(
//               height: MediaQuery.of(context).size.height / 1.2,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: AppColors.purpleRandom,
//                 borderRadius: BorderRadius.circular(70),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(60, 100, 60, 0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 isEdit
//                     ? Stack(
//                         children: [
//                           listImage.isNotEmpty
//                               ? Container(
//                                   width: double.infinity,
//                                   alignment: Alignment.center,
//                                   child: Container(
//                                     height: 120,
//                                     width: 120,
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         image: FileImage(listImage[0]),
//                                         fit: BoxFit.cover,
//                                       ),
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: AppColors.purpleRandom,
//                                         width: 3,
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : Container(
//                                   width: double.infinity,
//                                   alignment: Alignment.center,
//                                   child: Container(
//                                     height: 120,
//                                     width: 120,
//                                     decoration: BoxDecoration(
//                                       image: const DecorationImage(
//                                         image: AssetImage("assets/icons/person.png"),
//                                         fit: BoxFit.cover,
//                                       ),
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: AppColors.purpleRandom,
//                                         width: 3,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                           Positioned(
//                             bottom: -0,
//                             left: 160,
//                             child: Container(
//                               height: 40,
//                               width: 40,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.white,
//                               ),
//                               child: IconButton(
//                                 onPressed: () {
//                                   showModalBottomSheet(
//                                       backgroundColor: AppColors.purpleRandom,
//                                       context: context,
//                                       builder: (builder) {
//                                         return Padding(
//                                           padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
//                                           child: SizedBox(
//                                             width: MediaQuery.of(context).size.width,
//                                             height: MediaQuery.of(context).size.height / 4.5,
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                   children: [
//                                                     const Text(
//                                                       "Foto Profil",
//                                                       style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                                                     ),
//                                                     InkWell(
//                                                       onTap: () {
//                                                         setState(() {
//                                                           listImage.remove(listImage[0]);
//                                                         });
//                                                       },
//                                                       child: const ImageIcon(
//                                                         AssetImage("assets/icons/trash.png"),
//                                                         size: 70,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 const Gap(20),
//                                                 Row(
//                                                   children: [
//                                                     Expanded(
//                                                       child: InkWell(
//                                                         onTap: () {
//                                                           _pickImageFromCamera(context);
//                                                         },
//                                                         child: Column(
//                                                           children: [
//                                                             Container(
//                                                               height: 50,
//                                                               width: 50,
//                                                               decoration: BoxDecoration(
//                                                                 shape: BoxShape.circle,
//                                                                 border: Border.all(
//                                                                   color: AppColors.purpleAppbar,
//                                                                   width: 3,
//                                                                 ),
//                                                                 color: Colors.white,
//                                                               ),
//                                                               child: const Icon(
//                                                                 Icons.camera_alt,
//                                                                 size: 28,
//                                                               ),
//                                                             ),
//                                                             const Text("Kamera")
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Expanded(
//                                                       child: InkWell(
//                                                         onTap: () {
//                                                           _pickImageFromGallery(context);
//                                                         },
//                                                         child: Column(
//                                                           children: [
//                                                             Container(
//                                                               height: 50,
//                                                               width: 50,
//                                                               decoration: BoxDecoration(
//                                                                 shape: BoxShape.circle,
//                                                                 border: Border.all(
//                                                                   color: AppColors.purpleAppbar,
//                                                                   width: 3,
//                                                                 ),
//                                                                 color: Colors.white,
//                                                               ),
//                                                               child: const Icon(
//                                                                 Icons.image,
//                                                                 size: 28,
//                                                               ),
//                                                             ),
//                                                             const Text("Gallery")
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                                       });
//                                 },
//                                 icon: const Icon(
//                                   Icons.camera_alt,
//                                   size: 20,
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       )
//                     : Container(
//                         width: double.infinity,
//                         alignment: Alignment.center,
//                         child: Container(
//                           height: 120,
//                           width: 120,
//                           decoration: BoxDecoration(
//                             image: const DecorationImage(
//                               image: AssetImage("assets/icons/person.png"),
//                               fit: BoxFit.cover,
//                             ),
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               color: AppColors.purpleRandom,
//                               width: 3,
//                             ),
//                           ),
//                         ),
//                       ),
//                 isEdit
//                     ? Container()
//                     : Container(
//                         width: double.infinity,
//                         alignment: Alignment.center,
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               isEdit = true;
//                             });
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset("assets/icons/pencil.png"),
//                               const Text(
//                                 "Edit",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 15,
//                                   color: Colors.black,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                 const Text(
//                   "Username :",
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
//                 ),
//                 const Gap(5),
//                 CustomTextField(
//                   readOnly: isEdit ? false : true,
//                   hintText: 'Farhan',
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//                 const Gap(20),
//                 const Text(
//                   "Nama Lengkap :",
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
//                 ),
//                 const Gap(5),
//                 CustomTextField(
//                   readOnly: isEdit ? false : true,
//                   hintText: 'muhammad farhan',
//                   obsecureText: true,
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//                 const Gap(20),
//                 const Text(
//                   "No HP :",
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
//                 ),
//                 const Gap(5),
//                 CustomTextField(
//                   readOnly: isEdit ? false : true,
//                   hintText: '085678456321',
//                   obsecureText: true,
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
