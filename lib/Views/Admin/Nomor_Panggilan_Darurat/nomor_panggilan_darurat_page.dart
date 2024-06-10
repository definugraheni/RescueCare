import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resquecare/Models/panggilan_darurat_model.dart';
import 'package:resquecare/View-Model/panggilan_darurat_provider.dart';
import 'package:resquecare/Views/Admin/Nomor_Panggilan_Darurat/edit_nomor_page.dart';
import 'package:resquecare/Views/Admin/Nomor_Panggilan_Darurat/tambah_nomor_page.dart';
import 'package:resquecare/Widgets/transition.dart';
import 'package:resquecare/colors.dart';

class NomorPanggilanDaruratPage extends StatelessWidget {
  const NomorPanggilanDaruratPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          Navigator.push(context, createRoute(const TambahNomorPage()));
        },
        backgroundColor: AppColors.purpleAppbar,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Panggilan Darurat"),
      ),
      body: Consumer<PanggilanDaruratProvider>(builder: (context, value, child) {
        return StreamBuilder<List<PanggilanDaruratModel>>(
            stream: value.getDataNomor,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.hasError.toString());
              }
              if (snapshot.hasData) {
                List<PanggilanDaruratModel> getDataNomor = snapshot.data!;
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 20),
                  itemCount: getDataNomor.length,
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: AppColors.purpleButton),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                createRoute(EditNomorPage(
                                  dataPanggilan: getDataNomor[index],
                                )));
                          },
                          leading: const SizedBox(
                            width: 50,
                            child: CircleAvatar(
                              radius: 47,
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 47,
                              ),
                            ),
                          ),
                          title: Text("Panggilan Darurat ${index + 1}"),
                          subtitle: Text(
                            getDataNomor[index].phoneNumber,
                            style: const TextStyle(color: Colors.black87),
                          ),
                          trailing: const Icon(Icons.mode),
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
            });
      }),
    );
  }
}
