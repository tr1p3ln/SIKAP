import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FormInput extends StatelessWidget {
  final TextEditingController nomorController;
  final TextEditingController namaController;
  final TextEditingController dosenController;
  final TextEditingController kegiatanController;
  final TextEditingController tanggalController;
  final VoidCallback onSubmit;

  FormInput({
    super.key,
    required this.nomorController,
    required this.namaController,
    required this.dosenController,
    required this.kegiatanController,
    required this.tanggalController,
    required this.onSubmit,
    required String file,
  });

  final _formKey = GlobalKey<FormState>();
  final List<String> dosenList = ['Prabowo', ' Jokowi', 'Anies'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Input Nomor
          TextFormField(
            controller: nomorController,
            decoration: const InputDecoration(
              labelText: 'Nomor',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nomor tidak boleh kosong';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: namaController,
            decoration: const InputDecoration(
              labelText: 'Nama',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama tidak boleh kosong';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Input Kegiatan
          TextFormField(
            controller: kegiatanController,
            decoration: const InputDecoration(
              labelText: 'Kegiatan',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Kegiatan tidak boleh kosong';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // DatePicker untuk Tanggal
          TextFormField(
            controller: tanggalController,
            decoration: const InputDecoration(
              labelText: 'Tanggal',
              border: OutlineInputBorder(),
            ),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                tanggalController.text =
                    '${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}';
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Tanggal tidak boleh kosong';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Dropdown Dosen Pembimbing
          DropdownButtonFormField<String>(
            value: dosenController.text.isEmpty ? null : dosenController.text,
            decoration: const InputDecoration(
              labelText: 'Dosen Pembimbing',
              border: OutlineInputBorder(),
            ),
            items: dosenList
                .map((dosen) => DropdownMenuItem(
                      value: dosen,
                      child: Text(dosen),
                    ))
                .toList(),
            onChanged: (value) {
              dosenController.text = value ?? '';
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Dosen Pembimbing tidak boleh kosong';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();
                    if (result == null) return;
                    print(result.files.first.name);
                    print(result.files.first.size);
                    print(result.files.first.path);
                  },
                  child: Text('Pilih File')),
            ],
          ),

          const SizedBox(height: 16),

          // Submit Button
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                onSubmit();
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
