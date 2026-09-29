import 'package:flutter/material.dart';

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
      title: 'HotWheels Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      // Menentukan halaman pertama yang ditampilkan
      home: const HomePage(),
    );
  }
}

// Widget halaman Home
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai struktur dasar halaman
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // SafeArea menjaga isi agar tidak tertutup notch/status bar
      body: SafeArea(
        // SingleChildScrollView membuat halaman dapat di-scroll
        child: SingleChildScrollView(
          // Padding memberikan jarak dari tepi layar
          child: Padding(
            padding: const EdgeInsets.all(20),

            // Column menyusun isi halaman secara vertikal
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row menyusun header secara horizontal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Column untuk nama toko dan tulisan tambahan
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text untuk nama toko
                        Text(
                          'HotWheels GWH',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade700,
                          ),
                        ),

                        // SizedBox memberikan jarak vertikal
                        const SizedBox(height: 4),

                        // Text untuk deskripsi toko
                        Text(
                          'Mini Car Store',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),

                    // Container digunakan sebagai tempat icon keranjang
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      // Icon menampilkan icon keranjang
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 20),
                // TextField digunakan sebagai input pencarian
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari HotWheels...',
                    hintStyle: TextStyle(color: Colors.grey.shade400),

                    // Icon pencarian di bagian kanan TextField
                    suffixIcon: const Icon(Icons.search, color: Colors.red),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 25),
                // Text judul kategori
                const Text(
                  'Kategori',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 12),
                // Row untuk menyusun kategori secara horizontal
                Row(
                  children: [
                    // Expanded membagi ruang kategori
                    Expanded(
                      child: categoryItem(Icons.directions_car, 'Mainline'),
                    ),

                    // SizedBox memberikan jarak horizontal
                    const SizedBox(width: 10),
                    // Expanded membagi ruang kategori
                    Expanded(child: categoryItem(Icons.star, 'Premium')),

                    // SizedBox memberikan jarak horizontal
                    const SizedBox(width: 10),
                    // Expanded membagi ruang kategori
                    Expanded(
                      child: categoryItem(
                        Icons.local_fire_department,
                        'Limited',
                      ),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 25),
                // Row untuk judul produk dan tombol lihat semua
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text judul produk
                    const Text(
                      'Produk Populer',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Text untuk tombol lihat semua
                    Text(
                      'Lihat Semua',
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 12),
                // Row untuk menampilkan produk
                Row(
                  children: [
                    // Expanded untuk membagi ruang produk
                    Expanded(
                      child: productCard(
                        'Bone Shaker',
                        'Rp35.000',
                        Icons.directions_car,
                      ),
                    ),

                    // SizedBox memberikan jarak antar produk
                    const SizedBox(width: 10),

                    // Expanded untuk membagi ruang produk
                    Expanded(
                      child: productCard(
                        'Twin Mill',
                        'Rp40.000',
                        Icons.directions_car,
                      ),
                    ),

                    // SizedBox memberikan jarak antar produk
                    const SizedBox(width: 10),

                    // Expanded untuk membagi ruang produk
                    Expanded(
                      child: productCard(
                        'Rodger Dodger',
                        'Rp45.000',
                        Icons.directions_car,
                      ),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak antar baris
                const SizedBox(height: 12),
                Row(
                  children: [
                    // Expanded untuk membagi ruang produk
                    Expanded(
                      child: productCard(
                        'Dodge Charger',
                        'Rp50.000',
                        Icons.directions_car,
                      ),
                    ),

                    // SizedBox memberikan jarak antar produk
                    const SizedBox(width: 10),

                    // Expanded untuk membagi ruang produk
                    Expanded(
                      child: productCard(
                        'Deora II',
                        'Rp38.000',
                        Icons.directions_car,
                      ),
                    ),

                    // SizedBox memberikan jarak antar produk
                    const SizedBox(width: 10),

                    // Expanded untuk membagi ruang produk
                    Expanded(
                      child: productCard(
                        'Fast Gassin',
                        'Rp42.000',
                        Icons.directions_car,
                      ),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak bawah
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),

      // BottomNavigationBar digunakan sebagai navigasi bagian bawah
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.red.shade700,
        unselectedItemColor: Colors.grey,
        items: const [
          // Icon untuk halaman Home
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          // Icon untuk katalog produk
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Produk'),

          // Icon untuk keranjang
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),

          // Icon untuk profil
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  // Container untuk membuat item kategori
  Widget categoryItem(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          // Icon kategori
          Icon(icon, color: Colors.red.shade700, size: 30),

          // SizedBox memberikan jarak
          const SizedBox(height: 8),

          // Text nama kategori
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }

  // Container untuk membuat card produk
  Widget productCard(String name, String price, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container sebagai area gambar produk berbentuk persegi
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey.shade100),

            // Icon sebagai gambar sementara mobil
            child: Icon(icon, size: 55, color: Colors.red.shade700),
          ),

          // SizedBox memberikan jarak
          const SizedBox(height: 8),

          // Text nama produk
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),

          // SizedBox memberikan jarak
          const SizedBox(height: 4),

          // Text harga produk
          Text(
            price,
            style: TextStyle(
              fontSize: 12,
              color: Colors.red.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),

          // SizedBox memberikan jarak
          const SizedBox(height: 8),

          // Container sebagai tombol tambah ke keranjang
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              color: Colors.red.shade700,
              borderRadius: BorderRadius.circular(6),
            ),

            // Row untuk icon dan tulisan tombol
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon keranjang
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 14,
                  color: Colors.white,
                ),

                // SizedBox memberikan jarak
                const SizedBox(width: 4),

                // Text tombol
                const Text(
                  'Tambah ke Keranjang',
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
