import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefactory/forgot_password.dart';
import 'package:icefactory/signup_screen.dart';
import 'package:icefactory/navbar.dart';
import 'package:icefactory/palette.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'global_variable.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool password = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.055, right: width * 0.055),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: width * 0.07,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: height * 0.09,
              ),
              Text(
                "Enter your mobile number",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.04,
                    color: Colors.black),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                width: width,
                height: height * 0.075,
                child: IntlPhoneField(
                  controller: phoneController,
                  cursorWidth: width * 0.003,
                  cursorColor: Palette.greyTextColor,
                  cursorHeight: height * 0.015,
                  autovalidateMode: AutovalidateMode.disabled,
                  keyboardType: TextInputType.number,
                  pickerDialogStyle: PickerDialogStyle(
                    countryCodeStyle: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.032,
                    ),
                  ),
                  initialCountryCode: '+91',
                  showCountryFlag: false,
                  flagsButtonPadding:
                      EdgeInsets.only(top: height * 0.007, left: width * 0.03),
                  style: GoogleFonts.urbanist(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.037,
                  ),
                  dropdownIconPosition: IconPosition.trailing,
                  dropdownIcon: Icon(Icons.keyboard_arrow_down_outlined,
                      size: width * 0.05, color: Colors.black),
                  dropdownTextStyle: GoogleFonts.urbanist(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.038,
                  ),
                  decoration: InputDecoration(
                    // fillColor: Palette.textFormColor,
                    // filled: true,
                    counter: const Offstage(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * 0.04),
                      borderSide: BorderSide(color: Palette.dividerColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * 0.04),
                      borderSide: BorderSide(color: Palette.dividerColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "Enter your password",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.04,
                    color: Colors.black),
              ),
              SizedBox(
                height: height * 0.028,
              ),
              Center(
                child: SizedBox(
                  width: width,
                  height: height * 0.065,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    obscuringCharacter: '*',
                    style: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.038,
                    ),
                    decoration: InputDecoration(
                      // fillColor: Palette.textFormColor,
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(
                            top: width * 0.04,
                            right: width * 0.009,
                            bottom: width * 0.04),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                password = !password;
                              });
                            },
                            child: password == false
                                ? SvgPicture.asset(
                                    "assets/images/Hide.svg",
                                    height: width * 0.06,
                                  )
                                : SvgPicture.asset(
                                    "assets/images/eyeOpn.svg",
                                    height: width * 0.06,
                                  )),
                      ),

                      hintText: '******',
                      hintStyle: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        color: Palette.textColor,
                        fontSize: width * 0.038,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width * 0.04),
                        borderSide: BorderSide(color: Palette.dividerColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.04),
                          borderSide: BorderSide(color: Palette.dividerColor)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ForgotPassword(),
                          ));
                    },
                    child: Text(
                      "forget password ?",
                      style: GoogleFonts.urbanist(
                          color: Colors.black,
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: width * 0.04,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => NavigationBarScreen(),
                      ));
                },
                child: Container(
                  height: height * 0.065,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.04),
                      color: Colors.black),
                  child: Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: width * 0.05,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.04,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => SignupScreen(),
                      ));
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: "Don't have an account ?",
                        style: GoogleFonts.urbanist(
                            color: Palette.textColor1,
                            fontWeight: FontWeight.w500,
                            fontSize: width * 0.035),
                        children: [
                          TextSpan(
                              text: " Sign up",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))
                        ]),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.04,
              ),
              Center(
                child: Text(
                  "or",
                  style: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                height: height * 0.065,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.04),
                    border: Border.all(color: Palette.dividerColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/google.svg",
                      height: height * 0.025,
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(
                      "Continue with google",
                      style: GoogleFonts.urbanist(
                          color: Colors.black,
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: width * 0.04,
              ),
              Container(
                height: height * 0.065,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.04),
                    border: Border.all(color: Palette.dividerColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/apple.svg",
                      height: height * 0.025,
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(
                      "Continue with google",
                      style: GoogleFonts.urbanist(
                          color: Colors.black,
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
