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

// Widget utama yang mengatur halaman dan Navigation Bar
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
      name: 'Rodger Dodger',
      price: 'Rp40.000',
      image: 'assets/Hotwheels2.jpg',
      stock: 10,
    ),
    Product(
      name: 'Dodge Charger',
      price: 'Rp45.000',
      image: 'assets/Hotwheels3.jpg',
      stock: 10,
    ),
    Product(
      name: 'Twin Mill',
      price: 'Rp50.000',
      image: 'assets/Hotwheels4.jpg',
      stock: 10,
    ),
    Product(
      name: 'Hot Rods',
      price: 'Rp38.000',
      image: 'assets/Hotwheels5.jpg',
      stock: 10,
    ),
    Product(
      name: 'BMW M3 GTR',
      price: 'Rp42.000',
      image: 'assets/Hotwheels6.jpg',
      stock: 10,
    ),
  ];

  // Menambahkan produk ke keranjang
  void tambahKeranjang(Product product) {
    setState(() {
      // Mengecek apakah stok masih tersedia
      if (product.stock > 0) {
        product.stock--;
        product.jumlah++;
      }
    });
  }

  // Menambah jumlah produk di keranjang
  void tambahJumlah(Product product) {
    setState(() {
      // Mengecek apakah stok masih tersedia
      if (product.stock > 0) {
        product.stock--;
        product.jumlah++;
      }
    });
  }

  // Mengurangi jumlah produk di keranjang
  void kurangiJumlah(Product product) {
    setState(() {
      // Mengecek apakah jumlah di keranjang lebih dari 0
      if (product.jumlah > 0) {
        product.jumlah--;
        product.stock++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai struktur utama aplikasi
    return Scaffold(

      // Menampilkan halaman sesuai index
      body: halamanAktif == 0
          ? HomePage(
        produk: produk,
        onTambah: tambahKeranjang,
      )
          : CartPage(
        produk: produk,
        onTambah: tambahJumlah,
        onKurang: kurangiJumlah,
      ),

      // NavigationBar digunakan untuk berpindah halaman
      bottomNavigationBar: NavigationBar(
        selectedIndex: halamanAktif,

        // Menjalankan fungsi ketika menu ditekan
        onDestinationSelected: (index) {
          setState(() {
            halamanAktif = index;
          });
        },

        // Navigation Bar untuk sementara hanya Home dan Keranjang
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