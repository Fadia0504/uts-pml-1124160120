import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key, required this.profile});

  final Profile profile;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nama;
  late final TextEditingController _nim;
  late final TextEditingController _prodi;
  late final TextEditingController _kelas;
  late final TextEditingController _bio;
  late final TextEditingController _email;
  late final TextEditingController _hp;
  late final TextEditingController _github;

  @override
  void initState() {
    super.initState();
    final p = widget.profile;
    _nama = TextEditingController(text: p.nama);
    _nim = TextEditingController(text: p.nim);
    _prodi = TextEditingController(text: p.prodi);
    _kelas = TextEditingController(text: p.kelas);
    _bio = TextEditingController(text: p.bio);
    _email = TextEditingController(text: p.email);
    _hp = TextEditingController(text: p.hp);
    _github = TextEditingController(text: p.github);
  }

  @override
  void dispose() {
    for (final c in [_nama, _nim, _prodi, _kelas, _bio, _email, _hp, _github]) {
      c.dispose();
    }
    super.dispose();
  }

  void _simpan() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final hasil = widget.profile.copyWith(
      nama: _nama.text.trim(),
      nim: _nim.text.trim(),
      prodi: _prodi.text.trim(),
      kelas: _kelas.text.trim(),
      bio: _bio.text.trim(),
      email: _email.text.trim(),
      hp: _hp.text.trim(),
      github: _github.text.trim(),
    );
    Navigator.pop(context, hasil); // kirim data baru ke halaman profil
  }

  Widget _field(
    TextEditingController c,
    String label, {
    TextInputType? type,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: c,
        keyboardType: type,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil'), centerTitle: true),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _field(_nama, 'Nama lengkap', validator: (v) {
                if ((v ?? '').trim().isEmpty) return 'Nama wajib diisi';
                return null;
              }),
              _field(_nim, 'NIM'),
              _field(_prodi, 'Program studi'),
              _field(_kelas, 'Kelas'),
              _field(_bio, 'Bio singkat', maxLines: 3),
              _field(_email, 'Email', type: TextInputType.emailAddress,
                  validator: (v) {
                final value = (v ?? '').trim();
                if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
                  return 'Email tidak valid';
                }
                return null;
              }),
              _field(_hp, 'Nomor HP', type: TextInputType.phone,
                  validator: (v) {
                if (!RegExp(r'^\d{10,13}$').hasMatch((v ?? '').trim())) {
                  return 'Nomor HP harus 10-13 digit angka';
                }
                return null;
              }),
              _field(_github, 'Akun GitHub'),
              FilledButton.icon(
                onPressed: _simpan,
                icon: const Icon(Icons.save),
                label: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}