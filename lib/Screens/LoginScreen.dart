import 'package:flutter/material.dart';
import 'package:intern_application/CommonWidgets/SimpleWidgets.dart';
import 'package:intern_application/CommonWidgets/TextFormField.dart';
import 'package:intern_application/Screens/HomeScreen.dart';
import 'package:intern_application/Screens/RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _uidCntrlr;
  TextEditingController _passCntrlr;

  final _uidFormKey = GlobalKey<FormState>();
  final _passFormKey = GlobalKey<FormState>();
  double pageWidth;
  double pageHeight;
  double wd;
  Tween<Offset> offs;
  @override
  void initState() {
    _uidCntrlr = TextEditingController();
    _passCntrlr = TextEditingController();
    wd = 200;
    offs = Tween(begin: Offset(0, 0), end: Offset(1, 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    pageHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(gradient: getBackground()),
            height: pageHeight,
            width: pageWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16),
                Text(
                  "Welcome to",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16),
                ClipRRect(
                  child: Image.asset(
                    "assets/images/logoDef.png",
                    height: pageHeight / 6,
                  ),
                ),
                SizedBox(
                  height: 64,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: TweenAnimationBuilder(
                    duration: Duration(milliseconds: 700),
                    child: Card(
                      elevation: 16,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                        child: Column(
                          children: getTextFields(),
                        ),
                      ),
                    ),
                    tween: Tween<double>(begin: 1, end: 0),
                    builder: (context, value, child) {
                      return Padding(
                        padding: EdgeInsets.only(right: value * pageWidth),
                        child: child,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 48),
                  child: Align(
                    widthFactor: 40,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        passwordForgotten();
                      },
                    ),
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Sign In",
                      textScaleFactor: 1.5,
                    ),
                  ),
                  onPressed: () async {
                    await loginAccount();
                  },
                ),
                SizedBox(height: 32),
                Text(
                  "DON'T HAVE AN ACCOUNT?",
                  textScaleFactor: 1.1,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 8),
                TextButton(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "REGISTER NOW",
                      textScaleFactor: 1.5,
                      style:
                          TextStyle(color: Colors.blue[900], letterSpacing: 0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getTextFields() {
    List<Widget> res = List();
    res.add(
      TweenAnimationBuilder(
        child: CustomTextFormField(
          formKey: _uidFormKey,
          txtCntrlr: _uidCntrlr,
          hintTxt: "UserId",
        ),
        duration: Duration(milliseconds: 700),
        tween: Tween<double>(
          begin: 1,
          end: 0,
        ),
        builder: (context, value, child) {
          return Padding(
            padding: EdgeInsets.only(left: pageWidth * value),
            child: child,
          );
        },
      ),
    );
    res.add(
      TweenAnimationBuilder(
        child: CustomTextFormField(
          formKey: _passFormKey,
          txtCntrlr: _passCntrlr,
          hintTxt: "Password",
          isPass: true,
        ),
        duration: Duration(milliseconds: 800),
        tween: Tween<double>(
          begin: 1,
          end: 0,
        ),
        builder: (context, value, child) {
          return Padding(
            padding: EdgeInsets.only(left: pageWidth * value),
            child: child,
          );
        },
      ),
    );
    return res;
  }

  Future<void> loginAccount() async {
    bool uidCheck = _uidFormKey.currentState.validate();
    bool passCheck = _passFormKey.currentState.validate();
    if (!(passCheck && uidCheck)) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return getLoadingIndicatorDialog(msg: "Logging In");
      },
    );
    await Future.delayed(
      Duration(seconds: 3),
    );
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  void passwordForgotten() {}
}
