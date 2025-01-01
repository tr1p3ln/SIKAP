import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugasbesar/src/models/SidangProvider.dart';
import 'package:tugasbesar/src/widgets/forminputAddsidang.dart';


class Addsidang extends StatelessWidget {
  final Function(
          String nama, String nrp, String dosen, String judul, String status)
      onAddsidang;

  const Addsidang({super.key, required this.onAddsidang});

  @override
  Widget build(BuildContext context) {
    final TextEditingController namaController = TextEditingController();
    final TextEditingController nrpController = TextEditingController();
    final TextEditingController dosenController = TextEditingController();
    final TextEditingController judulController = TextEditingController();

    void _submitForm() {
      final nama = namaController.text.trim();
      final nrp = nrpController.text.trim();
      final dosen = dosenController.text.trim();
      final judul = judulController.text.trim();
      const status = 'Process'; // Status default

      if (nama.isNotEmpty && nrp.isNotEmpty && judul.isNotEmpty) {
        // Gunakan provider untuk menambah sidang
        Provider.of<SidangProvider>(context, listen: false).addSidang(
          nama,
          nrp,
          dosen,
          judul,
          status,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data berhasil ditambahkan')),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Semua field harus diisi')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: const Text('Add Bimbingan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Forminputaddsidang(
          namaController: namaController,
          nrpController: nrpController,
          dosenController: dosenController,
          judulkpController: judulController,
          onSubmit: _submitForm,
        ),
      ),
    );
  }
}
