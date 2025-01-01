import 'package:flutter/material.dart';


class AppbarMahasiswa extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppbarMahasiswa({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[200],
      title: const Text('Dashboard Mahasiswa'),
    );
  }
}



//appbar Profile
class AppbarProfile extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppbarProfile({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[200],
      title: const Text('Profile'),
    );
  }
}

//drawer mahasiswa
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
              Navigator.pop(context); // Menutup drawer
              Navigator.pushNamed(context, 'pages_profile'); // Navigasi ke halaman
            },
          ),

          ListTile(
            leading: const Icon(Icons.home_filled),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context); // Menutup drawer
              Navigator.pushNamed(context, 'dashboard_Mahasiswa'); // Navigasi ke halaman
            },
          ),

          ListTile(
            leading: const Icon(Icons.library_books_rounded),
            title: const Text('Pengajuan Bimbingan'),
            onTap: () {
              Navigator.pop(context); // Menutup drawer
              Navigator.pushNamed(context, 'pages_bimbingan'); // Navigasi ke halaman
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books_rounded),
            title: const Text('Pengajuan Sidang'),
            onTap: () {
              Navigator.pop(context); // Menutup drawer
              Navigator.pushNamed(context, 'pages_sidang'); // Navigasi ke halaman
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books_rounded),
            title: const Text('Feedback'),
            onTap: () {
              Navigator.pop(context); // Menutup drawer
              Navigator.pushNamed(context, 'pages_feedback'); // Navigasi ke halaman
            },
          ),

          // Ganti action button
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



//app bar add bimbingan mahasiswa
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



//appbar feedback mahasiswa
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
//appbar sidang mahasiswa
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




//drawer dosen 
class LectureDrawer extends StatelessWidget{
  const LectureDrawer({super.key});

  @override
  Widget build (BuildContext context){
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
            leading: const Icon(Icons.home_filled),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pushNamed(context,'dashboard_Dosen');
            },
          ),

          ListTile(
            leading: const Icon(Icons.library_books_rounded),
            title: const Text('Pengajuan Bimbingan'),
            onTap: () {
              Navigator.pushNamed(context, 'pages_bimbinganDosen');
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books_rounded),
            title: const Text('Pengajuan Sidang'),
            onTap: () {
              Navigator.pushNamed(context, 'pages_sidangDosen');
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books_rounded),
            title: const Text('Feedback'),
            onTap: () {
              Navigator.pushNamed(context, '');
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


class AppbarDosen extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppbarDosen({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[200],
        title: const Text('Dashboard Dosen'),
    );
  }
}

//appbarBimbingan dosen
class AppbarBimbinganDosen extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppbarBimbinganDosen({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[200],
        title: const Text('Dashboard Bimbingan'),
    );
  }
}

//appbarSidang dosen
class AppbarSidangDosen extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppbarSidangDosen({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[200],
        title: const Text('Dashboard Sidang'),
    );
  }
}