import 'package:flutter/material.dart';
import 'package:intern_application/CommonWidgets/SimpleWidgets.dart';
import 'package:intern_application/Screens/LoginScreen.dart';

class PrimaryHomeScreen extends StatefulWidget {
  @override
  _PrimaryHomeScreenState createState() => _PrimaryHomeScreenState();
}

class _PrimaryHomeScreenState extends State<PrimaryHomeScreen> {
  double pageWidth;
  double pageHeight;
  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    pageHeight = MediaQuery.of(context).size.height;
    return Container(
      constraints: BoxConstraints(minHeight: pageHeight, minWidth: pageWidth),
      decoration: BoxDecoration(gradient: getBackground()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Lorem Ipsum"),
                accountEmail: Text("lorem@ipsum.com"),
                decoration: BoxDecoration(color: Colors.red),
              ),
              ListTile(
                title: Text(
                  "Edit Profile",
                  textScaleFactor: 1.25,
                ),
                leading: Icon(Icons.person),
              ),
              ListTile(
                title: Text(
                  "Contact",
                  textScaleFactor: 1.25,
                ),
                leading: Icon(Icons.phone),
              ),
              ListTile(
                title: Text(
                  "About Us",
                  textScaleFactor: 1.25,
                ),
                leading: Icon(Icons.info_outline),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: ListTile(
                    title: Text(
                      "Log Out",
                      textScaleFactor: 1.25,
                    ),
                    leading: Icon(Icons.exit_to_app),
                    onTap: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) =>
                            getLoadingIndicatorDialog(msg: "Logging Out"),
                      );
                      await Future.delayed(Duration(seconds: 2));
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                "Welcome to Electura",
                textScaleFactor: 2.75,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
