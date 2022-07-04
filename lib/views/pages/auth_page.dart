import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/utilities/enums.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthFormType _authType = AuthFormType.login;
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  _submit(AuthController model) async {
    try {
      await model.submit();
      if(!mounted) return;
      Navigator.of(context).pushReplacementNamed(AppRoutes.bottomNavbarRoute);
    } catch (err) {
      // TODO: We will refactor this code into another widget in the next session
      return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              "Error!",
              style: Theme.of(context).textTheme.headline5,
            ),
            content: Text(err.toString(),
                style: Theme.of(context).textTheme.subtitle2),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("OK"))
                ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _auth = Provider.of<AuthBase>(context);
    return Consumer<AuthController>(
      builder: (_, model, __) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 32.0, vertical: 46.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Text(
                      model.authFormType == AuthFormType.login
                          ? 'Login'
                          : 'Register',
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
                        FocusScope.of(context)
                            .requestFocus(_passwordFocusNode);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'write some text in email field';
                        }
                        return null;
                      },
                      onChanged: model.updateEmail,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "password",
                        hintText: 'Enter Your password',
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      focusNode: _passwordFocusNode,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          print('write some text in password field');
                          return 'write some text in password field';
                        } else {
                          print('done');
                          return null;
                        }
                      },
                      onChanged: model.updatePassword,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: model.authFormType == AuthFormType.login
                            ? InkWell(
                                child: const Text('Forgot Your Password?'),
                                onTap: () {},
                              )
                            : null),
                    SizedBox(
                      height: 24.0,
                    ),
                    MainButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          debugPrint("Email: ${model.email}");
                          debugPrint("Password: ${model.password}");

                          _submit(model);
                        }
                      },
                      text: model.authFormType == AuthFormType.login
                          ? 'Login'
                          : 'Register',
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    InkWell(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(model.authFormType == AuthFormType.login
                              ? 'Don\'t Have an Account!'
                              : 'Already Have an Account!')),
                      onTap: () {
                        _emailController.clear();
                        _passwordController.clear();
                        model.toggleFormType();
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
      },
    );
  }
}
