import 'package:flutter/material.dart';
import 'package:resquecare/Views/Auth/login_page.dart';
import 'package:resquecare/Views/Auth/register_page.dart';
import 'package:resquecare/Widgets/transition.dart';
import 'package:resquecare/colors.dart';

import '../../Widgets/button_purple.dart';
import '../../Widgets/button_white.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity, 
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: -200,
              right: -150,
              child: ClipOval(
                child: Container(
                  width: 406,
                  height: 313,
                  color: AppColors.purpleAppbar,
                ),
              ),
            ),
            Positioned(
              top: -300,
              left: -360,
              child: ClipOval(
                child: Container(
                  width: 771,
                  height: 802,
                  color: const Color(0xFF392467),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Image.asset("assets/images/welcome_bg.png"),
            ),
            Positioned(
              top: 80,
              left: 30,
              child: SizedBox(
                width: 260,
                child: RichText(
                  overflow: TextOverflow.clip,
                  text: const TextSpan(
                      text: "Selamat Datang di",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: " RescueCare",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: AppColors.purpleTextDarker,
                          ),
                        )
                      ]),
                ),
              ),
            ),
            const Positioned(
              top: 230,
              left: 30,
              child: SizedBox(
                width: 211,
                child: Text(
                  "Bersama-sama, kita dapat menciptakan lingkungan yang lebih inklusif dan berempati",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: AppColors.purpleText),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: ButtonPurple(
                buttonText: "Masuk",
                onPressed: () {
                  Navigator.push(context, createRoute(const LoginPage()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 420),
              child: ButtonWhite(
                buttonText: "Daftar",
                onPressed: () {
                  Navigator.push(context, createRoute(const RegisterPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
