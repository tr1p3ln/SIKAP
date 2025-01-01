import 'package:flutter/material.dart';

class AddPerusahaan extends StatefulWidget {
  final Function(String, String, String, String, String) onSubmit;
  final Map<String, String>? initialData;
  final String title;

  const AddPerusahaan({
    super.key,
    required this.onSubmit,
    this.initialData,
    required this.title,
  });

  @override
  _AddPerusahaanState createState() => _AddPerusahaanState();
}

class _AddPerusahaanState extends State<AddPerusahaan> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialData != null) {
      _nameController.text = widget.initialData!['name'] ?? '';
      _locationController.text = widget.initialData!['location'] ?? '';
      _roleController.text = widget.initialData!['role'] ?? '';
      _descriptionController.text = widget.initialData!['description'] ?? '';
      _contactController.text = widget.initialData!['contact'] ?? '';
    }
  }

  void _submit() {
    final name = _nameController.text;
    final location = _locationController.text;
    final role = _roleController.text;
    final description = _descriptionController.text;
    final contact = _contactController.text;

    widget.onSubmit(name, location, role, description, contact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(_nameController, 'Nama Perusahaan'),
            const SizedBox(height: 20),
            _buildTextField(_locationController, 'Lokasi'),
            const SizedBox(height: 20),
            _buildTextField(_roleController, 'Job Role'),
            const SizedBox(height: 20),
            _buildTextField(_descriptionController, 'Deskripsi'),
            const SizedBox(height: 20),
            _buildTextField(_contactController, 'Contact'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey), // Border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
              color: Colors.blue, width: 2.0), // Focused border color
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 15.0, horizontal: 10.0), // Padding
      ),
    );
  }
}
