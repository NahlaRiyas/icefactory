import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefactory/cart.dart';
import 'package:icefactory/global_variable.dart';
import 'package:icefactory/palette.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.borderColor,
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.start,
        // reverse: false,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.07,
            ),
            Stack(children: [
              Container(
                height: height * 0.38,
                width: width,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    // height: h*0.16,
                    enableInfiniteScroll: true,
                    initialPage: 0,
                    scrollDirection: Axis.horizontal,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlay: false,
                    aspectRatio: 0.5,
                    viewportFraction: 8,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      currentIndex = index;
                      setState(() {});
                      print(reason);
                      print("@@@@@@@@@@@2");
                    },
                  ),
                  itemCount: 3,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/WhatsApp Image 2024-03-28 at 10.31.png"))),
                    );
                  },
                ),
              ),
              Positioned(
                left: width * 0.055,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    "assets/images/arrow.svg",
                    height: width * 0.09,
                  ),
                ),
              ),
              Positioned(
                  right: width * 0.055,
                  child: SvgPicture.asset(
                    "assets/images/cart1.svg",
                    height: width * 0.09,
                  )),
              Positioned(
                  bottom: height * 0.02,
                  right: width * 0.055,
                  child: SvgPicture.asset(
                    "assets/images/love.svg",
                    height: width * 0.09,
                  ))
            ]),
            Container(
              height: height * 0.55,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(width * 0.1),
                      topLeft: Radius.circular(width * 0.1))),
              child: Padding(
                padding: EdgeInsets.only(
                    left: width * 0.06,
                    right: width * 0.06,
                    top: height * 0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.1,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Fresh Ice",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.055,
                                    color: Colors.black),
                              ),
                              Text(
                                "20 KG",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width * 0.035,
                                    color: Palette.greyColor),
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating: 1,
                                    minRating: 1,
                                    itemSize: height * 0.026,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 0.3),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Text(
                                    "(320 Review)",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width * 0.025,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: width * 0.25,
                                height: height * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(width * 0.09),
                                    color: Palette.borderColor),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "-",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width * 0.04,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "1",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width * 0.04,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "+",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width * 0.04,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Available in stock",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.032,
                                    color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.035,
                    ),
                    Text(
                      "Description",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.055,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Text(
                      "Experience the crisp freshness of our premium ice pack, freshly made at our advanced ice factory. Each cube is crafted from the purest water, ensuring your drinks and coolers are enhanced with crystal-clear quality. Designed for versatility, our ice is perfect for gatherings, events, or everyday refreshment. Elevate your cooling experience with our pure and fresh ice",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.033,
                          color: Palette.greyColor),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: height * 0.08,
        width: width,
        // color: Colors.red,
        child: Padding(
          padding: EdgeInsets.only(
              left: width * 0.06, right: width * 0.06, bottom: height * 0.013),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width * 0.38,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: GoogleFonts.poppins(
                          color: Palette.greyColor,
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.035),
                    ),
                    Text(
                      "20 AED",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: width * 0.045),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => CartScreen(),
                      ));
                },
                child: Container(
                  height: height * 0.07,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.08),
                      color: Colors.black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/cartIcon.svg"),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Text(
                        "Add to cart",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.04,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
