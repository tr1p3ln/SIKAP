import 'package:flutter/material.dart';
import 'package:tugasbesar/src/widgets/appbarDrawer.dart';
import 'package:tugasbesar/src/themes/custome_themes/text_theme.dart';
import 'package:tugasbesar/src/widgets/profile.dart';

class PagesProfile extends StatefulWidget {
  const PagesProfile({super.key});

  @override
  State<PagesProfile> createState() => _PagesProfileState();
}

class _PagesProfileState extends State<PagesProfile> {
  final List<Map<String, String>> datamahasiswa = [
    {
      'gmail': 'user@example.com',
      'password': 'user123',
      'nama': 'user',
      'nrp': '16202212',
      'Jurusan': 'Sistem Informasi',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: const Text('Profile'),
      ),
      drawer: MyDrawer(), // Use the custom Drawer widget
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Data Mahasiswa',
              style: TTextTheme.lightTextTheme.headlineSmall,
            ),
            const Divider(height: 32),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.all(16),
              elevation: 5, // Memberikan bayangan untuk efek elevasi
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20), // Membuat sudut melengkung
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Warna latar belakang
                  borderRadius: BorderRadius.circular(20), // Sudut melengkung
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                      16.0), // Memberikan jarak di dalam card
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Tprofilemenu(
                        title: 'Nama',
                        value: datamahasiswa[0]['nama'] ?? '',
                      ),
                      const Divider(height: 16, thickness: 1), // Garis pemisah
                      Tprofilemenu(
                        title: 'NRP',
                        value: datamahasiswa[0]['nrp'] ?? '',
                      ),
                      const Divider(height: 16, thickness: 1),
                      Tprofilemenu(
                        title: 'Jurusan',
                        value: datamahasiswa[0]['Jurusan'] ?? '',
                      ),
                      const Divider(height: 16, thickness: 1),
                      Tprofilemenu(
                        title: 'Gmail',
                        value: datamahasiswa[0]['gmail'] ?? '',
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
