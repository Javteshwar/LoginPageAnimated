import 'package:flutter/material.dart';
import 'package:intern_application/CommonWidgets/SimpleWidgets.dart';
import 'package:intern_application/CommonWidgets/TextFormField.dart';
import 'package:intern_application/Screens/HomeScreen.dart';
import 'package:intern_application/Screens/LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _uidRegFormKey = GlobalKey<FormState>();
  final _nameRegFormKey = GlobalKey<FormState>();
  final _passRegFormKey = GlobalKey<FormState>();
  final _passConfirmRegFormKey = GlobalKey<FormState>();
  final _phoneRegFormKey = GlobalKey<FormState>();
  TextEditingController _uidRegCntrlr;
  TextEditingController _passRegCntrlr;
  TextEditingController _nameRegCntrlr;
  TextEditingController _passConfirmRegCntrlr;
  TextEditingController _phoneRegCntrlr;
  List<GlobalKey<FormState>> _formKeys = List();
  List<TextEditingController> _txtCntrlrs = List();
  List<String> _hintTxts = List();
  List<bool> _passFields = List();
  double pageWidth;
  double pageHeight;
  @override
  void initState() {
    _uidRegCntrlr = TextEditingController();
    _passRegCntrlr = TextEditingController();
    _passConfirmRegCntrlr = TextEditingController();
    _nameRegCntrlr = TextEditingController();
    _phoneRegCntrlr = TextEditingController();
    populateLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    pageHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints(
            minHeight: pageHeight,
            minWidth: pageWidth,
          ),
          decoration: BoxDecoration(gradient: getBackground()),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: pageHeight / 15),
                Text(
                  "Register for Electura",
                  textScaleFactor: 2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: pageHeight / 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 8),
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
                      "Register",
                      textScaleFactor: 1.5,
                    ),
                  ),
                  onPressed: () async {
                    await registerUser();
                  },
                ),
                SizedBox(
                  height: 32,
                ),
                Text("ALREADY HAVE AN ACCOUNT?"),
                TextButton(
                  child: Text(
                    "Login",
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
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

  void populateLists() {
    _formKeys.add(_uidRegFormKey);
    _formKeys.add(_nameRegFormKey);
    _formKeys.add(_phoneRegFormKey);
    _formKeys.add(_passRegFormKey);
    _formKeys.add(_passConfirmRegFormKey);

    _txtCntrlrs.add(_uidRegCntrlr);
    _txtCntrlrs.add(_nameRegCntrlr);
    _txtCntrlrs.add(_phoneRegCntrlr);
    _txtCntrlrs.add(_passRegCntrlr);
    _txtCntrlrs.add(_passConfirmRegCntrlr);

    _hintTxts.add("User ID");
    _hintTxts.add("Name");
    _hintTxts.add("Phone Number");
    _hintTxts.add("Password");
    _hintTxts.add("Confirm Password");

    _passFields.add(false);
    _passFields.add(false);
    _passFields.add(false);
    _passFields.add(true);
    _passFields.add(true);
  }

  List<Widget> getTextFields() {
    List<Widget> res = List();
    for (int i = 0; i < _passFields.length; i++) {
      res.add(
        TweenAnimationBuilder(
          child: CustomTextFormField(
            formKey: _formKeys[i],
            txtCntrlr: _txtCntrlrs[i],
            hintTxt: _hintTxts[i],
            isPass: _passFields[i],
          ),
          duration: Duration(milliseconds: 700 + (100 * i)),
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
    }
    return res;
  }

  Future<void> registerUser() async {
    for (int i = 0; i < _formKeys.length; i++) {
      if (!_formKeys[i].currentState.validate()) return;
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return getLoadingIndicatorDialog(msg: "Registering");
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
}
