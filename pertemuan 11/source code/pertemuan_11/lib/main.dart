import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pertemuan 11 Mobile', // Diubah menjadi Pertemuan 11
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // === STATE VARIABLES ===
  int halamanAktif = 0;
  int jumlahMahasiswa = 32;

  // === CONTROLLERS ===
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // Default text diubah menjadi nama kamu
  final TextEditingController namaController = TextEditingController(text: 'Natasya Intan Sukma Jiwanti');

  // === LOGIC & METHODS ===
  String get judulAppBar {
    switch (halamanAktif) {
      case 0: return 'Aplikasi Utama';
      case 1: return 'Belajar Container';
      case 2: return 'Biodata Mahasiswa';
      case 3: return 'Poster dan Papan Skor';
      case 4: return 'Login';
      case 5: return 'Input Data';
      case 6: return 'Tentang Tugas';
      default: return 'Aplikasi Utama';
    }
  }

  void pindahHalaman(int index, String namaHalaman) {
    setState(() {
      halamanAktif = index;
    });
    Navigator.pop(context); // Menutup Drawer setelah berpindah
    tampilkanPesan('Berpindah ke halaman $namaHalaman');
  }

  void tambahMahasiswa() {
    setState(() {
      jumlahMahasiswa++;
    });
    tampilkanPesan('Jumlah praktikan berhasil ditambah');
  }

  void kurangiMahasiswa() {
    if (jumlahMahasiswa > 0) {
      setState(() {
        jumlahMahasiswa--;
      });
      tampilkanPesan('Jumlah praktikan berhasil dikurangi');
    } else {
      tampilkanPesan('Jumlah praktikan sudah 0');
    }
  }

  void tampilkanDataLogin() {
    tampilkanPesan('Username: ${usernameController.text}, Password: ${passwordController.text}');
  }

  void tampilkanPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(pesan),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    namaController.dispose();
    super.dispose();
  }

  // === MAIN BUILD UI ===
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: Text(
          judulAppBar,
          style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 2,
      ),
      drawer: _buildDrawer(),
      body: _buildHalamanBody(),
    );
  }

  // === WIDGET COMPONENTS ===

  // 1. Drawer Navigation
  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo, Colors.indigoAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.indigo, size: 35),
                ),
                SizedBox(height: 10),
                Text(
                  'Natasya Intan Sukma Jiwanti', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '2311102279', 
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => pindahHalaman(0, 'Home'),
          ),
          ListTile(
            leading: const Icon(Icons.crop_square),
            title: const Text('Belajar Container'),
            onTap: () => pindahHalaman(1, 'Belajar Container'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Biodata'),
            onTap: () => pindahHalaman(2, 'Biodata'),
          ),
          ListTile(
            leading: const Icon(Icons.scoreboard),
            title: const Text('Poster dan Papan Skor'),
            onTap: () => pindahHalaman(3, 'Poster dan Papan Skor'),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () => pindahHalaman(4, 'Login'),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Input Data'),
            onTap: () => pindahHalaman(5, 'Input Data'),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Tentang Tugas'),
            onTap: () => pindahHalaman(6, 'Tentang Tugas'),
          ),
        ],
      ),
    );
  }

  // 2. Switch Halaman Utama
  Widget _buildHalamanBody() {
    switch (halamanAktif) {
      case 0: return _halamanHome();
      case 1: return _halamanContainer();
      case 2: return _halamanBiodata();
      case 3: return _halamanPapanSkor();
      case 4: return _halamanLogin();
      case 5: return _halamanInputData();
      case 6: return _halamanTentang();
      default: return _halamanHome();
    }
  }

  // 3. Detail Halaman-Halaman
  Widget _halamanHome() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.explore_rounded,
            size: 100,
            color: Colors.indigo,
          ),
          const SizedBox(height: 24),
          const Text(
            'Selamat Datang di Aplikasi Navigasi',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          const Text(
            'Silakan gunakan tombol di bawah ini atau geser layar dari kiri untuk membuka menu navigasi utama.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                halamanAktif = 4;
              });
              tampilkanPesan('Berpindah ke halaman Login');
            },
            icon: const Icon(Icons.login),
            label: const Text('Ke Halaman Login', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _halamanContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Halaman Container',
            style: TextStyle(fontSize: 24, color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Container(
            width: 320,
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.indigo, Colors.indigoAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Text(
              'Belajar Container',
              style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _halamanBiodata() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.indigo,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Natasya Intan Sukma Jiwanti',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
                ),
                const SizedBox(height: 8),
                Text(
                  'NIM: 2311102279',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 8),
                Chip(
                  label: const Text('Status: Mahasiswa Aktif'),
                  backgroundColor: Colors.indigo.shade50,
                  labelStyle: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _halamanPapanSkor() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Jumlah Praktikan ABP yang Hadir:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      '$jumlahMahasiswa',
                      style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Colors.indigo),
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton.icon(
                    onPressed: tambahMahasiswa,
                    icon: const Icon(Icons.add),
                    label: const Text('Tambah Mahasiswa'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: kurangiMahasiswa,
                    icon: const Icon(Icons.remove),
                    label: const Text('Kurangi Mahasiswa'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.indigo,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      side: const BorderSide(color: Colors.indigo, width: 1.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _halamanLogin() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text('Login Form', style: TextStyle(fontSize: 26, color: Colors.indigo, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 28),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                labelText: 'Username',
                hintText: 'Silahkan masukan username',
                prefixIcon: Icon(Icons.person, color: Colors.indigo),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                labelText: 'Password',
                hintText: 'Silahkan masukan password',
                prefixIcon: Icon(Icons.lock, color: Colors.indigo),
              ),
            ),
            const SizedBox(height: 28),
            ElevatedButton(
              onPressed: tampilkanDataLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text('Tampilkan Data', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _halamanInputData() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Input Data Profil', style: TextStyle(fontSize: 24, color: Colors.indigo, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          TextField(
            controller: namaController,
            maxLength: 30,
            decoration: InputDecoration(
              labelText: 'Nama Lengkap',
              helperText: 'Masukan nama Anda',
              prefixIcon: const Icon(Icons.people, color: Colors.white),
              filled: true,
              fillColor: Colors.indigo.shade300,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(28), borderSide: BorderSide.none),
            ),
            style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              tampilkanPesan('Nama yang diinput: ${namaController.text}');
            },
            icon: const Icon(Icons.save),
            label: const Text('Simpan Data'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _halamanTentang() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Icon(Icons.mobile_friendly, size: 80, color: Colors.indigo)),
            const SizedBox(height: 20),
            const Text(
              'Tugas Navigasi dan Notifikasi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 12),
            const Text(
              'Aplikasi ini memiliki 7 halaman yang dapat diakses melalui Drawer Navigation. Notifikasi menggunakan SnackBar muncul saat berpindah halaman, login, input data, dan perubahan jumlah praktikan.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    // Nama dan NIM diubah
                    Text('Nama: Natasya Intan Sukma Jiwanti', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo)),
                    SizedBox(height: 8),
                    Text('NIM: 2311102279', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Divider(),
                    SizedBox(height: 8),
                    Text('Jumlah Halaman: 7'),
                    SizedBox(height: 8),
                    Text('Fitur: Drawer Navigation & SnackBar'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}