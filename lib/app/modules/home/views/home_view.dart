import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu Utama',
          style: TextStyle(
            color: Colors.white, // Set the text color to black
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent, // Set the background color of the app bar to white
      ),
      backgroundColor: Colors.purple, // Set background color to purple
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "Alvin",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0,),
              ),
              accountEmail: Text("alvin@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                // Navigate to appropriate route
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Pengaturan'),
              onTap: () {
                // Navigate to appropriate route
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Tentang'),
              onTap: () {
                // Navigate to appropriate route
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Keluar'),
              onTap: () => {
                StorageProvider.write(StorageKey.status, ''),
                Get.toNamed(Routes.LOGIN),
                Get.snackbar("Success", "Berhasil Logout", backgroundColor: Colors.lightGreen)
              }, // Navigate to login page
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
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20), // Add some space between logo and buttons
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _buildFeatureButton(
                      icon: Icons.book,
                      label: 'List Buku',
                      route: Routes.BOOK,
                    ),
                  ),
                  Expanded(
                    child: _buildFeatureButton(
                      icon: Icons.assignment,
                      label: 'Riwayat',
                      route: Routes.PEMINJAMAN,
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

  Widget _buildFeatureButton({required IconData icon, required String label, required String route}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Stack(
            children: [
              Icon(icon, size: 80),
            ],
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => Get.toNamed(route),
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
