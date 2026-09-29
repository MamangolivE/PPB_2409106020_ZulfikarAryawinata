import 'package:flutter/material.dart';
import 'main.dart';

class CartPage extends StatelessWidget {
  final List<Product> produk;
  final Function(Product) onTambah;
  final Function(Product) onKurang;

  const CartPage({
    super.key,
    required this.produk,
    required this.onTambah,
    required this.onKurang,
  });

  @override
  Widget build(BuildContext context) {

    // Mengambil produk yang memiliki jumlah di keranjang
    List<Product> produkKeranjang = produk
        .where((product) => product.jumlah > 0)
        .toList();

    // Menghitung jumlah total harga
    int total = 0;

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
        title: const Text(
          'Keranjang',
        ),
      ),

      // SafeArea menjaga isi halaman
      body: SafeArea(

        // Padding memberikan jarak
        child: Padding(
          padding: const EdgeInsets.all(20),

          // Column menyusun isi halaman
          child: Column(
            children: [

              // Jika keranjang kosong
              if (produkKeranjang.isEmpty)

              // Expanded membuat pesan berada di tengah
                const Expanded(
                  child: Center(

                    // Column menyusun icon dan text
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

              // Jika keranjang memiliki produk
              else

              // Expanded agar daftar produk dapat di-scroll
                Expanded(

                  // ListView menampilkan daftar produk
                  child: ListView.builder(
                    itemCount: produkKeranjang.length,

                    // Membuat setiap item produk
                    itemBuilder: (context, index) {

                      Product product =
                      produkKeranjang[index];

                      return Container(
                        margin: const EdgeInsets.only(
                          bottom: 12,
                        ),
                        padding: const EdgeInsets.all(12),

                        // BoxDecoration untuk card
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),

                          // BoxShadow memberikan bayangan
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),

                        // Row menyusun isi card
                        child: Row(
                          children: [

                            // Image.asset menampilkan gambar produk
                            Image.asset(
                              product.image,
                              width: 80,
                              height: 80,
                              fit: BoxFit.contain,
                            ),

                            // SizedBox memberikan jarak
                            const SizedBox(width: 12),

                            // Expanded memberikan ruang untuk informasi
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [

                                  // Text nama produk
                                  Text(
                                    product.name,
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

                                  // SizedBox memberikan jarak
                                  const SizedBox(height: 8),

                                  // Row untuk tombol jumlah
                                  Row(
                                    children: [

                                      // Tombol mengurangi jumlah
                                      IconButton(
                                        onPressed: () {
                                          onKurang(product);
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                        ),
                                      ),

                                      // Text jumlah produk
                                      Text(
                                        '${product.jumlah}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),

                                      // Tombol menambah jumlah
                                      IconButton(
                                        onPressed: product.stock > 0
                                            ? () {
                                          onTambah(product);
                                        }
                                            : null,
                                        icon: const Icon(
                                          Icons.add,
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

              // Total hanya ditampilkan jika ada produk
              if (produkKeranjang.isNotEmpty)

              // Container untuk total
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),

                  // BoxDecoration untuk total
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  // Row untuk menampilkan total
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
                        'Rp${total.toString().replaceAllMapped(
                          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
                              (match) => '${match[1]}.',
                        )}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}