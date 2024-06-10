import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:provider/provider.dart';
import 'package:resquecare/View-Model/panggilan_darurat_provider.dart';
import 'package:resquecare/Views/Features/Edukasi/edukasi_page.dart';
import 'package:resquecare/Views/Features/Panduan_Aplikasi/panduan_page.dart';
import 'package:resquecare/Views/Features/Panggilan_Darurat/panggilan_darurat_page.dart';
import 'package:resquecare/Views/Features/Pengaduan/pengaduan.dart';
import 'package:resquecare/Widgets/transition.dart';
import 'package:resquecare/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: Container(
      //   width: MediaQuery.of(context).size.width, //mendapatkan ukuran dari android
      //   height: 80,
      //   decoration: const BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(20),
      //       topRight: Radius.circular(20),
      //     ),
      //     color: AppColors.purpleAppbar,
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(
      //         onPressed: () {
      //           context.read<AdminPengaduanProvider>().getDataPengaduanUser();
      //           Navigator.push(context, createRoute(const NotificationPage()));
      //         },
      //         icon: const Icon(Icons.notifications_rounded),
      //         color: Colors.white,
      //         iconSize: 35,
      //       ),
      //       IconButton(
      //         onPressed: () {},
      //         icon: const Icon(Icons.home_filled),
      //         color: Colors.white,
      //         iconSize: 35,
      //       ),
      //       Consumer<AuthServicesProvider>(builder: (context, value, child) {
      //         return IconButton(
      //           onPressed: () {
      //             late Accounts data;
      //             final dataList = value.dataUser;

      //             for (var element in dataList) {
      //               data = element;
      //             }
      //             print(data);
      //             Navigator.push(context, createRoute(const ProfilePage()));
      //           },
      //           icon: const Icon(Icons.person),
      //           color: Colors.white,
      //           iconSize: 35,
      //         );
      //       }),
      //     ],
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        //digunakan untuk menumpuk widget
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      //widget
                      onTap: () {
                        context
                            .read<PanggilanDaruratProvider>()
                            .getDataNomorPanggilanDarurat();
                        Navigator.push(
                            context, createRoute(const PanggilanDaruratPage()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 129,
                            width: 134,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: AppColors.purpleButton,
                                width: 3,
                              ),
                            ),
                            child: Image.asset(
                              "assets/icons/siren.png",
                              width: 75,
                            ),
                          ),
                          const SizedBox(
                            width: 124,
                            height: 65,
                            child: Text(
                              "Panggilan Darurat",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                  overflow: TextOverflow.clip),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context, createRoute(const PengaduanPage()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 129,
                            width: 134,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: AppColors.purpleButton,
                                width: 3,
                              ),
                            ),
                            child: Image.asset(
                              "assets/icons/cs.png",
                              width: 75,
                            ),
                          ),
                          const SizedBox(
                            width: 124,
                            height: 65,
                            child: Text(
                              "Pengaduan",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                  overflow: TextOverflow.clip),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context, createRoute(const EdukasiPage()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 129,
                            width: 134,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: AppColors.purpleButton,
                                width: 3,
                              ),
                            ),
                            child: Image.asset(
                              "assets/icons/edukasi.png",
                              width: 75,
                            ),
                          ),
                          const SizedBox(
                            width: 124,
                            height: 65,
                            child: Text(
                              "Edukasi Penganan ODGJ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                  overflow: TextOverflow.clip),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context, createRoute(const PanduanPage()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 129,
                            width: 134,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: AppColors.purpleButton,
                                width: 3,
                              ),
                            ),
                            child: Image.asset(
                              "assets/icons/phone.png",
                              width: 75,
                            ),
                          ),
                          const SizedBox(
                            width: 124,
                            height: 65,
                            child: Text(
                              "Panduan Aplikasi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                  overflow: TextOverflow.clip),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: -20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.purpleBackground,
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/bg[0].png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: -5,
            child: ChatBubble(
              //bentuk seperti buble chat
              clipper: ChatBubbleClipper6(
                type: BubbleType.receiverBubble,
              ),
              backGroundColor: AppColors.purpleRandom,
              child: const SizedBox(
                width: 306,
                height: 100,
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Datang",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      Text(
                        "RescueCare",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
