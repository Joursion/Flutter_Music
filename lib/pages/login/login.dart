import 'package:flutter/material.dart';
import 'package:netease_music/pages/login/widgets/password.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  TextEditingController _emailController;
  TextEditingController _passwordController;

  String _name;
  String _password;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('邮箱登录'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            new TextFormField(
              autofocus: true,
              controller: _emailController,
              decoration: new InputDecoration(
                // labelText: '请输入您的邮箱',
                // border: const UnderlineInputBorder(borderSide: BorderSide(width: 10)),
                filled: true,
                hintText: '请输入您的邮箱'
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (val) {
                _name = val;
              },
              textInputAction: TextInputAction.next,
            ),
            new PasswordField(
              validator: (text) {
                if (text.trim().isEmpty) {
                  return '密码不能为空';
                }
                return null;
              },
              controller: _passwordController,
            )
          ],
        ),

      ),
    );
  }
}