import 'package:flutter/material.dart';
import 'package:tugasbesar/src/widgets/appbarDrawer.dart';
import 'package:tugasbesar/src/view/student_pages/addbimbingan.dart';

class PagesBimbingan extends StatefulWidget {
  const PagesBimbingan({super.key});

  @override
  State<PagesBimbingan> createState() => _PagesBimbinganState();
}

class _PagesBimbinganState extends State<PagesBimbingan> {
  final List<Map<String, String>> bimbinganList = [];

  void addBimbingan(
      String nomor, String dosen, String kegiatan, String tanggal, String status) {
    setState(() {
      bimbinganList.add({
        'nomor_bimbingan': nomor,
        'dosen_bimbingan': dosen,
        'kegiatan_bimbingan': kegiatan,
        'tanggal': tanggal,
        'status_bimbingan': status,
      });
    });
  }

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
                  builder: (context) =>
                      Addbimbingan(onAddbimbingan: addBimbingan),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: bimbinganList.isEmpty
          ? const Center(
              child: Text(
                'Belum ada pengajuan bimbingan.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: bimbinganList.length,
              itemBuilder: (context, index) {
                final bimbingan = bimbinganList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nomor: ${bimbingan['nomor_bimbingan']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text('Dosen Pembimbing: ${bimbingan['dosen_bimbingan']}'),
                        const SizedBox(height: 8),
                        Text('Kegiatan: ${bimbingan['kegiatan_bimbingan']}'),
                        const SizedBox(height: 8),
                        Text('Tanggal: ${bimbingan['tanggal']}'),
                        const SizedBox(height: 8),
                        Text('Status: ${bimbingan['status_bimbingan']}',
                            style: const TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
