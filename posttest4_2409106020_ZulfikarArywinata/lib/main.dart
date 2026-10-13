import 'package:flutter/material.dart';
import 'home_page.dart';
import 'cart_page.dart';

void main() {
  // Menjalankan aplikasi Flutter
  runApp(const MyApp());
}

// Widget utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp digunakan sebagai dasar aplikasi
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Nama aplikasi
      title: 'HotWheels GWH',

      // Tema aplikasi
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
        useMaterial3: true,
      ),

      // Halaman pertama yang ditampilkan
      home: const MainPage(),
    );
  }
}

// Model untuk menyimpan data produk
class Product {
  String name;
  String price;
  String image;
  int stock;
  int jumlah;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.stock,
    this.jumlah = 0,
  });
}

// StatefulWidget digunakan karena data produk,
// stok, dan jumlah keranjang dapat berubah.
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

// State utama aplikasi
class _MainPageState extends State<MainPage> {

  // Menentukan halaman NavigationBar yang sedang aktif
  int halamanAktif = 0;

  // Daftar produk Hot Wheels
  final List<Product> produk = [
    Product(
      name: 'Bone Shaker',
      price: 'Rp 25.000',
      image: 'assets/Hotwheels1.jpg',
      stock: 10,
    ),
    Product(
      name: 'Rodger Dodger',
      price: 'Rp 30.000',
      image: 'assets/Hotwheels2.jpg',
      stock: 8,
    ),
    Product(
      name: 'Dodge Charger',
      price: 'Rp 35.000',
      image: 'assets/Hotwheels3.jpg',
      stock: 7,
    ),
    Product(
      name: 'Twin Mill',
      price: 'Rp 40.000',
      image: 'assets/Hotwheels4.jpg',
      stock: 6,
    ),
    Product(
      name: 'Deora II',
      price: 'Rp 45.000',
      image: 'assets/Hotwheels5.jpg',
      stock: 5,
    ),
    Product(
      name: 'BMW M3 GTR',
      price: 'Rp 50.000',
      image: 'assets/Hotwheels6.jpg',
      stock: 4,
    ),
  ];

  // Menambahkan produk ke keranjang
  void tambahKeranjang(Product product) {

    // Memastikan stok masih tersedia
    if (product.stock > 0) {
      setState(() {

        // Mengurangi stok produk
        product.stock--;

        // Menambah jumlah produk di keranjang
        product.jumlah++;
      });
    }
  }

  // Menambah jumlah produk dari halaman keranjang
  void tambahJumlah(Product product) {

    // Memastikan stok masih tersedia
    if (product.stock > 0) {
      setState(() {

        // Mengurangi stok
        product.stock--;

        // Menambah jumlah
        product.jumlah++;
      });
    }
  }

  // Mengurangi jumlah produk dari keranjang
  void kurangiJumlah(Product product) {

    // Memastikan produk masih ada di keranjang
    if (product.jumlah > 0) {
      setState(() {

        // Mengembalikan stok
        product.stock++;

        // Mengurangi jumlah produk
        product.jumlah--;
      });
    }
  }

  // Membuka halaman keranjang menggunakan Navigator.push
  void bukaKeranjang() {
    Navigator.push(
      context,

      // Navigator.push digunakan untuk membuka halaman baru
      MaterialPageRoute(
        builder: (context) => CartPage(
          produk: produk,
          onTambah: tambahJumlah,
          onKurang: kurangiJumlah,

          // Menampilkan tombol kembali karena halaman
          // dibuka menggunakan Navigator.push
          bisaKembali: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // Menentukan halaman yang ditampilkan
    Widget halaman;

    if (halamanAktif == 0) {

      // Halaman Home
      halaman = HomePage(
        produk: produk,
        onTambah: tambahKeranjang,
        onBukaKeranjang: bukaKeranjang,
      );

    } else {

      // Halaman Keranjang dari NavigationBar
      halaman = CartPage(
        produk: produk,
        onTambah: tambahJumlah,
        onKurang: kurangiJumlah,

        // Tidak menggunakan tombol back karena
        // halaman berada di dalam NavigationBar
        bisaKembali: false,
      );
    }

    return Scaffold(

      // Menampilkan halaman sesuai NavigationBar
      body: halaman,

      // NavigationBar digunakan untuk berpindah halaman
      bottomNavigationBar: NavigationBar(
        selectedIndex: halamanAktif,

        // Ketika menu ditekan
        onDestinationSelected: (index) {

          // setState digunakan agar halaman yang aktif
          // langsung berubah.
          setState(() {
            halamanAktif = index;
          });
        },

        destinations: const [

          // Menu Home
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),

          // Menu Keranjang
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
        ],
      ),
    );
  }
}