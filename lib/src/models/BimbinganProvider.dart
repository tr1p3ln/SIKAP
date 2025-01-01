import 'package:flutter/material.dart';

class BimbinganProvider with ChangeNotifier {
  final List<Map<String, String>> _bimbinganList = [];

  List<Map<String, String>> get bimbinganList => _bimbinganList;

  void addBimbingan(String nomor,String nama, String dosen, String kegiatan, String tanggal, String status, String? file) {
  _bimbinganList.add({
    'nomor_bimbingan': nomor,
    'nama_bimbingan': nama,
    'dosen_bimbingan': dosen,
    'kegiatan_bimbingan': kegiatan,
    'tanggal': tanggal,
    'status_bimbingan': status,
    'file_bimbingan' : file?? 'tidak ada file',
    
    
  });
  notifyListeners(); // Memberitahukan bahwa ada perubahan
}


  void removeBimbingan(int index) {
    _bimbinganList.removeAt(index);
    notifyListeners(); // Memberitahukan bahwa ada perubahan
  }
}
