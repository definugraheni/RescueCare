import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:provider/provider.dart";
import "package:resquecare/Models/pengaduan_model.dart";
import "package:resquecare/View-Model/admin_pengaduan_provider.dart";
import "package:resquecare/Widgets/button_purple.dart";
import "package:resquecare/Widgets/button_white.dart";
import "package:resquecare/Widgets/custom_text_form_field.dart";
import "package:resquecare/colors.dart";

class AdminPengaduanPage extends StatelessWidget {
  final PengaduanModel dataPengaduan;
  const AdminPengaduanPage({super.key, required this.dataPengaduan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonWhite(
            buttonText: "Tolak",
            onPressed: () {
              final data = PengaduanModel(
                id: dataPengaduan.id,
                deskripsiKejadian: dataPengaduan.deskripsiKejadian,
                keteranganLokasi: dataPengaduan.keteranganLokasi,
                lokasiKejadian: dataPengaduan.lokasiKejadian,
                buktiFoto: dataPengaduan.buktiFoto,
                tanggalKejadian: dataPengaduan.tanggalKejadian,
                status: "rejected",
              );
              context.read<AdminPengaduanProvider>().konfirmasiPengaduan(data);
              showDialog(
                context: context,
                builder: (context) {
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
                  return AlertDialog(
                    content: SizedBox(
                      height: 192,
                      width: 252,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/reject.png"),
                          const Gap(20),
                          const Text(
                            "Konfirmasi ditolak",
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
          ButtonPurple(
            buttonText: "Konfirmasi",
            onPressed: () {
              final data = PengaduanModel(
                id: dataPengaduan.id,
                deskripsiKejadian: dataPengaduan.deskripsiKejadian,
                keteranganLokasi: dataPengaduan.keteranganLokasi,
                lokasiKejadian: dataPengaduan.lokasiKejadian,
                buktiFoto: dataPengaduan.buktiFoto,
                tanggalKejadian: dataPengaduan.tanggalKejadian,
                status: "accepted",
              );
              context.read<AdminPengaduanProvider>().konfirmasiPengaduan(data);
              showDialog(
                context: context,
                builder: (context) {
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.pop(context);
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
                            "Konfirmasi berhasil",
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Pengaduan"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(dataPengaduan.buktiFoto),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
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
                    readOnly: true,
                    hintText: dataPengaduan.deskripsiKejadian,
                    maxLine: 3,
                  ),
                  const Gap(20),
                  const Text(
                    "Tanggal :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(5),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.date_range_rounded),
                    readOnly: true,
                    hintText: dataPengaduan.tanggalKejadian,
                  ),
                  const Gap(20),
                  const Text(
                    "Lokasi Kejadian :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(5),
                  CustomTextField(
                    readOnly: true,
                    prefixIcon: const Icon(
                      Icons.location_on,
                    ),
                    hintText: dataPengaduan.lokasiKejadian,
                  ),
                  const Gap(20),
                  const Text(
                    "Keterangan :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(5),
                  CustomTextField(
                    readOnly: true,
                    hintText: dataPengaduan.keteranganLokasi,
                  ),
                  const Gap(100)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
