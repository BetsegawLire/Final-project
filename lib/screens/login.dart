import 'package:amrpfe/apis/user_controller.dart';
import 'package:amrpfe/screens/home.dart';
import 'package:amrpfe/screens/sign_up.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passworEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isCheckboxSelected = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              // vertical: 100,
              horizontal: 50,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),

                  Image.asset("assets/tractor.PNG"),

                  // phone
                  TextField(
                    controller: phoneEditingController,
                    decoration: InputDecoration(
                      hintText: 'phone',
                      // color: Colors.grey[800],
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        color: Colors.green,
                      ),

                      hintStyle: TextStyle(color: Colors.grey[700]),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[700]!, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[500]!, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        // vertical: 15,
                        horizontal: 20,
                      ),
                    ),
                    style: TextStyle(
                      // color: Colors.white,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    cursorColor: Colors.grey[500],
                    keyboardType: TextInputType.phone,
                    // obscureText: !_isPasswordVisible,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // password
                  TextField(
                    controller: passworEditingController,
                    decoration: InputDecoration(
                      hintText: 'password',
                      // color: Colors.grey[800],
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.green,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: !_isPasswordVisible
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.grey[800],
                              )
                            : Icon(
                                Icons.visibility,
                                color: Colors.grey[800],
                              ),
                      ),
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[700]!, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[500]!, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        // vertical: 15,
                        horizontal: 20,
                      ),
                    ),
                    style: TextStyle(
                      // color: Colors.white,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    cursorColor: Colors.grey[500],
                    obscureText: !_isPasswordVisible,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _isCheckboxSelected,
                          onChanged: (value) {
                            setState(() {
                              _isCheckboxSelected = !_isCheckboxSelected;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Remeber me")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forgot password?"),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 50,
                  // ),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        print(phoneEditingController.text);
                        print(passworEditingController.text);
                        final response = await Api().login(
                            phoneEditingController.text,
                            passworEditingController.text,
                            context);
                        setState(() {
                          _isLoading = false;
                        });
                        if (response == 200) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("login success"),
                                  content:
                                      Text('you\'ve logged in successfully'),
                                );
                              });
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return MainScreen();
                            },
                          ));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("login failed"),
                                  content: Text(
                                      'you\'ve not logged in successfully'),
                                );
                              });
                        }
                      },
                      child: _isLoading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              "Login",
                            ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Text("Don't have an account?"),

                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ));
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
