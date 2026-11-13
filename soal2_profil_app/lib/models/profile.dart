class Profile {
  const Profile({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.kelas,
    required this.bio,
    required this.email,
    required this.hp,
    required this.github,
  });

  final String nama;
  final String nim;
  final String prodi;
  final String kelas;
  final String bio;
  final String email;
  final String hp;
  final String github;

  static const Profile contoh = Profile(
    nama: 'Fadia Nurcholifah',
    nim: '1124160120',
    prodi: 'Teknik Informatika',
    kelas: 'TI 24 P SE 3',
    bio: 'Mahasiswa Semester 5',
    email: 'fadia@email.com',
    hp: '081234567890',
    github: 'github.com/Fadia0504',
  );

  Profile copyWith({
    String? nama,
    String? nim,
    String? prodi,
    String? kelas,
    String? bio,
    String? email,
    String? hp,
    String? github,
  }) {
    return Profile(
      nama: nama ?? this.nama,
      nim: nim ?? this.nim,
      prodi: prodi ?? this.prodi,
      kelas: kelas ?? this.kelas,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      hp: hp ?? this.hp,
      github: github ?? this.github,
    );
  }
}