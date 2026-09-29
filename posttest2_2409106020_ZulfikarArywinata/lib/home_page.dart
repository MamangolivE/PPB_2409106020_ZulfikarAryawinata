import 'package:flutter/material.dart';
import 'main.dart';

// Widget halaman Home
class HomePage extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
                        // Membuka CartPage menggunakan Navigator.push
                        onBukaKeranjang();
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

                // TextField digunakan untuk pencarian
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari HotWheels...',

                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),

                    // Icon pencarian
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.red,
                    ),

                    filled: true,
                    fillColor: Colors.white,

                    // OutlineInputBorder digunakan sebagai border
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

                    // Expanded membagi ruang
                    Expanded(
                      child: categoryItem(
                        Icons.directions_car,
                        'Mainline',
                      ),
                    ),

                    // SizedBox memberikan jarak
                    const SizedBox(width: 10),

                    // Expanded membagi ruang
                    Expanded(
                      child: categoryItem(
                        Icons.star,
                        'Premium',
                      ),
                    ),

                    // SizedBox memberikan jarak
                    const SizedBox(width: 10),

                    // Expanded membagi ruang
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

                    // Text judul
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

                // Baris produk pertama
                Row(
                  children: [

                    // Produk pertama
                    Expanded(
                      child: productCard(produk[0]),
                    ),

                    // SizedBox memberikan jarak
                    const SizedBox(width: 10),

                    // Produk kedua
                    Expanded(
                      child: productCard(produk[1]),
                    ),

                    // SizedBox memberikan jarak
                    const SizedBox(width: 10),

                    // Produk ketiga
                    Expanded(
                      child: productCard(produk[2]),
                    ),
                  ],
                ),

                // SizedBox memberikan jarak
                const SizedBox(height: 12),

                // Baris produk kedua
                Row(
                  children: [

                    // Produk keempat
                    Expanded(
                      child: productCard(produk[3]),
                    ),

                    // SizedBox memberikan jarak
                    const SizedBox(width: 10),

                    // Produk kelima
                    Expanded(
                      child: productCard(produk[4]),
                    ),

                    // SizedBox memberikan jarak
                    const SizedBox(width: 10),

                    // Produk keenam
                    Expanded(
                      child: productCard(produk[5]),
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
              onTambah(product);
            }
                : null,

            // Container sebagai tombol
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 7,
              ),

              // BoxDecoration untuk tombol
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