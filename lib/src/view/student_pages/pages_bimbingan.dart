import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'package:tugasbesar/src/widgets/appbarDrawer.dart';
import 'package:tugasbesar/src/view/student_pages/addbimbingan.dart';
import 'package:tugasbesar/src/models/BimbinganProvider.dart'; // Provider untuk Bimbingan

class PagesBimbingan extends StatelessWidget {
  const PagesBimbingan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: const Text('Pengajuan Bimbingan'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addbimbingan(onAddbimbingan:
                      (nomor, nama, dosen, kegiatan, tanggal, status, file) {
                    // Panggil fungsi addBimbingan saat data ditambahkan
                    Provider.of<BimbinganProvider>(context, listen: false)
                        .addBimbingan(nomor, nama, dosen, kegiatan, tanggal,
                            status, file);
                    Navigator.pop(context);
                  }),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: Consumer<BimbinganProvider>(
        // Menggunakan Consumer untuk mendengarkan perubahan state
        builder: (context, bimbinganProvider, child) {
          final bimbinganList = bimbinganProvider.bimbinganList;

          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                  bimbinganList.isEmpty
                      ? const Center(
                          child: Text(
                            'Belum ada pengajuan bimbingan.',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: bimbinganList.length,
                          itemBuilder: (context, index) {
                            final bimbingan = bimbinganList[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                leading: const Icon(Icons.book),
                                title: Text(
                                    'Nomor: ${bimbingan['nomor_bimbingan']}'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        'Nama: ${bimbingan['nama_bimbingan']}'),
                                    const SizedBox(height: 8),
                                    Text(
                                        'Dosen Pembimbing: ${bimbingan['dosen_bimbingan']}'),
                                    const SizedBox(height: 8),
                                    Text(
                                        'Kegiatan: ${bimbingan['kegiatan_bimbingan']}'),
                                    const SizedBox(height: 8),
                                    Text('Tanggal: ${bimbingan['tanggal']}'),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Status: ${bimbingan['status_bimbingan']}',
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    bimbinganProvider.removeBimbingan(
                                        index); // Menghapus bimbingan
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
