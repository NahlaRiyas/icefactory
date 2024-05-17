import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefactory/palette.dart';
import 'package:pinput/pinput.dart';
import 'global_variable.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  late String submittedOtp;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      "Verify",
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
                  "assets/images/cuate.svg",
                  height: height * 0.29,
                )),
                SizedBox(
                  height: height * 0.052,
                ),
                Text(
                  "Enter OTP",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: width * 0.06,
                      color: Colors.black),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  "An 4 digit OTP has been sent to",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.035,
                      color: Color(0xff696969)),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  "8567896712",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.045,
                      color: Colors.black),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                    height: height * 0.1,
                    width: width * 1,
                    color: Colors.transparent,
                    child: Pinput(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      controller: otpController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      // obscureText: true,
                      length: 4,
                      defaultPinTheme: PinTheme(
                          textStyle: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.045),
                          height: width * 0.15,
                          width: width * 0.16,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Palette.dividerColor))),
                      onChanged: (val) {
                        submittedOtp = val;
                        setState(() {});
                      },
                      // controller: ,
                    )),
                SizedBox(height: height * 0.04),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: height * 0.065,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.04),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text(
                          "verify",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.038,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                  child: Text(
                    'Resend OTP ',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.035,
                      color: Colors.black,
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
