import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resquecare/View-Model/admin_pengaduan_provider.dart';
import 'package:resquecare/View-Model/auth_services.dart';
import 'package:resquecare/View-Model/others_provider.dart';
import 'package:resquecare/View-Model/panggilan_darurat_provider.dart';
import 'package:resquecare/View-Model/pengaduan_provider.dart';
import 'package:resquecare/Views/Admin/admin_home_page.dart';
import 'package:resquecare/Views/Auth/splash_screen.dart';
import 'package:resquecare/Views/home_page.dart';
import 'package:resquecare/Views/notification_page.dart';
import 'package:resquecare/Views/profile_page.dart';
import 'package:resquecare/colors.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDY2tZ6FWWRhcgoZMKSPsMDRu69cj41tws",
    appId: "1:527314231266:android:7fe92204c5f7300458a3bb",
    messagingSenderId: "527314231266",
    projectId: "rescuecare",
    storageBucket: "rescuecare.appspot.com",
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthServicesProvider()),
        ChangeNotifierProvider(create: (_) => OtherProvider()),
        ChangeNotifierProvider(create: (_) => PengaduanProvider()),
        ChangeNotifierProvider(create: (_) => AdminPengaduanProvider()),
        ChangeNotifierProvider(create: (_) => PanggilanDaruratProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //menghilangkan tulisan debugbanner
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.purpleAppbar,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ), //mengubah tema appbar untuk semua page
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme), //mengubah tema font family menjadi poppins
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class Navbar extends StatefulWidget {
  const Navbar({
    super.key,
  });

  @override
  State<Navbar> createState() => _Navbar();
}

class _Navbar extends State<Navbar> {
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
  final screen = [
    const NotificationPage(),
    const HomePage(),
    const ProfilePage(),
  ];
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: currentPage,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.purpleAppbar,
          selectedItemColor: const Color(0xff23A6F0),
          unselectedItemColor: const Color(0xff484C52),
          onTap: (value) {
            setState(() {
              if (value == 0) {
                context.read<AdminPengaduanProvider>().getDataPengaduanUser();
              }
              if (value == 2) {
                context.read<AuthServicesProvider>().getDataUserFromLogin();
              }
              currentPage = value;
            });
          },
          items: const [
            
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_rounded,
                color: Colors.white,
              ),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled,
                color: Colors.white,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white,),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: screen[currentPage],
    );
  }
}


class AdminNavbar extends StatefulWidget {
  const AdminNavbar({
    super.key,
  });

  @override
  State<AdminNavbar> createState() => _AdminNavbar();
}

class _AdminNavbar extends State<AdminNavbar> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final screen = [
      const AdminHomePage(),
      const ProfilePage(),
    ];
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: currentPage,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.purpleAppbar,
          selectedItemColor: const Color(0xff23A6F0),
          unselectedItemColor: const Color(0xff484C52),
          onTap: (value) {
            setState(() {
              
              if (value == 1) {
                context.read<AuthServicesProvider>().getDataUserFromLogin();
              }
              currentPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.white,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: screen[currentPage],
    );
  }
}
