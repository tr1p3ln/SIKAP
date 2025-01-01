import 'package:flutter/material.dart';

class Forminputaddsidang extends StatelessWidget {
  final TextEditingController namaController;
  final TextEditingController nrpController;
  final TextEditingController dosenController;
  final TextEditingController judulkpController;
  final VoidCallback onSubmit;


  Forminputaddsidang({
    super.key,
    required this.namaController,
    required this.nrpController,
    required this.dosenController,
    required this.judulkpController,
    required this.onSubmit,
  });

  final _formKey = GlobalKey<FormState>();
  final List<String> dosenList = ['Prabowo', ' Jokowi', 'Anies'];


  @override
  Widget build(BuildContext context) {
    return  Form(
    key: _formKey,
    child: Column(

      children: [
        TextFormField(
            controller: namaController,
            decoration: const InputDecoration(
              labelText: 'nama',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'nama tidak boleh kosong';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: nrpController,
            decoration: const InputDecoration(
              labelText: 'nrp',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'nrp tidak boleh kosong';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: judulkpController,
            decoration: const InputDecoration(
              labelText: 'judul',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'judul tidak boleh kosong';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

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