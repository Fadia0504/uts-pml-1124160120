import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya'), centerTitle: true),
      body: ListView(
        children: const [
          _Header('Keahlian & Hobi'),
          ListTile(
            leading: Icon(Icons.sports_basketball),
            title: Text('Bermain Basket'),
            subtitle: Text('Terakhir main SMA sih'),
          ),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Dengerin Musik'),
            subtitle: Text('Hobi di waktu luang'),
          ),
          ListTile(
            leading: Icon(Icons.sports_esports),
            title: Text('Bermain game ML'),
            subtitle: Text('Hobi di akhir pekan'),
          ),
          Divider(),
          _Header('Riwayat Pendidikan'),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('SDN Sepatan 4'),
            subtitle: Text('2012 - 2018'),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('SMPN 1 Sepatan'),
            subtitle: Text('2018 - 2021'),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('SMAN 11 Kab. Tangerang'),
            subtitle: Text('2021 - 2024'),
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('S1 Teknik Informatika'),
            subtitle: Text('2024 - sekarang'),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}