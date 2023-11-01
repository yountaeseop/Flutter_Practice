import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'list_view.dart';
import 'hello.dart';
import 'home.dart';
import 'image_network.dart';
import 'shared_preference.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Appulator',
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _counter = 0;

  void _setData(int value) async{
    var key = 'count';
    SharedPreferences pref = await SharedPreferences.getInstance();
    // setData가 비동기함수라서 await를 하지 않으면 pref에 값이 들어지 않은
    // 상태로 될 수가 있어서 await를 붙여줘서 인스턴스가 완벽하게 들어오도록 한다.
    pref.setInt(key, value);
  }

  void _loadData() async {
    var key = 'count';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var value = pref.getInt(key);
      if(value == null){
        _counter = 0;
      } else {
        _counter = value;
      }
    });
  }

  @override
  void initState(){
    super.initState();
    _loadData();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ImageNetwork(),
    Home(),
    Hello(),
    ListViewScreen(),
    FileApp()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Counter',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: 'Welcome',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'add',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_rounded),
            label: 'file',
            backgroundColor: Colors.grey,
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
