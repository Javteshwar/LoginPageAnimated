import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_application/Blocs/PasswordShowBloc.dart';

class CustomTextFormField extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String hintTxt;
  final TextEditingController txtCntrlr;
  final bool isPass;
  CustomTextFormField({
    this.formKey,
    this.hintTxt,
    this.txtCntrlr,
    this.isPass = false,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  TogglePassBloc _togglePassBloc;
  @override
  void initState() {
    _togglePassBloc = TogglePassBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Form(
        key: widget.formKey,
        child: BlocBuilder<TogglePassBloc, TogglePassState>(
          cubit: _togglePassBloc,
          builder: (context, state) {
            return TextFormField(
              onChanged: (value) => widget.formKey.currentState.validate(),
              controller: widget.txtCntrlr,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w600),
              obscureText: widget.isPass ? state.obscTxt : false,
              decoration: InputDecoration(
                labelText: widget.hintTxt,
                labelStyle: TextStyle(color: Colors.blue[900]),
                suffixIcon: widget.isPass
                    ? IconButton(
                        icon: state.obscTxt
                            ? Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.blue[900],
                              )
                            : Icon(Icons.visibility_outlined,
                                color: Colors.blue[900]),
                        onPressed: () {
                          _togglePassBloc.add(TogglePassEvent());
                        },
                      )
                    : SizedBox.shrink(),
                hintText: "Enter ${widget.hintTxt}",
                hintStyle: TextStyle(
                    color: Colors.blue[900], fontWeight: FontWeight.w400),
                enabledBorder:
                    getUnderlineInputBorder(clr: Colors.blue[900], wdth: 2),
                focusedBorder:
                    getUnderlineInputBorder(clr: Colors.blue[900], wdth: 4),
                focusedErrorBorder:
                    getUnderlineInputBorder(clr: Colors.red, wdth: 4),
                errorBorder: getUnderlineInputBorder(clr: Colors.red, wdth: 2),
              ),
              validator: (value) {
                if (value.isEmpty) return "Field Cannot be Empty";
                return null;
              },
            );
          },
        ),
      ),
    );
  }

  UnderlineInputBorder getUnderlineInputBorder({Color clr, double wdth}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: clr,
        width: wdth,
      ),
    );
  }
}
