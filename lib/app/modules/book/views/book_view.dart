import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/response_book.dart';
import '../../../routes/app_pages.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buku'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // Ubah warna latar belakang app bar
      ),
      body: controller.obx(
            (state) => state != null && state.isNotEmpty
            ? ListView.separated(
          itemCount: state.length,
          itemBuilder: (context, index) {
            DataBook dataBook = state[index];
            return ListTile(
              title: Text(
                "${dataBook.judul}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Penulis: ${dataBook.penulis}\nPenerbit: ${dataBook.penerbit}\nTahun Terbit: ${dataBook.tahunTerbit}",
              ),
              trailing: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.ADD_PEMINJAMAN,
                    parameters: {
                      'id': (dataBook.id ?? 0).toString(),
                      'judul': dataBook.judul ?? '-'
                    }),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent, // Ubah warna tombol
                ),
                child: Text("Pinjam"),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
        )
            : Center(
          child: Text(
            "Tidak ada buku tersedia",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        onLoading: Center(child: CircularProgressIndicator()), // Ubah indikator loading
      ),
    );
  }
}
