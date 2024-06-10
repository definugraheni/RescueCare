import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:resquecare/Models/panggilan_darurat_model.dart';
import 'package:resquecare/View-Model/panggilan_darurat_provider.dart';
import 'package:resquecare/Widgets/button_purple.dart';
import 'package:resquecare/Widgets/button_white.dart';
import 'package:resquecare/Widgets/custom_text_form_field.dart';
import 'package:resquecare/Widgets/transition.dart';
import 'package:resquecare/colors.dart';
import 'package:resquecare/main.dart';

class EditNomorPage extends StatelessWidget {
  final PanggilanDaruratModel dataPanggilan;
  const EditNomorPage({super.key, required this.dataPanggilan});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();

    nameController.text = dataPanggilan.fullname;
    phoneController.text = dataPanggilan.phoneNumber;
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonWhite(
            buttonText: "Hapus",
            onPressed: () {
              context
                  .read<PanggilanDaruratProvider>()
                  .deleteCallNumber(dataPanggilan.id);
              Navigator.push(context, createRoute(const AdminNavbar()));

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
                          const Gap(20),
                          const Text(
                            "Hapus nomor berhasil",
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
            },
          ),
          ButtonPurple(
            buttonText: "Simpan",
            onPressed: () {
              final data = PanggilanDaruratModel(
                id: dataPanggilan.id,
                fullname: nameController.text,
                phoneNumber: phoneController.text,
              );
              context.read<PanggilanDaruratProvider>().editCallNumber(data);
              Navigator.push(context, createRoute(const AdminNavbar()));
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
                          const Gap(20),
                          const Text(
                            "Edit nomor berhasil",
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
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Panggilan Darurat"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nama :",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const Gap(5),
            CustomTextField(
              hintText: dataPanggilan.fullname,
              controller: nameController,
            ),
            const Gap(20),
            const Text(
              "Nomor :",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const Gap(5),
            CustomTextField(
              controller: phoneController,
              hintText: dataPanggilan.phoneNumber,
            ),
          ],
        ),
      ),
    );
  }
}
