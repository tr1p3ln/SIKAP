import 'package:flutter/material.dart';
import 'package:tugasbesar/src/widgets/appbarDrawer.dart';

class PagesFeedback extends StatefulWidget {
  const PagesFeedback({super.key});

  @override
  State<PagesFeedback> createState() => _PagesFeedbackState();
}

class _PagesFeedbackState extends State<PagesFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFeedback(),
      drawer: MyDrawer(),
      body: const Center(
        child: Text('This is the Page Feedback'),
      ),
    );
  }
}