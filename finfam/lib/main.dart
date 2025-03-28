import 'package:flutter/material.dart';

void main() {
  runApp(FinFamApp());
}

class FinFamApp extends StatelessWidget {
  const FinFamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinFam - Finance Family',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    QuickTransactionPage(),
    ReportPage(),
    NotificationPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FinFam'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Laporan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}

class QuickTransactionPage extends StatelessWidget {
  const QuickTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Fungsi untuk mencatat transaksi cepat
        },
        child: Text('Catat Transaksi Cepat'),
      ),
    );
  }
}

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Laporan Keuangan Ringkas'),
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Notifikasi Tagihan'),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Pengaturan Akun'),
    );
  }
}
