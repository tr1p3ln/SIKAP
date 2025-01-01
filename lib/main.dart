import 'package:flutter/material.dart';
import 'package:tugasbesar/src/themes/theme.dart';
import 'package:tugasbesar/src/view/login.dart';
import 'package:tugasbesar/src/view/register.dart';
import 'package:provider/provider.dart'; // Import provider
import 'package:firebase_core/firebase_core.dart';
import 'src/service/firebase_options.dart';

// Student pages
import 'package:tugasbesar/src/view/student_pages/dashboard_mahasiswa.dart';
import 'package:tugasbesar/src/view/student_pages/pages_bimbingan.dart';
import 'package:tugasbesar/src/view/student_pages/pages_sidang.dart';
import 'package:tugasbesar/src/view/student_pages/pages_profile.dart';
import 'package:tugasbesar/src/view/student_pages/addbimbingan.dart';
import 'package:tugasbesar/src/view/student_pages/addsidang.dart';
import 'package:tugasbesar/src/view/student_pages/pages_feedback.dart';

// Lecturer pages
import 'package:tugasbesar/src/view/lecturer_pages/dashboard_dosen.dart';
import 'package:tugasbesar/src/view/lecturer_pages/pages_bimbingan.dart';
import 'package:tugasbesar/src/view/lecturer_pages/pages_sidang.dart';

// Import providers
import 'package:tugasbesar/src/models/BimbinganProvider.dart'; // Provider for Bimbingan
import 'package:tugasbesar/src/models/SidangProvider.dart'; // Provider for Sidang

//Admin Pages
import 'package:tugasbesar/src/view/admin_pages/dashboard_admin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => BimbinganProvider()), // Bimbingan Provider
        ChangeNotifierProvider(
            create: (context) => SidangProvider()), // Sidang Provider
        // You can add more providers here if needed
      ],
      child: const MainApp(),
    ),
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
        // Student pages
        'dashboard_Mahasiswa': (context) => const DashboardMahasiswa(),
        'pages_bimbingan': (context) => const PagesBimbingan(),
        'pages_sidang': (context) => const PagesSidang(),
        'pages_profile': (context) => const PagesProfile(),
        'pages_feedback': (context) => const PagesFeedback(),
        'pages_addBimbingan': (context) => Addbimbingan(
              onAddbimbingan:
                  (nomor, nama, dosen, kegiatan, tanggal, status, file) {
                Navigator.pushNamed(context, 'pages_bimbingan');
              },
            ),
        'pages_addSidang': (context) => Addsidang(
              onAddsidang: (nama, nrp, dosen, judul, status) {
                Navigator.pushNamed(context, 'pages_sidang');
              },
            ),
        // Lecturer pages
        'dashboard_Dosen': (context) => const DashboardDosen(),
        'pages_bimbinganDosen': (context) => const PagesBimbinganSidang(),
        'pages_sidangDosen': (context) => const PagesSidangDosen(),
        // Admin Dashboard route
        'dashboard_Admin': (context) => const AdminDashboard(),
      },
    );
  }
}
