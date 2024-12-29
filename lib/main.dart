import 'package:flutter/material.dart';
import 'package:tugasbesar/src/themes/theme.dart';
import 'package:tugasbesar/src/view/login.dart';
import 'package:tugasbesar/src/view/register.dart';
// import 'package:tugasbesar/src/view/welcomescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/service/firebase_options.dart';
import 'package:tugasbesar/src/view/student_pages/dashboard_mahasiswa.dart';
import 'package:tugasbesar/src/view/lecturer_pages/dashboard_dosen.dart';
import 'package:tugasbesar/src/view/student_pages/pages_bimbingan.dart';
import 'package:tugasbesar/src/view/student_pages/pages_sidang.dart';
import 'package:tugasbesar/src/view/student_pages/pages_profile.dart';
import 'package:tugasbesar/src/view/student_pages/addbimbingan.dart';
import 'package:tugasbesar/src/view/student_pages/addsidang.dart';

void main() async {
  runApp(const MainApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      initialRoute: 'login_Screen',
      routes: {
        // 'welcome_Screen' :  (context) => const WelcomeScreen(),
        'login_Screen' : (context) => const LoginScreen(),
        'register_Screen' : (context) => const Registerpage(),
        'dashboard_Mahasiswa' : (context) => const DashboardMahasiswa(),
        'pages_bimbingan' : (context) => const PagesBimbingan(),
        'pages_sidang' : (context) => const PagesSidang(),
        'pages_profile' : (context) => const PagesProfile(),
        'dashboard_Dosen' : (context) => const DashboardDosen(),
        'pages_addBimbingan' : (context) => Addbimbingan( onAddbimbingan: (nomor, dosen, kegiatan, tanggal, status) {
          Navigator.pushNamed(context, 'pages_bimbingan');
        }, ),
        'pages_addSidang' : (context) => Addsidang(onAddsidang: (String nama, String nrp, String dosen, String judul, String status) { 
          Navigator.pushNamed(context, 'pages_sidang');
         },),
       
      },
    );
  }
}
