import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:resquecare/Models/pengaduan_model.dart';
import 'package:resquecare/View-Model/admin_pengaduan_provider.dart';
import 'package:resquecare/View-Model/enum.dart';
import 'package:resquecare/Views/Features/Pengaduan/status_pengaduan.dart';
import 'package:resquecare/Widgets/transition.dart';
import 'package:resquecare/colors.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminPengaduanProvider>(builder: (context, value, child) {
      switch (value.state) {
        case ViewState.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case ViewState.none:
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: const BackButton(
                  color: Colors.white,
                ),
                title: const Text("Notifikasi"),
              ),
              body: StreamBuilder<List<PengaduanModel>>(
                  stream: value.getDataPengaduan,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(snapshot.hasError.toString());
                    } else if (snapshot.hasData) {
                      List<PengaduanModel> getDataPengaduan = snapshot.data!;
                      return ListView.separated(
                        itemCount: getDataPengaduan.length,
                        separatorBuilder: (context, index) => const Gap(10),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  createRoute(StatusPengaduanPage(
                                    dataPengaduan: getDataPengaduan[index],
                                  )));
                            },
                            child: Card(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: AppColors.purpleButton),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 4,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  title: Text(
                                    "Aduan ${index + 1}",
                                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        getDataPengaduan[index].tanggalKejadian,
                                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                                      ),
                                      const Row(
                                        children: [
                                          Text(
                                            "Status Aduan",
                                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xffA367B1)),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Color(0xffA367B1),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: Image.network(getDataPengaduan[index].buktiFoto, width: 50,)
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }));
        default:
          return Container();
      }
    });
  }
}
