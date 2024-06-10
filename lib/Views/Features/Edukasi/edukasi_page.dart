import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:resquecare/colors.dart';

class EdukasiPage extends StatelessWidget {
  const EdukasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Edukasi Penanganan ODGJ"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: AppColors.purpleButton),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 133,
              width: 354,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 226,
                    child: Text("1. Tidak menggunakan kekerasan dan menghakimi ODGJ", style: TextStyle(fontSize: 12),),
                  ),
                  Image.asset(
                    "assets/images/edukasi_1.png",
                    width: 90,
                  ),
                ],
              ),
            ),
          ),
          const Gap(10),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: AppColors.purpleButton),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 133,
              width: 354,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/edukasi_2.png",
                    width: 90,
                  ),
                  const SizedBox(
                    width: 226,
                    child: Text("2. Tidak panik dan segera laporkan pada pihak yang berwenang agar ODGJ dapat segera di tangani", style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(10),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: AppColors.purpleButton),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 133,
              width: 354,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 226,
                    child: Text("3. Apabila terdapat resiko yang membahayakan usahakan untuk menjauh dan tungggu pihak yang berwenang bertindak.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Image.asset(
                    "assets/images/edukasi_3.png",
                    width: 90,
                  ),
                ],
              ),
            ),
          ),
          const Gap(10),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: AppColors.purpleButton),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 133,
              width: 354,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/edukasi_4.png",
                    width: 90,
                  ),
                  const SizedBox(
                    width: 226,
                    child: Text("4. Tidak mengganggu dan memancing ODGJ secara emosional",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(10),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: AppColors.purpleButton),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 133,
              width: 354,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 226,
                    child: Text("5. Jika memungkinkan tunjukkan empati dan Katakan Kamu Bisa Membantu",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Image.asset(
                    "assets/images/edukasi_5.png",
                    width: 90,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
