import 'package:flutter/material.dart';
import 'package:tugasbesar/src/widgets/appbarDrawer.dart';
import 'package:tugasbesar/src/widgets/forminputAddbimbingan.dart';

class Addbimbingan extends StatefulWidget {
  final Function(String nomor, String dosen, String kegiatan, String tanggal, String status) onAddbimbingan;

  const Addbimbingan({super.key, required this.onAddbimbingan});

  @override
  State<Addbimbingan> createState() => _AddbimbinganState();
}

class _AddbimbinganState extends State<Addbimbingan> {
  final TextEditingController nomorController = TextEditingController();
  final TextEditingController dosenController = TextEditingController();
  final TextEditingController kegiatanController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();

  void _submitForm() {
    final nomor = nomorController.text.trim();
    final dosen = dosenController.text.trim();
    final kegiatan = kegiatanController.text.trim();
    final tanggal = tanggalController.text.trim();
    const status = 'Process'; // Status default

    if (nomor.isNotEmpty && dosen.isNotEmpty && kegiatan.isNotEmpty && tanggal.isNotEmpty) {
      widget.onAddbimbingan(nomor, dosen, kegiatan, tanggal, status);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data berhasil ditambahkan')),
      );
      _clearForm(); // Bersihkan form setelah submit
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua field harus diisi')),
      );
    }
  }

  void _clearForm() {
    nomorController.clear();
    dosenController.clear();
    kegiatanController.clear();
    tanggalController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBaraddbimbingan(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormInput(
          nomorController: nomorController,
          dosenController: dosenController,
          kegiatanController: kegiatanController,
          tanggalController: tanggalController,
          onSubmit: _submitForm,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Bersihkan controller untuk mencegah kebocoran memori
    nomorController.dispose();
    dosenController.dispose();
    kegiatanController.dispose();
    tanggalController.dispose();
    super.dispose();
  }
}
