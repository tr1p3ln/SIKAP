import 'package:flutter/material.dart';
import 'package:tugasbesar/src/view/student_pages/addbimbingan.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const MyAppBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[200],
      title: const Text('Profile'),
    );
  }
}

// class AppBarBimbingan extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   final Size preferredSize;

//   const AppBarBimbingan({super.key})
//       : preferredSize = const Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.blueGrey[200],
//       title: const Text('Pengajuan Bimbingan'),
//       actions: [
//         IconButton(
//           onPressed: (){
//             Navigator.push(context, 
//             MaterialPageRoute(
//               builder: (context) => Addbimbingan(onAddbimbingan: addBimbingan)),
//               );
//           }, icon: Icon(Icons.add))
//       ],
//     );
//   }
// }


class AppBaraddbimbingan extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppBaraddbimbingan({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[200],
      title: const Text('Add Bimbingan'),
    );
  }
}




class AppBarFeedback extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppBarFeedback({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[200],
      title: const Text('Feedback'),
    );
  }
}

class AppBarSidang extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppBarSidang({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[200],
      title: const Text('Pengajuan Sidang'),
    );
  }
}



class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Logo ITENAS
          Container(
            height: 100,
            alignment: Alignment.center,
            child: Image.asset(
              'lib/src/assets/images/logoitenas.jpg',
              height: 80,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'KP ITENAS',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context,'pages_profile');
            },
          ),

          ListTile(
            leading: const Icon(Icons.home_filled),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pushNamed(context,'dashboard_Mahasiswa');
            },
          ),

          ListTile(
            leading: const Icon(Icons.library_books_rounded),
            title: const Text('Pengajuan Bimbingan'),
            onTap: () {
              Navigator.pushNamed(context, 'pages_bimbingan');
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books_rounded),
            title: const Text('Pengajuan Sidang'),
            onTap: () {
              Navigator.pushNamed(context, 'pages_sidang');
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books_rounded),
            title: const Text('Feedback'),
            onTap: () {
              Navigator.pushNamed(context, 'pages_sidang');
            },
          ),

          //ganti actionbutton
          const ListTile(
            leading: Icon(Icons.exit_to_app_sharp),
            title: Text('Logout'),
            // onTap: () {
            //   Navigator.pushNamed(context, 'register_Screen');
            // },
          ),
        ],
      ),
    );
  }
}
