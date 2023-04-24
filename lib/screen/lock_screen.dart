import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'UI.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  String infor = '';
  final pinController = TextEditingController();
  bool isPasswordVisible = true;
  final FocusNode node1 = FocusNode();

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: const Text(
                          'My keep it',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 10),
                        margin: EdgeInsets.all(20),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        margin: EdgeInsets.only(top: 10, left: 30, right: 30),
                        padding: EdgeInsets.all(15),
                        child: Form(
                          child: Column(
                            children: [
                              TextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                focusNode: node1,
                                onChanged: (value) {
                                  infor = value;
                                },
                                obscureText: isPasswordVisible,
                                obscuringCharacter: '*',
                                textAlign: TextAlign.center,
                                maxLength: 6,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    // errorText: 'Password is wrong',
                                    counterText: '',
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: isPasswordVisible
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility),
                                      onPressed: () {
                                        setState(() {
                                          isPasswordVisible =
                                              !isPasswordVisible;
                                        });
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (infor.isEmpty) {
                                    FocusScope.of(context).requestFocus(node1);
                                  } else if (infor.length == 6) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UI(),
                                        ));
                                  }
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'If you forgot or fist use this this app\nPlease press',
                                    textAlign: TextAlign.center,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Sign up',
                                        style: TextStyle(fontSize: 15),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
