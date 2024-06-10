import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:resquecare/Models/profile_model.dart';
import 'package:resquecare/View-Model/auth_services.dart';
import 'package:resquecare/View-Model/others_provider.dart';
import 'package:resquecare/Views/Auth/login_page.dart';
import 'package:resquecare/Widgets/button_purple.dart';
import 'package:resquecare/Widgets/transition.dart';
import 'package:resquecare/colors.dart';

import '../../Widgets/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
        child: Consumer<OtherProvider>(builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Daftar",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                const Gap(10),
                const Text(
                  "Jejak baik dimulai dari sini!",
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
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 30, 20, 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Nama Lengkap :",
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              const Gap(5),
                              CustomTextField(
                                hintText: 'Nama Lengkap...',
                                controller: fullNameController,
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    return "Please enter your name";
                                  }
                                  return null;
                                },
                              ),
                              const Gap(20),
                              const Text(
                                "Nomor Telepon :",
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              const Gap(5),
                              CustomTextField(
                                keyboardType: TextInputType.phone,
                                hintText: 'Nomor Telepon...',
                                controller: phoneNumberController,
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    return "Please enter phone number";
                                  }
                                  return null;
                                },
                              ),
                              const Gap(20),
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
                                "Username :",
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              const Gap(5),
                              CustomTextField(
                                hintText: 'Username...',
                                controller: usernameController,
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    return "Please enter username address";
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
                              const Text(
                                "Konfirmasi Password :",
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                              const Gap(5),
                              CustomTextField(
                                hintText: 'Konfirmasi Password...',
                                controller: confirmPasswordController,
                                obsecureText: true,
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    return "Please enter confirm username";
                                  }
                                  if (p0 != passwordController.text) {
                                    return "Confirm password is incorrect";
                                  }
                                  return null;
                                },
                              ),
                              const Gap(20),
                              Row(
                                children: [
                                  Checkbox(
                                    value: value.isCheckedTnC,
                                    onChanged: (value) {
                                      context.read<OtherProvider>().changeTnC();
                                    },
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: RichText(
                                      overflow: TextOverflow.clip,
                                      text: const TextSpan(
                                        text: "Saya menyetujui",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: " Syarat & Ketentuan",
                                            style: TextStyle(
                                              color: AppColors.purpleTextDarker,
                                            ),
                                          ),
                                          TextSpan(text: " dan"),
                                          TextSpan(
                                            text: " Kebijakan Privasi",
                                            style: TextStyle(
                                              color: AppColors.purpleTextDarker,
                                            ),
                                          ),
                                          TextSpan(
                                            text: " RescueCare",
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const Gap(20),
                              Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: ButtonPurple(
                                  buttonText: "Daftar",
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (value.isCheckedTnC == true) {
                                        final data = Accounts(
                                          fullname: fullNameController.text,
                                          username: usernameController.text,
                                          email: emailController.text,
                                          phoneNumber: phoneNumberController.text,
                                          role: "user",
                                          profilePict: '',
                                        );

                                        context.read<AuthServicesProvider>().signUp(data, passwordController.text, context);
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            Future.delayed(const Duration(seconds: 3), () {});
                                            return AlertDialog(
                                              content: SizedBox(
                                                height: 192,
                                                width: 252,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset("assets/icons/done.png"),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    const Text(
                                                      "Daftar berhasil",
                                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.purpleAppbar),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                        context.read<OtherProvider>().changeTnC();
                                        usernameController.clear();
                                        emailController.clear();
                                        passwordController.clear();
                                        fullNameController.clear();
                                        phoneNumberController.clear();
                                        confirmPasswordController.clear();
                                      }
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sudah punya akun?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, createRoute(const LoginPage()));
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.purpleTextDarker,
                      ),
                      child: const Text("Masuk di sini"),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
