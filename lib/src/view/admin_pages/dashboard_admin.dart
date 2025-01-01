import 'package:flutter/material.dart';
import 'add_perusahaan.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final List<Map<String, String>> _companies = [
    {
      'id': '1',
      'name': 'Nama Perusahaan A',
      'location': 'Bandung',
      'role': 'Software Developer',
      'description': 'Mengembangkan aplikasi mobile berbasis Flutter.',
      'contact': 'itena@gmail.com',
    },
    {
      'id': '2',
      'name': 'Nama Perusahaan B',
      'location': 'Jakarta',
      'role': 'Data Scientist',
      'description': 'Menganalisis data besar untuk mendapatkan wawasan.',
      'contact': 'data.scientist@example.com',
    },
  ];

  String _searchQuery = '';

  void _addOrEditCompany({
    String? id,
    String? name,
    String? location,
    String? role,
    String? description,
    String? contact,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddPerusahaan(
          onSubmit: (name, location, role, description, contact) {
            setState(() {
              if (id == null) {
                // Adding new company
                _companies.add({
                  'id': (_companies.length + 1).toString(),
                  'name': name,
                  'location': location,
                  'role': role,
                  'description': description,
                  'contact': contact,
                });
              } else {
                // Editing existing company
                int index =
                    _companies.indexWhere((company) => company['id'] == id);
                if (index != -1) {
                  _companies[index] = {
                    'id': id,
                    'name': name,
                    'location': location,
                    'role': role,
                    'description': description,
                    'contact': contact,
                  };
                }
              }
            });
            Navigator.of(context).pop();
          },
          initialData: id != null
              ? _companies.firstWhere((company) => company['id'] == id)
              : null,
          title: id == null ? 'Add Perusahaan' : 'Edit Perusahaan',
        ),
      ),
    );
  }

  void _deleteCompany(String id) {
    setState(() {
      _companies.removeWhere((company) => company['id'] == id);
    });
  }

  void _logout() {
    Navigator.of(context).pushReplacementNamed('login_Screen');
  }

  @override
  Widget build(BuildContext context) {
    final filteredCompanies = _companies.where((company) {
      return company['name']!
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          company['role']!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          company['location']!
              .toLowerCase()
              .contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Admin'),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _addOrEditCompany();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logoitenasSplashscreen.png',
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Itenas Admin',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Cari',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredCompanies.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Card(
                      color: Colors.white,
                      elevation: 8,
                      shadowColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.business),
                              title: Text(filteredCompanies[index]['name']!),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on,
                                          size: 16, color: Colors.grey),
                                      const SizedBox(width: 5),
                                      Text(filteredCompanies[index]
                                          ['location']!),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Job: ${filteredCompanies[index]['role']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Contact: ${filteredCompanies[index]['contact']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Deskripsi: ${filteredCompanies[index]['description']}',
                                    style:
                                        const TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      _addOrEditCompany(
                                        id: filteredCompanies[index]['id'],
                                        name: filteredCompanies[index]['name'],
                                        location: filteredCompanies[index]
                                            ['location'],
                                        role: filteredCompanies[index]['role'],
                                        description: filteredCompanies[index]
                                            ['description'],
                                        contact: filteredCompanies[index]
                                            ['contact'],
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      // Show a confirmation dialog before deleting
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title:
                                                const Text('Konfirmasi Hapus'),
                                            content: const Text(
                                                'Apakah Anda yakin ingin menghapus perusahaan ini?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(); // Close the dialog
                                                },
                                                child: const Text('Batal'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  _deleteCompany(
                                                      filteredCompanies[index]
                                                          ['id']!);
                                                  Navigator.of(context)
                                                      .pop(); // Close the dialog
                                                },
                                                child: const Text('Hapus'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
