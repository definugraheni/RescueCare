import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resquecare/Models/panggilan_darurat_model.dart';
import 'package:resquecare/View-Model/panggilan_darurat_provider.dart';
import 'package:resquecare/colors.dart';

class PanggilanDaruratPage extends StatelessWidget {
  const PanggilanDaruratPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          trailing: Image.asset(
                            "assets/icons/WA.png",
                            width: 26,
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
            });
      }),
    );
  }
}
