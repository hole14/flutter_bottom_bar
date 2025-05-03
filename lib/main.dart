import 'package:flutter/material.dart';
import 'package:flutter_bottom_bar/ui/FavoritePage/favorite.dart';
import 'package:flutter_bottom_bar/ui/HomePage/home.dart';
import 'package:flutter_bottom_bar/ui/NotificationPage/notifikasi.dart';
import 'package:flutter_bottom_bar/ui/ProfilePage/profile.dart';
import 'package:flutter_bottom_bar/ui/SettingPage/setting.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blueAccent),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomePage(), FavoritePage(), NotifikasiPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom Nav'), backgroundColor: Colors.cyanAccent,),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
        ], backgroundColor: const Color.fromARGB(255, 255, 170, 199),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
          ),
          children: [
            UserAccountsDrawerHeader(accountName: Text('Kholis Ibrohim'), accountEmail: Text('kholisibrohim37@gmail.com'), currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage('https://i.pinimg.com/736x/a4/11/f9/a411f94f4622cfa7c1a87f4f79328064.jpg')),decoration: BoxDecoration(color: Colors.blueAccent)),
            ListTile(
              leading: Icon(Icons.account_circle_sharp),
              title: Text('Profile'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingPage(),));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
              Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
