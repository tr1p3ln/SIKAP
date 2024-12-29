import 'package:flutter/material.dart';

class DashboardMahasiswa extends StatefulWidget {
  const DashboardMahasiswa({super.key});

  @override
  State<DashboardMahasiswa> createState() => _DashboardMahasiswaState();
}

class _DashboardMahasiswaState extends State<DashboardMahasiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: const Text('Dashboard Mahasiswa'),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Logo ITENAS
            Container(
              height: 100,
              alignment: Alignment.center,
              child: Image.asset(
                'lib/src/assets/images/logoitenas.jpg',
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'KP ITENAS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, 'pages_profile');
              },
            ),

            ListTile(
              leading: const Icon(Icons.home_filled),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pushNamed(context,'dashboard_Mahasiswa');
              },
            ),

            ListTile(
              leading: const Icon(Icons.library_books_rounded),
              title: const Text('Pengajuan Bimbingan'),
              onTap: () {
                Navigator.pushNamed(context, 'pages_bimbingan');
              },
            ),
            ListTile(
              leading: const Icon(Icons.library_books_rounded),
              title: const Text('Pengajuan Sidang'),
              onTap: () {
                Navigator.pushNamed(context, 'pages_sidang');
              },
            ),
            
            ListTile(
              leading: const Icon(Icons.library_books_rounded),
              title: const Text('Feedback'),
              onTap: () {
                Navigator.pushNamed(context, 'pages_sidang');
              },
            ),

            const ListTile(
              leading: Icon(Icons.exit_to_app_sharp),
              title: Text('Logout'),
              // onTap: () {
              //   Navigator.pushNamed(context, 'register_Screen');
              // },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Card(
                color: Colors.white,
                elevation: 8,
                shadowColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    shrinkWrap: true, // Mengatasi konflik tinggi dinamis
                    itemCount: 5, // Jumlah item pada ListView
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(
                            10), // Ganti TSize.sm dengan nilai konkret
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const ListTile(
                          leading:
                              Icon(Icons.business), // Ikon untuk perusahaan
                          title: Text('Nama Perusahaan'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on,
                                      size: 16,
                                      color: Colors.grey), // Ikon lokasi
                                  SizedBox(width: 5),
                                  Text('Bandung'),
                                ],
                              ),
                              SizedBox(
                                  height: 5), // Jarak antar elemen subtitle
                              Text(
                                'Job: Software Developer', // Informasi pekerjaan
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              
                              SizedBox(
                                  height: 5),
                              Text(
                                'Contact : itenas@gmail.com', // Informasi pekerjaan
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Deskripsi: Mengembangkan aplikasi mobile berbasis Flutter.', // Deskripsi pekerjaan
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
