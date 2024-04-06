import 'package:amrpfe/apis/user_controller.dart';
import 'package:amrpfe/models/userdata.dart';
import 'package:amrpfe/screens/login.dart';
import 'package:amrpfe/screens/verify_otp.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController passworEditingController = TextEditingController();
  TextEditingController confirmPassworEditingController =
      TextEditingController();
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isCheckboxSelected = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  "Create Account",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // first name
                TextField(
                  controller: firstNameEditingController,
                  decoration: InputDecoration(
                    hintText: 'first name',
                    // color: Colors.grey[800],
                    prefixIcon: Icon(
                      Icons.person_2_outlined,
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
                  // obscureText: !_isPasswordVisible,
                ),
                SizedBox(
                  height: 20,
                ),
                // last name
                TextField(
                  controller: lastNameEditingController,
                  decoration: InputDecoration(
                    hintText: 'last name',
                    // color: Colors.grey[800],
                    prefixIcon: Icon(
                      Icons.person_2_outlined,
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
                  // obscureText: !_isPasswordVisible,
                ),
                SizedBox(
                  height: 20,
                ),
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
                // email address
                TextField(
                  controller: emailEditingController,
                  decoration: InputDecoration(
                    hintText: 'email address',
                    // color: Colors.grey[800],
                    prefixIcon: Icon(
                      Icons.email_outlined,
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
                  keyboardType: TextInputType.emailAddress,
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
                // confirm password
                TextField(
                  controller: confirmPassworEditingController,
                  decoration: InputDecoration(
                    hintText: 'confirm password',
                    // color: Colors.grey[800],
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.green,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                      child: !_isConfirmPasswordVisible
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
                  obscureText: !_isConfirmPasswordVisible,
                ),
                Row(
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
                    Text("I agree terms and conditions")
                  ],
                ),
                // SizedBox(
                //   height: 50,
                // ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!_isCheckboxSelected) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "You didn't mark our terms and conditions",
                            ),
                          ),
                        );
                      } else {
                        if (passworEditingController.text !=
                            confirmPassworEditingController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Password mismatch",
                              ),
                            ),
                          );
                        } else {
                          setState(() {
                            _isLoading = true;
                          });
                          print(firstNameEditingController.text);
                          print(lastNameEditingController.text);
                          print(phoneEditingController.text);
                          print(passworEditingController.text);
                          print(confirmPassworEditingController.text);
                          final response = await Api().signup(
                              UserData(
                                  first_name: firstNameEditingController.text,
                                  last_name: lastNameEditingController.text,
                                  email: emailEditingController.text,
                                  password: passworEditingController.text,
                                  phone: phoneEditingController.text),
                              context);
                          setState(() {
                            _isLoading = false;
                          });
                          if (response == 201) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return VerifyOtpScreen(
                                  phone: phoneEditingController.text,
                                );
                              },
                            ));
                          } else {
                            print(response);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(response.toString())));
                          }
                        }
                      }
                    },
                    child: _isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text("Register"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Text("Already have an account?"),

                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ));
                  },
                  child: Text(
                    "Login",
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
    );
  }
}
