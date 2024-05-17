import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefactory/palette.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'global_variable.dart';
import 'otp_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                            "assets/images/Expand_left_light.svg")),
                    SizedBox(width: width * 0.3),
                    Text(
                      "Forgot",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: width * 0.07,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Center(
                    child: SvgPicture.asset(
                  "assets/images/forgot.svg",
                  height: height * 0.3,
                )),
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.055,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "Don’t worry! it happens. Please enter phone number associated with your account",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.035,
                      color: Color(0xff696969)),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  "Enter your mobile number",
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.045,
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
                    flagsButtonPadding: EdgeInsets.only(
                        top: height * 0.007, left: width * 0.03),
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
                  height: height * 0.05,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => OtpScreen(),
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
                        "Get otp",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: width * 0.05,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
