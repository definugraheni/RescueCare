import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:resquecare/colors.dart';

class PanduanPage extends StatefulWidget {
  const PanduanPage({super.key});

  @override
  State<PanduanPage> createState() => _PanduanPageState();
}

class _PanduanPageState extends State<PanduanPage> {
  List<String> isExpand = [];
  final List<String> _id = [
    "hgcfg66ikUqjyagCnFh_0Q",
    "YsyOYBUwV0yJRJU_rrtY6Q",
    "dcn7T9ggUEWjcKjTDC4MZQ",
    "tw0xE11Xa0q15B1nM6Kohw",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Panduan Aplikasi"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (isExpand.contains(_id[0])) {
                  isExpand.remove(_id[0]);
                } else {
                  isExpand.add(_id[0]);
                }
              });
            },
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: AppColors.purpleButton),
              ),
              child: AnimatedContainer(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  duration: const Duration(milliseconds: 500),
                  height: isExpand.contains(_id[0]) ? 300 : 81,
                  child: isExpand.contains(_id[0])
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              ListTile(
                                titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                                leading: SizedBox(
                                  width: 50,
                                  child: CircleAvatar(
                                    radius: 47,
                                    backgroundColor: Colors.black12,
                                    child: Image.asset(
                                      "assets/icons/siren.png",
                                      width: 30,
                                    ),
                                  ),
                                ),
                                title: const Text(
                                  "Fitur Panggilan Darurat",
                                  style: TextStyle(fontSize: 15),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isExpand.remove(_id[0]);
                                    });
                                  },
                                  icon: const Icon(Icons.keyboard_arrow_up),
                                ),
                              ),
                              const Divider(),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "1 ", children: [
                                    TextSpan(
                                      text: "Masuk ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "ke dalam aplikasi RescueCare",
                                    ),
                                  ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "2 Kemudian klik fitur ", children: [
                                    TextSpan(
                                      text: "Panggilan Darurat",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "3 Pilih ", children: [
                                    TextSpan(
                                      text: "nomor telepon ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "yang akan dihubungi",
                                    ),
                                  ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "4 Kemudian klik ", children: [
                                    TextSpan(
                                      text: "icon WhatsApp ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "pada sebelah nomor telepon yang akan dihubungi",
                                    ),
                                  ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "5 Lalu ", children: [
                                    TextSpan(
                                      text: "hubungi petugas ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "dengan menelepon menggunakan aplikasi WhatsApp",
                                    ),
                                  ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "6 Fitur ini digunakan pada situasi yang ", children: [
                                    TextSpan(
                                      text: "sangat darurat ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListTile(
                          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                          leading: SizedBox(
                            width: 50,
                            child: CircleAvatar(
                              radius: 47,
                              backgroundColor: Colors.black12,
                              child: Image.asset(
                                "assets/icons/siren.png",
                                width: 30,
                              ),
                            ),
                          ),
                          title: const Text(
                            "Fitur Panggilan Darurat",
                            style: TextStyle(fontSize: 15),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                isExpand.add(_id[0]);
                              });
                            },
                            icon: const Icon(Icons.keyboard_arrow_down),
                          ),
                        )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (isExpand.contains(_id[1])) {
                  isExpand.remove(_id[1]);
                } else {
                  isExpand.add(_id[1]);
                }
              });
            },
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: AppColors.purpleButton),
              ),
              child: AnimatedContainer(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  duration: const Duration(milliseconds: 500),
                  height: isExpand.contains(_id[1]) ? 300 : 81,
                  child: isExpand.contains(_id[1])
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              ListTile(
                                titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                                leading: SizedBox(
                                  width: 50,
                                  child: CircleAvatar(
                                    radius: 47,
                                    backgroundColor: Colors.black12,
                                    child: Image.asset(
                                      "assets/icons/cs.png",
                                      width: 30,
                                    ),
                                  ),
                                ),
                                title: const Text(
                                  "Fitur Pengaduan",
                                  style: TextStyle(fontSize: 15),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isExpand.remove(_id[1]);
                                    });
                                  },
                                  icon: const Icon(Icons.keyboard_arrow_up),
                                ),
                              ),
                              const Divider(),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "1 ", children: [
                                    TextSpan(
                                      text: "Masuk ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "ke dalam aplikasi RescueCare",
                                    ),
                                  ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "2 Kemudian klik fitur ", children: [
                                    TextSpan(
                                      text: "Pnegaduan",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "3 Mengisi ", children: [
                                    TextSpan(
                                      text: "form pengaduan ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "4 Harap mengisi ", children: [
                                    TextSpan(
                                      text: "seluruh form ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "yang tersedia",
                                    ),
                                  ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "5 Kemudian setelah mengisi klik ", children: [
                                    TextSpan(
                                      text: "Ajukan Pengaduan ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "6 Lalu akan muncul pop up ", children: [
                                    TextSpan(
                                      text: "Aduan berhasil ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListTile(
                          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                          leading: SizedBox(
                            width: 50,
                            child: CircleAvatar(
                              radius: 47,
                              backgroundColor: Colors.black12,
                              child: Image.asset(
                                "assets/icons/cs.png",
                                width: 30,
                              ),
                            ),
                          ),
                          title: const Text(
                            "Fitur Pengaduan",
                            style: TextStyle(fontSize: 15),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                isExpand.add(_id[1]);
                              });
                            },
                            icon: const Icon(Icons.keyboard_arrow_down),
                          ),
                        )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (isExpand.contains(_id[2])) {
                  isExpand.remove(_id[2]);
                } else {
                  isExpand.add(_id[2]);
                }
              });
            },
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: AppColors.purpleButton),
              ),
              child: AnimatedContainer(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  duration: const Duration(milliseconds: 500),
                  height: isExpand.contains(_id[2]) ? 300 : 81,
                  child: isExpand.contains(_id[2])
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              ListTile(
                                titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                                leading: SizedBox(
                                  width: 50,
                                  child: CircleAvatar(
                                    radius: 47,
                                    backgroundColor: Colors.black12,
                                    child: Image.asset(
                                      "assets/icons/edukasi.png",
                                      width: 30,
                                    ),
                                  ),
                                ),
                                title: const Text(
                                  "Fitur Edukasi Penanganan ODGJ",
                                  style: TextStyle(fontSize: 15),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isExpand.remove(_id[2]);
                                    });
                                  },
                                  icon: const Icon(Icons.keyboard_arrow_up),
                                ),
                              ),
                              const Divider(),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "1 ", children: [
                                    TextSpan(
                                      text: "Masuk ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "ke dalam aplikasi RescueCare",
                                    ),
                                  ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "2 Kemudian klik fitur ", children: [
                                    TextSpan(
                                      text: "Edukasi Penanganan ODGJ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "3 Fitur ini digunakan untuk mengetahui tata ", children: [
                                    TextSpan(
                                      text: "cara penanganan ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "dan sikap yang harus kita ambil ketika menghadapi ODGJ",
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListTile(
                          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                          leading: SizedBox(
                            width: 50,
                            child: CircleAvatar(
                              radius: 47,
                              backgroundColor: Colors.black12,
                              child: Image.asset(
                                "assets/icons/edukasi.png",
                                width: 30,
                              ),
                            ),
                          ),
                          title: const Text(
                            "Fitur Edukasi Penanganan ODGJ",
                            style: TextStyle(fontSize: 15),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                isExpand.add(_id[2]);
                              });
                            },
                            icon: const Icon(Icons.keyboard_arrow_down),
                          ),
                        )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (isExpand.contains(_id[3])) {
                  isExpand.remove(_id[3]);
                } else {
                  isExpand.add(_id[3]);
                }
              });
            },
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: AppColors.purpleButton),
              ),
              child: AnimatedContainer(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  duration: const Duration(milliseconds: 500),
                  height: isExpand.contains(_id[3]) ? 300 : 81,
                  child: isExpand.contains(_id[3])
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              ListTile(
                                titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                                leading: SizedBox(
                                  width: 50,
                                  child: CircleAvatar(
                                    radius: 47,
                                    backgroundColor: Colors.black12,
                                    child: Image.asset(
                                      "assets/icons/phone.png",
                                      width: 30,
                                    ),
                                  ),
                                ),
                                title: const Text(
                                  "Fitur Panduan Aplikasi",
                                  style: TextStyle(fontSize: 15),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isExpand.remove(_id[3]);
                                    });
                                  },
                                  icon: const Icon(Icons.keyboard_arrow_up),
                                ),
                              ),
                              const Divider(),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "1 ", children: [
                                    TextSpan(
                                      text: "Masuk ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "ke dalam aplikasi RescueCare",
                                    ),
                                  ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "2 Kemudian klik fitur ", children: [
                                    TextSpan(
                                      text: "Panduan Aplikasi",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "3 Fitur ini digunakan untuk mengetahui  ", children: [
                                    TextSpan(
                                      text: "petunjuk penggunaan ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "fitur yang ada di RescueCare",
                                    ),
                                  ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(left: 10, right: 50),
                                width: MediaQuery.of(context).size.width,
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: const TextSpan(style: TextStyle(fontSize: 14, color: Colors.black, wordSpacing: 2), text: "4 Untuk mengetahui penggunaan fitur maka klik ", children: [
                                    TextSpan(
                                      text: "dropdown ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "yang ada pada fitur yang ingin dilihat",
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListTile(
                          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                          leading: SizedBox(
                            width: 50,
                            child: CircleAvatar(
                              radius: 47,
                              backgroundColor: Colors.black12,
                              child: Image.asset(
                                "assets/icons/phone.png",
                                width: 30,
                              ),
                            ),
                          ),
                          title: const Text(
                            "Fitur Panduan Aplikasi",
                            style: TextStyle(fontSize: 15),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                isExpand.add(_id[3]);
                              });
                            },
                            icon: const Icon(Icons.keyboard_arrow_down),
                          ),
                        )),
            ),
          ),
        ],
      ),
    );
  }
}
