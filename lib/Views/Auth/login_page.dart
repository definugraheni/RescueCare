import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:resquecare/View-Model/auth_services.dart';
import 'package:resquecare/Views/Auth/register_page.dart';
import 'package:resquecare/Widgets/button_purple.dart';
import 'package:resquecare/Widgets/transition.dart';
import 'package:resquecare/colors.dart';

import '../../Widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purpleBackground,
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg[0].png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          //agar tidak overflow
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Masuk",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              const Gap(10), //pengganti sizedbox atau widget untuk ruang kosong
              const Text(
                "Selamat Datang Kembali",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: AppColors.purpleText,
                ),
              ),
              const Gap(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(5, 5),
                      blurRadius: 3,
                    ),
                  ]),
                  child: Card(
                    child: Form(
                      //untuk validator
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Email :",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                            const Gap(5),
                            CustomTextField(
                              hintText: 'Email...',
                              controller: emailController,
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "Please enter email address";
                                }

                                return null;
                              },
                            ),
                            const Gap(20),
                            const Text(
                              "Password :",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                            const Gap(5),
                            CustomTextField(
                              hintText: 'Password...',
                              obsecureText: true,
                              controller: passwordController,
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "Please enter password";
                                }
                                return null;
                              },
                            ),
                            const Gap(20),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: ButtonPurple(
                                buttonText: "Masuk",
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    print("Here");
                                    context.read<AuthServicesProvider>().signIn(emailController.text, passwordController.text, context);
                                    showDialog(
                                      //popup
                                      context: context,
                                      builder: (context) {
                                        Future.delayed(const Duration(seconds: 3), () {});
                                        return AlertDialog(
                                          //pop up bernama alert dialog
                                          content: SizedBox(
                                            height: 192,
                                            width: 252,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset("assets/icons/done.png"),
                                                const Gap(20),
                                                const Text(
                                                  "Masuk berhasil",
                                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.purpleAppbar),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    // emailController.clear();
                                    // passwordController.clear();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Belum punya akun?",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, createRoute(const RegisterPage()));
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.purpleTextDarker,
                    ),
                    child: const Text("Daftar di sini"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
