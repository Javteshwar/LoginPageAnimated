import 'package:flutter/material.dart';
import 'package:intern_application/Models/NavBarItems.dart';
import 'package:intern_application/Screens/BatchesScreen.dart';
import 'package:intern_application/Screens/PrimaryHomeScreen.dart';
import 'package:intern_application/Screens/RepositoryScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selIndex;
  double pageWidth;
  double pageHeight;
  List<CustomNavBarItems> _navBarItems = List();
  @override
  void initState() {
    _selIndex = 1;
    getNavBarItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    pageHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: selectMainScreen(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selIndex,
          type: BottomNavigationBarType.shifting,
          items: _navBarItems.map((vl) {
            return BottomNavigationBarItem(
                icon: vl.icon, label: vl.label, backgroundColor: vl.bgColor);
          }).toList(),
          onTap: (value) {
            setState(() {
              _selIndex = value;
            });
          },
        ),
      ),
    );
  }

  Widget selectMainScreen() {
    Widget res;
    switch (_selIndex) {
      case 0:
        res = RepositoryScreen();
        break;
      case 1:
        res = PrimaryHomeScreen();
        break;
      case 2:
        res = BatchesScreen();
        break;
    }
    return res;
  }

  void getNavBarItems() {
    _navBarItems.add(
      CustomNavBarItems(
        bgColor: Colors.amber,
        icon: Icon(Icons.file_present),
        label: "Repository",
        title: SizedBox.shrink(),
      ),
    );
    _navBarItems.add(
      CustomNavBarItems(
        bgColor: Colors.red,
        icon: Icon(Icons.home),
        label: "Home",
        title: SizedBox.shrink(),
      ),
    );
    _navBarItems.add(
      CustomNavBarItems(
        bgColor: Colors.green,
        icon: Icon(Icons.anchor),
        label: "Batches",
        title: SizedBox.shrink(),
      ),
    );
  }
}
