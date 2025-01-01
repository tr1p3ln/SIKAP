import 'package:flutter/material.dart';

class SidangProvider with ChangeNotifier {
  final List<Map<String, String>> _sidangList = [];

  List<Map<String, String>> get sidangList => _sidangList;

  void addSidang(String nama, String nrp, String dosen, String judul, String status) {
    _sidangList.add({
      'nama': nama,
      'nrp': nrp,
      'dosen_bimbingan': dosen,
      'judul': judul,
      'status_bimbingan': status,
    });
    notifyListeners();
  }
}
