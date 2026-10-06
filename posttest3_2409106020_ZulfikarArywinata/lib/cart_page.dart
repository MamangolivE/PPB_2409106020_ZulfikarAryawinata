import 'package:flutter/material.dart';
import 'main.dart';

// Widget halaman Keranjang
class CartPage extends StatefulWidget {
  final List<Product> produk;

  // Fungsi untuk menambah jumlah
  final Function(Product) onTambah;

  // Fungsi untuk mengurangi jumlah
  final Function(Product) onKurang;

  // Menentukan apakah tombol kembali ditampilkan
  final bool bisaKembali;

  const CartPage({
    super.key,
    required this.produk,
    required this.onTambah,
    required this.onKurang,
    required this.bisaKembali,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

// State untuk halaman Keranjang
class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {

    // Mengambil produk yang ada di keranjang
    List<Product> produkKeranjang = widget.produk
        .where((product) => product.jumlah > 0)
        .toList();

    // Variabel untuk menyimpan total harga
    int total = 0;

    // Menghitung total harga
    for (Product product in produkKeranjang) {
      int harga = int.parse(
        product.price
            .replaceAll('Rp', '')
            .replaceAll('.', ''),
      );

      total = total + (harga * product.jumlah);
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // AppBar digunakan sebagai bagian atas halaman
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,

        // Tombol kembali hanya ditampilkan
        // jika CartPage dibuka menggunakan Navigator.push
        leading: widget.bisaKembali
            ? IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),

          // Navigator.pop digunakan untuk kembali
          onPressed: () {
            Navigator.pop(context);
          },
        )
            : null,

        // Text judul halaman
        title: const Text(
          'Keranjang',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // SafeArea menjaga isi halaman
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          // Column menyusun isi halaman
          child: Column(
            children: [

              // Jika keranjang kosong
              if (produkKeranjang.isEmpty)

              // Expanded membuat isi berada di tengah
                const Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        // Icon keranjang kosong
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 70,
                          color: Colors.grey,
                        ),

                        // SizedBox memberikan jarak
                        SizedBox(height: 10),

                        // Text keranjang kosong
                        Text(
                          'Keranjang masih kosong',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              // Jika ada produk di keranjang
              else

              // Expanded digunakan untuk daftar produk
                Expanded(
                  child: ListView.builder(
                    itemCount: produkKeranjang.length,

                    // Membuat setiap item produk
                    itemBuilder: (context, index) {

                      // Mengambil produk
                      Product product = produkKeranjang[index];

                      return Container(
                        margin: const EdgeInsets.only(
                          bottom: 12,
                        ),
                        padding: const EdgeInsets.all(12),

                        // BoxDecoration digunakan untuk card
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        // Row untuk isi card
                        child: Row(
                          children: [

                            // Container untuk gambar produk
                            Container(
                              width: 85,
                              height: 85,

                              // BoxDecoration untuk area gambar
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                borderRadius:
                                BorderRadius.circular(8),
                              ),

                              // Image.asset menampilkan gambar
                              child: Image.asset(
                                product.image,
                                fit: BoxFit.contain,
                              ),
                            ),

                            // SizedBox memberikan jarak
                            const SizedBox(width: 12),

                            // Expanded untuk informasi produk
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [

                                  // Text nama produk
                                  Text(
                                    product.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  // SizedBox memberikan jarak
                                  const SizedBox(height: 5),

                                  // Text harga
                                  Text(
                                    product.price,
                                    style: TextStyle(
                                      color: Colors.red.shade700,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  // Text jumlah stok
                                  Text(
                                    'Stok tersedia: ${product.stock}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),

                                  // SizedBox memberikan jarak
                                  const SizedBox(height: 8),

                                  // Row untuk tombol jumlah
                                  Row(
                                    children: [

                                      // Tombol minus
                                      GestureDetector(
                                        onTap: () {

                                          // Mengurangi jumlah
                                          widget.onKurang(product);

                                          // Memperbarui tampilan
                                          setState(() {});
                                        },

                                        // Container digunakan sebagai
                                        // tombol minus
                                        child: Container(
                                          width: 30,
                                          height: 30,

                                          // BoxDecoration untuk tombol
                                          decoration: BoxDecoration(
                                            color: Colors.red.shade700,
                                            borderRadius:
                                            BorderRadius.circular(6),
                                          ),

                                          // Icon minus
                                          child: const Icon(
                                            Icons.remove,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),

                                      // SizedBox memberikan jarak
                                      const SizedBox(width: 10),

                                      // Text jumlah produk
                                      Text(
                                        '${product.jumlah}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // SizedBox memberikan jarak
                                      const SizedBox(width: 10),

                                      // Tombol plus
                                      GestureDetector(
                                        onTap: product.stock > 0
                                            ? () {

                                          // Menambah jumlah
                                          widget.onTambah(product);

                                          // Memperbarui tampilan
                                          setState(() {});
                                        }
                                            : null,

                                        // Container digunakan sebagai
                                        // tombol plus
                                        child: Container(
                                          width: 30,
                                          height: 30,

                                          // Warna tombol berubah
                                          // ketika stok habis
                                          decoration: BoxDecoration(
                                            color: product.stock > 0
                                                ? Colors.red.shade700
                                                : Colors.grey,
                                            borderRadius:
                                            BorderRadius.circular(6),
                                          ),

                                          // Icon plus
                                          child: const Icon(
                                            Icons.add,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

              // Menampilkan bagian total dan checkout
              // jika ada produk di keranjang
              if (produkKeranjang.isNotEmpty)
                Column(
                  children: [

                    // Container untuk total
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),

                      // BoxDecoration untuk total
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      // Row untuk total
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [

                          // Text total
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // Text harga total
                          Text(
                            'Rp${formatHarga(total)}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // SizedBox memberikan jarak
                    const SizedBox(height: 10),

                    // Tombol checkout
                    GestureDetector(
                      onTap: total > 0
                          ? () {
                        // Mengosongkan jumlah produk
                        // karena produk dianggap sudah dibeli
                        for (Product product in produkKeranjang) {
                          product.jumlah = 0;
                        }

                        // Memperbarui tampilan
                        setState(() {});

                        // Menampilkan pesan checkout
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Checkout berhasil!',
                            ),
                          ),
                        );
                      }
                          : null,

                      // Container digunakan sebagai tombol checkout
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 13,
                        ),

                        // Warna tombol checkout
                        decoration: BoxDecoration(
                          color: total > 0
                              ? Colors.red.shade700
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),

                        // Row untuk icon dan text
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            // Icon checkout
                            const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                              size: 18,
                            ),

                            // SizedBox memberikan jarak
                            const SizedBox(width: 8),

                            // Text checkout
                            const Text(
                              'Checkout',
                              style: TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat format harga
  String formatHarga(int harga) {
    return harga.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]}.',
    );
  }
}