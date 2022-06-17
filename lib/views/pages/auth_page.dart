import 'package:e_commerce/utilities/enums.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/widget/main_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthFormType _authType = AuthFormType.login;
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 46.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Text(
                  _authType == AuthFormType.login ? 'Login' : 'Register',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 64.0,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: 'Enter Your Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailFocusNode,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'write some text in email field';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "password",
                    hintText: 'Enter Your password',
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  focusNode: _passwordFocusNode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      print('write some text in email field');
                      return 'write some text in email field';
                    } else {
                      print('done');
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: _authType == AuthFormType.login
                        ? InkWell(
                            child: const Text('Forgot Your Password?'),
                            onTap: () {},
                          )
                        : null),
                SizedBox(
                  height: 24.0,
                ),
                MainButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Processing Data'),
                          duration: Duration(milliseconds: 900),
                        ),
                      );
                      await Future.delayed(const Duration(seconds: 1), () {});

                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.bottomNavbarRoute,
                      );
                    }
                  },
                  text: _authType == AuthFormType.login ? 'Login' : 'Register',
                ),
                SizedBox(
                  height: 16.0,
                ),
                InkWell(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(_authType == AuthFormType.login
                          ? 'Don\'t Have an Account!'
                          : 'Already Have an Account!')),
                  onTap: () {
                    _emailController.clear();
                    _passwordController.clear();
                    setState(() {
                      if (_authType == AuthFormType.login) {
                        _authType = AuthFormType.register;
                      } else {
                        _authType = AuthFormType.login;
                      }
                    });
                  },
                ),
                SizedBox(
                  height: _size.height * .09,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Or Login With Social Accounts',
                      style: Theme.of(context).textTheme.subtitle1,
                    )),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0)),
                        child: Icon(
                          Icons.facebook,
                          size: 44,
                          color: Colors.blue,
                        )),
                    SizedBox(
                      width: 16.0,
                    ),
                    Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0)),
                        child: Icon(
                          Icons.mail,
                          size: 44,
                          color: Colors.red,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
