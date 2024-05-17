import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icefactory/palette.dart';
import 'global_variable.dart';
import 'package:badges/badges.dart' as badges;

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List items = [
    {
      "image": "assets/images/WhatsApp Image 2024-03-28 at 10.31.png",
      "text1": "Fresh Ice",
      "text2": "20kg",
      "text3": "AED20.00"
    },
    {
      "image": "assets/images/WhatsApp Image 2024-03-28 at 10.31.png",
      "text1": "Fresh Ice",
      "text2": "30kg",
      "text3": "AED30.00"
    },
    {
      "image": "assets/images/WhatsApp Image 2024-03-28 at 10.31.png",
      "text1": "Fresh Ice",
      "text2": "40kg",
      "text3": "AED40.00"
    },
  ];

  List<Key> keys = [];

  // List<String> items = ["20kg", "30kg", "40kg"];

  TextEditingController _promocode = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    keys = List.generate(items.length, (index) => Key('${items[index]}'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: height * 0.09,
            leadingWidth: width * 0.15,
            leading: Padding(
              padding: EdgeInsets.only(left: width * 0.055),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset("assets/images/arrow.svg")),
            ),
            actions: [
              badges.Badge(
                position: badges.BadgePosition.topEnd(
                  top: height * 0.003,
                  end: width * 0.04,
                ),
                showBadge: true,
                badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle, badgeColor: Colors.black),
                badgeContent: Text(
                  '3',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: width * 0.036,
                      fontWeight: FontWeight.w500),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: width * 0.055),
                  child: Container(
                      height: height * 0.08,
                      width: width * 0.1,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(1, 3),
                              spreadRadius: 1,
                              blurRadius: 4,
                            ),
                          ]),
                      child: Center(
                          child: SvgPicture.asset(
                        "assets/images/cartIcon.svg",
                        color: Colors.black,
                      ))),
                ),
              )
            ]),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(right: width * 0.055, left: width * 0.055),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  "My Cart",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: width * 0.05),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      dragStartBehavior: DragStartBehavior.start,
                      key: keys[index],
                      direction: DismissDirection.endToStart,
                      // behavior: HitTestBehavior.opaque,
                      onDismissed: (direction) {
                        // Handle dismissal actions here
                        setState(() {
                          items.removeAt(index);
                        });
                        keys.removeAt(index);
                      },
                      background: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.04),
                            color: Colors.black),
                        child: Padding(
                          padding: EdgeInsets.only(right: width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: height * 0.04,
                              ),
                            ],
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: height * 0.02),
                        child: Container(
                          height: height * 0.12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * 0.04),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    offset: Offset(4, 6),
                                    blurRadius: 8,
                                    spreadRadius: 1),
                              ]),
                          child: Padding(
                            padding: EdgeInsets.all(width * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: height * 0.1,
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(width * 0.04),
                                      color: Palette.borderColor),
                                  child: Center(
                                    child: Image(
                                      image: AssetImage(items[index]["image"]),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                Container(
                                  width: width * 0.42,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height * 0.07,
                                        child: Column(
                                          children: [
                                            Text(
                                              items[index]["text1"],
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: width * 0.04,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              items[index]["text2"],
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: width * 0.028,
                                                  color: Palette.greyColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        items[index]["text3"],
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                            fontSize: width * 0.04,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: width * 0.2,
                                      height: height * 0.04,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              width * 0.09),
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  height: height * 0.075,

                  // width: width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.025),
                    color: Palette.borderColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.03, right: width * 0.03),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            // autofocus: true,
                            style: GoogleFonts.urbanist(
                                color: Colors.black, fontSize: width * 0.04),
                            controller: _promocode,

                            decoration: InputDecoration(
                                hintText: "promo code",
                                hintStyle: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.035,
                                  color: Palette.greyTextColor,
                                ),
                                filled: true,
                                fillColor: Colors.transparent,
                                // enabled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      width * 0.038,
                                    ),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(width * 0.038),
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                        Container(
                          height: height * 0.053,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * 0.02),
                              color: Colors.black),
                          child: Center(
                            child: Text(
                              "Apply",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: Container(
          height: height * 0.18,
          width: width * 0.9,
          // color: Colors.red,
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total (3 item) :",
                      style: GoogleFonts.poppins(
                          fontSize: width * 0.04,
                          color: Palette.greyColor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Text(
                      "60 AED ",
                      style: GoogleFonts.poppins(
                          fontSize: width * 0.045,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  height: height * 0.08,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.025),
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.04, right: width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Proceed to Checkout",
                          style: GoogleFonts.poppins(
                              fontSize: width * 0.035,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        SvgPicture.asset(
                          "assets/images/arrow1.svg",
                          height: height * 0.05,
                        )
                      ],
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

// Dismissible(
// key: Key(item), // Unique key for each item
// onDismissed: (direction) {
// // Handle dismissal actions here
// setState(() {
// items.removeAt(index);
// });
// },
// background: Container(
// color: Colors.red, // Background color when swiping
// child: Icon(Icons.delete, color: Colors.white),
// alignment: Alignment.centerRight,
// padding: EdgeInsets.only(right: 20.0),
// ),
// child: ListTile(
// title: Text(item),
// ),
// );
