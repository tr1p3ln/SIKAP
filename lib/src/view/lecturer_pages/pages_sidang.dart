import 'package:flutter/material.dart';
import 'package:tugasbesar/src/widgets/appbarDrawer.dart';

class PagesSidangDosen extends StatefulWidget {
  const PagesSidangDosen({super.key});

  @override
  State<PagesSidangDosen> createState() => _PagesSidangDosenState();
}

class _PagesSidangDosenState extends State<PagesSidangDosen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarSidangDosen(),
    );
  }
}