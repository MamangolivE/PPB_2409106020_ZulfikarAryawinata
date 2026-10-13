import 'package:flutter/material.dart';
import 'main.dart';

// StatefulWidget digunakan karena halaman Home memiliki
// state pencarian yang dapat berubah.
class HomePage extends StatefulWidget {
  final List<Product> produk;

  // Fungsi untuk menambahkan produk
  final Function(Product) onTambah;

  // Fungsi untuk membuka keranjang
  final VoidCallback onBukaKeranjang;

  const HomePage({
    super.key,
    required this.produk,
    required this.onTambah,
    required this.onBukaKeranjang,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

// State halaman Home
class _HomePageState extends State<HomePage> {
  // Menyimpan teks pencarian
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter produk berdasarkan teks pencarian
    List<Product> produkTampil = widget.produk.where((product) {
      return product.name.toLowerCase().contains(searchQuery);
    }).toList();

    // Scaffold digunakan sebagai struktur dasar halaman
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // SafeArea menjaga isi agar tidak tertutup status bar
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            // Column menyusun isi secara vertikal
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Row untuk bagian header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // Column untuk nama toko
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // Text nama toko
                        Text(
                          'HotWheels GWH',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade700,
                          ),
                        ),

                        // SizedBox memberikan jarak
                        const SizedBox(height: 4),

                        // Text deskripsi toko
                        Text(
                          'Mini Car Store',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),

                    // GestureDetector digunakan untuk mendeteksi klik
                    GestureDetector(
                      onTap: () {
                        // Membuka halaman keranjang
                        widget.onBukaKeranjang();
                      },

                      // Container digunakan sebagai tempat icon
                      child: Container(
                        padding: const EdgeInsets.all(10),

                        // BoxDecoration mengatur tampilan container
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        // Icon keranjang
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 20),

                // TextField digunakan untuk pencarian produk
                TextField(
                  // onChanged dijalankan ketika teks berubah
                  onChanged: (value) {
                    // setState memperbarui hasil pencarian secara realtime
                    setState(() {
                      searchQuery = value.toLowerCase();
                    });
                  },

                  decoration: InputDecoration(
                    // Teks petunjuk pencarian
                    hintText: 'Cari HotWheels...',

                    // Warna teks petunjuk
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),

                    // Icon pencarian
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.red,
                    ),

                    // Menggunakan warna putih
                    filled: true,
                    fillColor: Colors.white,

                    // Border search bar
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 25),

                // Text judul kategori
                const Text(
                  'Kategori',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 12),

                // Row untuk kategori
                Row(
                  children: [

                    // Expanded membagi ruang kategori
                    Expanded(
                      child: categoryItem(
                        Icons.directions_car,
                        'Mainline',
                      ),
                    ),

                    // SizedBox memberikan jarak
                    const SizedBox(width: 10),

                    // Expanded membagi ruang kategori
                    Expanded(
                      child: categoryItem(
                        Icons.star,
                        'Premium',
                      ),
                    ),

                    // SizedBox memberikan jarak
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

                // Row untuk judul produk
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

                    // Text lihat semua
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

                // Mengecek apakah produk ditemukan
                if (produkTampil.isEmpty)

                // Center digunakan ketika tidak ada produk
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30),

                      // Text informasi produk tidak ditemukan
                      child: Text(
                        'Produk tidak ditemukan',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  )

                else

                // LayoutBuilder digunakan untuk menyesuaikan
                // lebar card dengan ukuran layar.
                  LayoutBuilder(
                    builder: (context, constraints) {

                      // Jumlah kolom tetap 3 seperti Posttest sebelumnya
                      const int jumlahKolom = 3;

                      // Jarak antar card
                      const double jarak = 10;

                      // Menghitung lebar setiap card
                      double lebarCard =
                          (constraints.maxWidth -
                              ((jumlahKolom - 1) * jarak)) /
                              jumlahKolom;

                      // Wrap digunakan agar produk tersusun
                      // menjadi beberapa baris.
                      return Wrap(
                        spacing: jarak,
                        runSpacing: 12,

                        // Membuat card untuk setiap produk
                        children: produkTampil.map((product) {
                          return SizedBox(
                            width: lebarCard,

                            // Widget card produk
                            child: productCard(product),
                          );
                        }).toList(),
                      );
                    },
                  ),

                // SizedBox memberikan jarak bawah
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk membuat item kategori
  Widget categoryItem(
      IconData icon,
      String title,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),

      // BoxDecoration untuk tampilan kategori
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),

      // Column menyusun icon dan text
      child: Column(
        children: [

          // Icon kategori
          Icon(
            icon,
            color: Colors.red.shade700,
            size: 30,
          ),

          // SizedBox memberikan jarak
          const SizedBox(height: 8),

          // Text kategori
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk membuat card produk
  Widget productCard(Product product) {
    return Container(
      padding: const EdgeInsets.all(10),

      // BoxDecoration digunakan untuk tampilan card
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),

      // Column menyusun isi card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Image.asset digunakan untuk menampilkan gambar
          Image.asset(
            product.image,
            height: 100,
            width: double.infinity,
            fit: BoxFit.contain,
          ),

          // SizedBox memberikan jarak
          const SizedBox(height: 8),

          // Text nama produk
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          // SizedBox memberikan jarak
          const SizedBox(height: 4),

          // Text harga produk
          Text(
            product.price,
            style: TextStyle(
              fontSize: 12,
              color: Colors.red.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Text jumlah stok
          Text(
            'Stok: ${product.stock}',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade600,
            ),
          ),

          // SizedBox memberikan jarak
          const SizedBox(height: 8),

          // GestureDetector digunakan sebagai tombol
          GestureDetector(
            onTap: product.stock > 0
                ? () {
              // Menambahkan produk ke keranjang
              widget.onTambah(product);

              // Memperbarui tampilan stok
              setState(() {});
            }
                : null,

            // Container digunakan sebagai tombol
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 7,
              ),

              // BoxDecoration untuk tampilan tombol
              decoration: BoxDecoration(
                color: product.stock > 0
                    ? Colors.red.shade700
                    : Colors.grey,
                borderRadius: BorderRadius.circular(6),
              ),

              // Row untuk icon dan text
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
                  Text(
                    product.stock > 0
                        ? 'Tambah ke Keranjang'
                        : 'Stok Habis',
                    style: const TextStyle(
                      fontSize: 9,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}