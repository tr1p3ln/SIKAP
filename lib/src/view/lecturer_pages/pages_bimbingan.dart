import 'package:flutter/material.dart';
import 'package:tugasbesar/src/widgets/appbarDrawer.dart';

class PagesBimbinganSidang extends StatefulWidget {
  const PagesBimbinganSidang({super.key});

  @override
  State<PagesBimbinganSidang> createState() => _PagesBimbinganSidangState();
}

class _PagesBimbinganSidangState extends State<PagesBimbinganSidang> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: AppbarBimbinganDosen(),
      // drawer: ,
    );
  }
}