import 'package:flutter/material.dart';
import 'home_page.dart';
import 'cart_page.dart';

void main() {
  runApp(const MyApp());
}

// Widget utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp digunakan sebagai wrapper utama aplikasi
    return MaterialApp(
      title: 'HotWheels GWH',
      debugShowCheckedModeBanner: false,

      // ThemeData digunakan untuk mengatur tema aplikasi
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
      ),

      // Menampilkan halaman utama
      home: const MainPage(),
    );
  }
}

// Class untuk menyimpan data produk
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

// Widget utama aplikasi
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

// State untuk MainPage
class _MainPageState extends State<MainPage> {

  // Menentukan halaman yang sedang aktif
  int halamanAktif = 0;

  // Daftar produk
  final List<Product> produk = [
    Product(
      name: 'Bone Shaker',
      price: 'Rp35.000',
      image: 'assets/Hotwheels1.jpg',
      stock: 10,
    ),

    Product(
      name: 'Twin Mill',
      price: 'Rp40.000',
      image: 'assets/Hotwheels2.jpg',
      stock: 10,
    ),

    Product(
      name: 'Rodger Dodger',
      price: 'Rp45.000',
      image: 'assets/Hotwheels3.jpg',
      stock: 10,
    ),

    Product(
      name: 'Dodge Charger',
      price: 'Rp50.000',
      image: 'assets/Hotwheels4.jpg',
      stock: 10,
    ),

    Product(
      name: 'Deora II',
      price: 'Rp38.000',
      image: 'assets/Hotwheels5.jpg',
      stock: 10,
    ),

    Product(
      name: 'Fast Gassin',
      price: 'Rp42.000',
      image: 'assets/Hotwheels6.jpg',
      stock: 10,
    ),
  ];

  // Menambahkan produk ke keranjang
  void tambahKeranjang(Product product) {
    setState(() {
      // Mengecek stok produk
      if (product.stock > 0) {
        product.stock--;
        product.jumlah++;
      }
    });
  }

  // Menambah jumlah produk di keranjang
  void tambahJumlah(Product product) {
    setState(() {
      // Mengecek stok produk
      if (product.stock > 0) {
        product.stock--;
        product.jumlah++;
      }
    });
  }

  // Mengurangi jumlah produk di keranjang
  void kurangiJumlah(Product product) {
    setState(() {
      // Mengecek jumlah produk
      if (product.jumlah > 0) {
        product.jumlah--;
        product.stock++;
      }
    });
  }

  // Membuka CartPage menggunakan Navigator.push
  void bukaKeranjang() {
    Navigator.push(
      context,

      // MaterialPageRoute digunakan untuk membuka halaman baru
      MaterialPageRoute(
        builder: (context) => CartPage(
          produk: produk,

          // Fungsi untuk menambah jumlah
          onTambah: tambahJumlah,

          // Fungsi untuk mengurangi jumlah
          onKurang: kurangiJumlah,

          // Cart dibuka melalui Navigator.push
          bisaKembali: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai struktur utama aplikasi
    return Scaffold(

      // Menampilkan halaman sesuai index
      body: halamanAktif == 0
          ? HomePage(
        produk: produk,

        // Fungsi tambah produk
        onTambah: tambahKeranjang,

        // Fungsi membuka CartPage
        onBukaKeranjang: bukaKeranjang,
      )
          : CartPage(
        produk: produk,

        // Fungsi tambah jumlah
        onTambah: tambahJumlah,

        // Fungsi kurang jumlah
        onKurang: kurangiJumlah,

        // Cart dibuka melalui NavigationBar
        // sehingga tidak membutuhkan tombol kembali
        bisaKembali: false,
      ),

      // NavigationBar digunakan sebagai navigasi halaman
      bottomNavigationBar: NavigationBar(
        selectedIndex: halamanAktif,

        // Menjalankan fungsi ketika menu ditekan
        onDestinationSelected: (index) {
          setState(() {
            halamanAktif = index;
          });
        },

        // Daftar menu NavigationBar
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