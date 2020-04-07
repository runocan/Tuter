import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);
  @override
  _SignupPage createState() => new _SignupPage();
}

enum StudentType { student, tutor }

class _SignupPage extends State<SignupPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _firstName;
  String _lastName;
  String _major;

  StudentType _type = StudentType.student;

  void saveUserInformation() {
    final form = formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('Hello, Welcome to Tüter!'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: new Form(
                key: formKey,
                child: new Column(children: <Widget>[
                  new TextFormField(
                    decoration: new InputDecoration(labelText: 'First Name'),
                    validator: (value) =>
                        value.isEmpty ? 'Please provide your first name' : null,
                    onSaved: (value) => _firstName = value,
                    textCapitalization: TextCapitalization.words,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(labelText: 'Last Name'),
                    validator: (value) =>
                        value.isEmpty ? 'Please provide your last name' : null,
                    onSaved: (value) => _lastName = value,
                    textCapitalization: TextCapitalization.words,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(labelText: 'Major'),
                    validator: (value) =>
                        value.isEmpty ? 'Please provide your major' : null,
                    onSaved: (value) => _major = value,
                    textCapitalization: TextCapitalization.words,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(labelText: 'Email'),
                    validator: (value) =>
                        value.isEmpty ? 'Please provide your email' : null,
                    onSaved: (value) => _email = value,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(labelText: 'Password'),
                    validator: (value) =>
                        value.isEmpty ? 'Please provide a password' : null,
                    obscureText: true,
                    onSaved: (value) => _password = value,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Sign Up as a: ',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: <Widget>[
                      Radio(
                          activeColor: Theme.of(context).primaryColor,
                          value: StudentType.student,
                          groupValue: _type,
                          onChanged: (StudentType value) {
                            setState(() {
                              _type = value;
                            });
                          }),
                      Text(
                        'Student',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      Radio(
                          activeColor: Theme.of(context).primaryColor,
                          value: StudentType.tutor,
                          groupValue: _type,
                          onChanged: (StudentType value) {
                            setState(() {
                              _type = value;
                            });
                          }),
                      Text(
                        'Tutor',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.0),
                  new RawMaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 120.0),
                    fillColor: Colors.black,
                    elevation: 2.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Confirm',
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    shape: const StadiumBorder(),
                    onPressed: saveUserInformation,
                  ),
                  //LoginButton(text: 'Confirm'),
                ])),
          ),
        ));
  }
}
