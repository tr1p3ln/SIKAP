// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:tugasbesar/src/widgets/customerbutton.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});
//   static String id = 'welcome_screen';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: WillPopScope(
//         onWillPop: () async {
//           SystemNavigator.pop();
//           return false;
//         },
//         child: const Center(
//           child: ScreenTitle(
//             title: 'Welcome',
//           ),
//         ),
//       ),
//     );
//   }
// }