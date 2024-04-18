import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_pinjam.dart';

import '../../../routes/app_pages.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Peminjaman'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // Ubah warna latar belakang app bar
      ),
      body: controller.obx(
            (state) => state != null && state.isNotEmpty
            ? ListView.separated(
          itemCount: state.length,
          itemBuilder: (context, index) {
            DataPinjam dataPinjam = state[index];
            return Card(
              elevation: 3, // Tambahkan efek shadow
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  "${dataPinjam.book?.judul}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Penulis: ${dataPinjam.book?.penulis}\nTanggal Pinjam: ${dataPinjam.tanggalPinjam}\nTanggal Kembali: ${dataPinjam.tanggalKembali}",
                ),
                onTap: () {
                  // Tambahkan aksi ketika item diklik
                },
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 8),
        )
            : Center(
          child: Text(
            "Belum ada data peminjaman",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        onLoading: Center(child: CircularProgressIndicator()), // Ubah indikator loading
      ),
    );
  }
}
