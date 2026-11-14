import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.onToggleTheme});

  final VoidCallback onToggleTheme;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile _profile = Profile.contoh;

  Future<void> _bukaEdit() async {
    final Profile? hasil = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(builder: (_) => EditProfilePage(profile: _profile)),
    );
    if (!mounted || hasil == null) return;
    setState(() => _profile = hasil);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profil berhasil diperbarui')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 56,
                backgroundImage: AssetImage('assets/images/foto.jpg'),
              ),
              const SizedBox(height: 16),
              Text(_profile.nama,
                  style: textTheme.headlineSmall, textAlign: TextAlign.center),
              const SizedBox(height: 4),
              Text('NIM: ${_profile.nim}', style: textTheme.bodyMedium),
              Text('${_profile.prodi} · ${_profile.kelas}',
                  style: textTheme.bodyMedium),
              const SizedBox(height: 12),
              Text(_profile.bio,
                  style: textTheme.bodyMedium, textAlign: TextAlign.center),
              const SizedBox(height: 24),
              Card(
                child: Column(
                  children: [
                    InfoTile(
                        icon: Icons.email,
                        label: 'Email',
                        value: _profile.email),
                    InfoTile(
                        icon: Icons.phone,
                        label: 'Nomor HP',
                        value: _profile.hp),
                    InfoTile(
                        icon: Icons.code,
                        label: 'GitHub',
                        value: _profile.github),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bukaEdit,
        tooltip: 'Edit profil',
        child: const Icon(Icons.edit),
      ),
    );
  }
}