import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugasbesar/src/widgets/appbarDrawer.dart';
import 'package:tugasbesar/src/view/student_pages/addsidang.dart';
import 'package:tugasbesar/src/models/SidangProvider.dart';

class PagesSidang extends StatelessWidget {
  const PagesSidang({super.key});

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
                  builder: (context) => Addsidang(
                    onAddsidang: (nama, nrp, dosen, judul, status) {
                      // Menambahkan data sidang ke model
                      Provider.of<SidangProvider>(context, listen: false)
                          .addSidang(nama, nrp, dosen, judul, status);
                    },
                  ),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: Consumer<SidangProvider>(
        builder: (context, sidangModel, child) {
          final sidangList = sidangModel.sidangList;
          return sidangList.isEmpty
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
                      child: ListTile(
                        leading: const Icon(Icons.book),
                        title: Text('Nama: ${sidang['nama']}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 8),
                            Text(
                                'Dosen Pembimbing: ${sidang['dosen_bimbingan']}'),
                            const SizedBox(height: 8),
                            Text('Nrp: ${sidang['nrp']}'),
                            const SizedBox(height: 8),
                            Text('Judul: ${sidang['judul']}'),
                            const SizedBox(height: 8),
                            Text(
                              'Status: ${sidang['status_bimbingan']}',
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
