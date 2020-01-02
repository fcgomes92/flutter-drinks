import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:validate/validate.dart';

class _LoginData {
  String email = '';
  String password = '';
}

class LoginCard extends StatefulWidget {
  LoginCard({Key key}) : super(key: key);

  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  _LoginData _data = new _LoginData();

  String _validateEmail(String value) {
    // If empty value, the isEmail function throw a error.
    // So I changed this function with try and catch.
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }

    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'The Password must be at least 8 characters.';
    }

    return null;
  }

  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      print('Printing the login data.');
      print('Email: ${_data.email}');
      print('Password: ${_data.password}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
          child: Center(
            child: Card(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  title: Text(
                    'Login',
                    textAlign: TextAlign.center,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new TextFormField(
                          validator: this._validateEmail,
                          keyboardType: TextInputType
                              .emailAddress, // Use email input type for emails.
                          decoration: new InputDecoration(
                              hintText: 'you@example.com',
                              labelText: 'E-mail Address'),
                          onChanged: (String value) {
                            this._data.email = value;
                          },
                          textInputAction: TextInputAction.next,
                          focusNode: emailFocusNode,
                          onFieldSubmitted: (term) {
                            emailFocusNode.unfocus();
                            FocusScope.of(context)
                                .requestFocus(passwordFocusNode);
                          }),
                      new TextFormField(
                        validator: this._validatePassword,
                        focusNode: passwordFocusNode,
                        obscureText: true, // Use secure text for passwords.
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) {
                          passwordFocusNode.unfocus();
                          submit();
                        },
                        decoration: new InputDecoration(
                            hintText: 'Password',
                            labelText: 'Enter your password'),
                        onChanged: (String value) {
                          this._data.password = value;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: RaisedButton(
                          onPressed: this.submit,
                          child: Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
          )),
    );
  }
}
