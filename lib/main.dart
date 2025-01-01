import 'package:flutter/material.dart';
import 'package:tugasbesar/src/themes/theme.dart';
import 'package:tugasbesar/src/view/login.dart';
import 'package:tugasbesar/src/view/register.dart';
import 'package:provider/provider.dart'; // Import provider
import 'package:firebase_core/firebase_core.dart';
import 'src/service/firebase_options.dart';


// Student page
import 'package:tugasbesar/src/view/student_pages/dashboard_mahasiswa.dart';
import 'package:tugasbesar/src/view/student_pages/pages_bimbingan.dart';
import 'package:tugasbesar/src/view/student_pages/pages_sidang.dart';
import 'package:tugasbesar/src/view/student_pages/pages_profile.dart';
import 'package:tugasbesar/src/view/student_pages/addbimbingan.dart';
import 'package:tugasbesar/src/view/student_pages/addsidang.dart';
import 'package:tugasbesar/src/view/student_pages/pages_feedback.dart';

// Lecturer page
import 'package:tugasbesar/src/view/lecturer_pages/dashboard_dosen.dart';
import 'package:tugasbesar/src/view/lecturer_pages/pages_bimbingan.dart';
import 'package:tugasbesar/src/view/lecturer_pages/pages_sidang.dart';

// Import provider and your ChangeNotifiers
import 'package:tugasbesar/src/models/BimbinganProvider.dart'; // Provider untuk Bimbingan
import 'package:tugasbesar/src/models/SidangProvider.dart'; //provider untuk Sidang


void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BimbinganProvider()), // Bimbingan Provider
        ChangeNotifierProvider(create: (context) => SidangProvider()), // Sidang Provider
        // You can add more providers here if needed
      ],
      child: const MainApp(),
    ),
  );
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
        'login_Screen': (context) => const LoginScreen(),
        'register_Screen': (context) => const Registerpage(),
        // Pages mahasiswa
        'dashboard_Mahasiswa': (context) => const DashboardMahasiswa(),
        'pages_bimbingan': (context) => const PagesBimbingan(),
        'pages_sidang': (context) => const PagesSidang(),
        'pages_profile': (context) => const PagesProfile(),
        'pages_feedback': (context) => const PagesFeedback(),
        'pages_addBimbingan': (context) => Addbimbingan(
              onAddbimbingan: (nomor, nama, dosen, kegiatan, tanggal, status,file) {
                Navigator.pushNamed(context, 'pages_bimbingan');
              },
            ),
        'pages_addSidang': (context) => Addsidang(
              onAddsidang: ( nama,  nrp,  dosen,  judul,  status) {
                Navigator.pushNamed(context, 'pages_sidang');
              },
            ),
        // Pages dosen
        'dashboard_Dosen': (context) => const DashboardDosen(),
        'pages_bimbinganDosen': (context) => const PagesBimbinganSidang(),
        'pages_sidangDosen': (context) => const PagesSidangDosen(),
      },
    );
  }
}