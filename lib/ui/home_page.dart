import 'package:flutter/material.dart';
import 'package:myapp/ui/logout.dart';
import 'package:myapp/ui/data_penjualan.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAIHOMEE'),
        backgroundColor: Colors.blue, // Set warna AppBar
      ),
      backgroundColor: Colors.white, // Set warna latar belakang di sini
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMenuButton(
                icon: Icons.dashboard,
                label: 'Dashboard',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DataPenjualan()),
                  );
                },
              ),
              HomeMenuButton(
                icon: Icons.add,
                label: 'Tambah Data',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DataPenjualan()), // Ganti dengan halaman tambah data
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMenuButton(
                icon: Icons.update,
                label: 'Update Data',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DataPenjualan()), // Ganti dengan halaman update data
                  );
                },
              ),
              HomeMenuButton(
                icon: Icons.logout,
                label: 'Logout',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            'NPM: 714220022\nNama: MUHAMMAD RIFKY',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black), // Set warna teks
          ),
        ],
      ),
    );
  }
}

class HomeMenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const HomeMenuButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50), // Menambahkan ikon
          SizedBox(height: 8), // Jarak antara ikon dan teks
          Text(label, style: TextStyle(fontSize: 16)), // Teks tombol
        ],
      ),
    );
  }
}
