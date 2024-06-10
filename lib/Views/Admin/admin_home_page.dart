import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:provider/provider.dart';
import 'package:resquecare/View-Model/admin_pengaduan_provider.dart';
import 'package:resquecare/View-Model/panggilan_darurat_provider.dart';
import 'package:resquecare/Views/Admin/Nomor_Panggilan_Darurat/nomor_panggilan_darurat_page.dart';
import 'package:resquecare/Views/Admin/Pengaduan/laporan_pengaduan_page.dart';
import 'package:resquecare/Widgets/transition.dart';
import 'package:resquecare/colors.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: Container(
      //   width: MediaQuery.of(context).size.width,
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
      //         onPressed: () {},
      //         icon: const Icon(Icons.home_filled),
      //         color: Colors.white,
      //         iconSize: 35,
      //       ),
      //       Consumer<AuthServicesProvider>(builder: (context, value, child) {
      //         return IconButton(
      //           onPressed: () {
      //             late Accounts data;
      //             final streamData = value.dataUser;
      //             for (var e in streamData) {
      //               data = e;
      //             }
      //             print("=" * 20);
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
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<PanggilanDaruratProvider>()
                            .getDataNomorPanggilanDarurat();
                        Navigator.push(context,
                            createRoute(const NomorPanggilanDaruratPage()));
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
                              "Nomor Panggilan Darurat",
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
                        context
                            .read<AdminPengaduanProvider>()
                            .getDataPengaduanUser();
                        Navigator.push(context,
                            createRoute(const LapporanPengaduanPage()));
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
                              "Laporan Pengaduan",
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
