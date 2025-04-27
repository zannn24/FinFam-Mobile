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
        unselectedItemColor: Colors.grey,
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

class QuickTransactionPage extends StatefulWidget {
  const QuickTransactionPage({super.key});

  @override
  _QuickTransactionPageState createState() => _QuickTransactionPageState();
}

class _QuickTransactionPageState extends State<QuickTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  String _category = '';
  double _amount = 0.0;

  void _saveTransaction() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Transaksi $_category sebesar Rp$_amount berhasil dicatat!')),
      );
      // Reset form
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Kategori',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Kategori tidak boleh kosong';
                }
                return null;
              },
              onSaved: (value) {
                _category = value!;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Jumlah (Rp)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Jumlah tidak boleh kosong';
                }
                if (double.tryParse(value) == null) {
                  return 'Masukkan angka yang valid';
                }
                return null;
              },
              onSaved: (value) {
                _amount = double.parse(value!);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveTransaction,
              child: Text('Simpan Transaksi'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bar_chart, size: 80, color: Colors.teal),
          SizedBox(height: 20),
          Text(
            'Ringkasan Laporan Bulanan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Total Pemasukan: Rp5.000.000'),
          Text('Total Pengeluaran: Rp3.000.000'),
          Text('Sisa Anggaran: Rp2.000.000'),
        ],
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.notifications_active),
          title: Text('Bayar tagihan listrik - 28 April'),
        ),
        ListTile(
          leading: Icon(Icons.notifications_active),
          title: Text('Bayar tagihan internet - 30 April'),
        ),
        ListTile(
          leading: Icon(Icons.notifications_active),
          title: Text('Cicilan mobil - 1 Mei'),
        ),
      ],
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profil Keluarga'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text('Keamanan'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Logout'),
          onTap: () {
            // Logout logic
          },
        ),
      ],
    );
  }
}
