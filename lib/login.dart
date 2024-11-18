import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final validCharacters = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListView(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 30,
            ),
            children: [
              _buildForm(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildForm() => Card(
        margin: const EdgeInsets.only(
          top: 80,
          right: 20,
          left: 20,
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: <Widget>[
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30),
                _buildUserNameInput(),
                const SizedBox(height: 10),
                _buildPasswordInput(),
                const SizedBox(height: 10),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      );

  Widget _buildUserNameInput() => TextFormField(
        maxLength: 20,
        decoration: const InputDecoration(
          labelText: 'UserName',
          icon: Icon(Icons.person),
        ),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return "กรุณาใส่ user name";
          } else if (!validCharacters.hasMatch(value)) {
            return 'อย่าใส่ตัวอักษรพิเศษ';
          }
          return null;
        },
        onSaved: (value) {
          // user.UserName = value!;
        },
        onFieldSubmitted: (String value) {
          // FocusScope.of(context).requestFocus(passFocus);
        },
      );

  Widget _buildPasswordInput() => TextFormField(
        // focusNode: passFocus,
        maxLength: 20,
        decoration: const InputDecoration(
          labelText: 'Password',
          icon: Icon(Icons.lock),
        ),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return "กรุณาใส่ รหัสผ่าน";
          } else if (value.length < 6) {
            return "กรุณาใส่รหัสให้มากกว่า 6 ตัว";
          } else if (!validCharacters.hasMatch(value)) {
            return 'อย่าใส่ตัวอักษรพิเศษ';
          }
          return null;
        },
        onSaved: (value) {
          // user.Password = value!;
        },
        onFieldSubmitted: (String value) {
          // FocusScope.of(context).requestFocus(passFocus2);
        },
        obscureText: true,
      );

  Widget _buildSubmitButton() => SizedBox(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          // onPressed: _submit(),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
            // if (_formKey.currentState!.validate()) {
            //   _formKey.currentState?.save();
            //   authService.login(user: user).then((result) {
            //     if (result == true) {
            //       Navigator.pushReplacementNamed(context, '/home');
            //     } else {
            //       _showAlertDialog();
            //     }
            //   });
            // }
          },
          child: Text(
            "Login".toUpperCase(),
            style: const TextStyle(color: Colors.blue),
          ),
        ),
      );
}
