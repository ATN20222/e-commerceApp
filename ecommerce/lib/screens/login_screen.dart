import 'package:ecommerce/dataprovider/remote/firebasehelper.dart';
import 'package:ecommerce/screens/main_screen.dart';
import 'package:ecommerce/screens/signup_screen.dart';
import 'package:ecommerce/widgets/CustomButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  late String errorText;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool pass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/LoginImage.jpg',
                    width: 180,
                    height: 180,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const Text(
                    'Sign in your account',
                    style: TextStyle(
                      color: Color.fromARGB(220, 158, 158, 158),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return errorText;
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      filled: true,
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 158, 158, 158),
                          width: 1.0,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return errorText;
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: pass,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: !pass
                            ? const Icon(Icons.remove_red_eye_outlined)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            pass = !pass;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 158, 158, 158),
                          width: 1.0,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  CustomButton(text: "Login", onTapAction: signInAction),
                  const SizedBox(height: 20),
                  GestureDetector(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const SignUp()));
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Color.fromARGB(255, 211, 191, 11),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signInAction() async {
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
      FireBaseHelper()
          .signIn(emailController.text.toString(),
              passwordController.text.toString())
          .then((value) {
        if (value is User) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MainScreen()));
        } else if (value is String) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value)));
        }
      });
    }
  }
}
