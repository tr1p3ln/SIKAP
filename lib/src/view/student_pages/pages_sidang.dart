import 'package:flutter/material.dart';
import 'package:tugasbesar/src/widgets/appbarDrawer.dart';
import 'package:tugasbesar/src/view/student_pages/addsidang.dart';

class PagesSidang extends StatefulWidget {
  const PagesSidang({super.key});

  @override
  State<PagesSidang> createState() => _PagesSidangState();
}

class _PagesSidangState extends State<PagesSidang> {
  final List<Map<String, String>> sidangList = [];

  void addBimbingan(
      String nama, String nrp, String dosen, String judul, String status) {
    setState(() {
      sidangList.add({
        'nama': nama,
        'nrp': nrp,
        'dosen_bimbingan': dosen,
        'judul': judul,
        'status_bimbingan': status,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: const Text('Pengajuan Sidang'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addsidang(onAddsidang: addBimbingan),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: sidangList.isEmpty
          ? const Center(
              child: Text(
                'Belum ada pengajuan sidang.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: sidangList.length,
            itemBuilder: (context, index) {
                final sidang = sidangList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama: ${sidang['nama']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text('Dosen Pembimbing: ${sidang['dosen_bimbingan']}'),
                        const SizedBox(height: 8),
                        Text('Nrp: ${sidang['nrp']}'),
                        const SizedBox(height: 8),
                        Text('judul: ${sidang['judul']}'),
                        const SizedBox(height: 8),
                        Text('Status: ${sidang['status_bimbingan']}',
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
