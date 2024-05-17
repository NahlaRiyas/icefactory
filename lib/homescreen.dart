import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefactory/global_variable.dart';
import 'package:icefactory/palette.dart';
import 'package:icefactory/product%20details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              pinned: false,
              floating: true,
              // snap: true,
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              leadingWidth: width * 0.13,
              toolbarHeight: height * 0.085,
              leading: Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: SvgPicture.asset("assets/images/menu.svg"),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: width * 0.04),
                  child: CircleAvatar(
                      radius: width * 0.06,
                      backgroundColor: Palette.borderColor,
                      child: Image(
                        image: AssetImage("assets/images/Rectangle 97.png"),
                      )),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size(width, height * 0.23),
                child: Padding(
                  padding:
                      EdgeInsets.only(right: width * 0.05, left: width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome To Fresh Ice,",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: width * 0.06,
                            color: Colors.black),
                      ),
                      Text(
                        "Mr.Test User",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.05,
                            color: Palette.greyColor),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.7,
                            height: height * 0.05,
                            child: TextFormField(
                              controller: _search,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: width * 0.04),
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(width * 0.04),
                                    child: SvgPicture.asset(
                                        "assets/images/Group 97.svg"),
                                  ),
                                  hintText: "Search...",
                                  hintStyle: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: Palette.greyColor.withOpacity(0.4),
                                      fontSize: width * 0.035),
                                  fillColor: Palette.borderColor,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(width * 0.65)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(width * 0.65))),
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/images/filtter.svg",
                            height: height * 0.05,
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.05, right: width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Our Products",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: width * 0.04,
                                  color: Colors.black),
                            ),
                            Text(
                              "View All",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.03,
                                  color: Palette.greyColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: width * 0.07,
                  crossAxisSpacing: width * 0.02,
                  childAspectRatio: 7 / 9),
              delegate:
                  SliverChildBuilderDelegate(childCount: 8, (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => ProductDetails(),
                        ));
                  },
                  child: Container(
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: height * 0.2,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * 0.05),
                              color: Palette.borderColor),
                          child: Center(
                            child: Image(
                              image: AssetImage(
                                  "assets/images/WhatsApp Image 2024-03-28 at 10.31.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          "Fresh Ice",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.043,
                              color: Colors.black),
                        ),
                        Text(
                          "10KG",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.03,
                              color: Palette.greyColor),
                        ),
                        Text(
                          "AED 20.00",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.043,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
