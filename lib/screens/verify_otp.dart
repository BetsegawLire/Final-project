import 'package:amrpfe/apis/user_controller.dart';
import 'package:amrpfe/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyOtpScreen extends StatelessWidget {
  final String phone;
  const VerifyOtpScreen({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter OTP",
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            OtpTextField(
              numberOfFields: 4,
              // borderColor: Colors.green,
              cursorColor: Colors.green,
              // enabledBorderColor: Colors.green,
              focusedBorderColor: Colors.green,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) async {
                final response =
                    await Api().verifyOtp(phone, verificationCode, context);
                if (response == 200) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("success"),
                          content: Text('successfully verified'),
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
                          title: Text("Verification failed"),
                          content: Text('Code entered is not valid'),
                        );
                      });
                }
              }, // end onSubmit
            ),
          ],
        ),
      )),
    );
  }
}
