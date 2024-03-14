import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama'),
        centerTitle: true,
      ),
      backgroundColor: Colors.purple, // Set background color to purple
      drawer: new Drawer( // Add Drawer
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: new Text("Alvin", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),),
              accountEmail: new Text("alvin@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
              ),
            ),
            ListTile(
              leading: Icon (Icons.person),
              title: Text('Profil'),
              onTap: () {
                // Navigate to appropriate route
              },
            ),
            ListTile(
              leading: Icon (Icons.settings),
              title: Text('Pengaturan'),
              onTap: () {
                // Navigate to appropriate route
              },
            ),
            ListTile(
              leading: Icon (Icons.info),
              title: Text('Tentang'),
              onTap: () {
                // Navigate to appropriate route
              },
            ),
            ListTile(
              leading: Icon (Icons.exit_to_app),
              title: Text('Keluar'),
              onTap: () => Get.toNamed(Routes.LOGIN),
              // Navigate to appropriate route
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20), // Add some space between logo and buttons
            Image.asset(
              'assets/logo.png', // Replace 'assets/logo.png' with your logo path
              height: 300,
              width: 300,
            ),
            SizedBox(height: 20), // Add some space between logo and buttons
            Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Icon(Icons.book, size: 80),
                            ],
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () => Get.toNamed(Routes.BOOK),
                            child: Text('List Buku'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Icon(Icons.assignment, size: 80),
                            ],
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () => Get.toNamed(Routes.PEMINJAMAN),
                            child: Text('Peminjaman'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // Add some space between buttons and columns
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Icon(Icons.money, size: 80),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => Get.toNamed(Routes.PEMINJAMAN),
                          child: Text('Cek Denda'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Icon(Icons.arrow_circle_up, size: 80),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => Get.toNamed(Routes.PEMINJAMAN),
                          child: Text('Pengembalian'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profil',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.purple,
        onTap: (int index) {
          // Handle navigation to different tabs
        },
      ),
    );

  }
}
