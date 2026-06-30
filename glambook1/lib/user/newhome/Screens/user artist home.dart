import 'dart:convert';
import 'package:glambook/user/new_nearest_artist.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:glambook/user/newhome/Models/bigcontainermodel.dart';
import 'package:glambook/user/newhome/Models/smallcontainermodel.dart';
import 'package:glambook/user/newhome/Screens/detailscreen.dart';
import 'package:glambook/user/newhome/Utilities/colors.dart';
import 'package:glambook/user/newhome/Utilities/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../add to cart.dart';
import '../../all services.dart';
import '../../artist view payment.dart';
import '../../book service.dart';
import '../../booking.dart';
import '../../rental view payment.dart';
import '../../view cart.dart';
import '../../view nearest artist.dart';
import '../../view nearest shop.dart';
import '../../view reply.dart';
import '../../view services.dart';

class UserArtistHome extends StatefulWidget {
  const UserArtistHome({super.key});

  @override
  State<UserArtistHome> createState() => _UserArtistHomeState();
}

class _UserArtistHomeState extends State<UserArtistHome> {
  _UserArtistHomeState(){
    // ViewProduct("");
    ViewService("");
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: backgroundclr,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // children: [
                  //   Container(
                  //     height: screenSize.height * 0.065,
                  //     width: screenSize.width * 0.115,
                  //     decoration: BoxDecoration(
                  //         color: lbackgroundclr,
                  //         borderRadius: BorderRadius.circular(15)),
                  //     child: const Icon(
                  //       Icons.sort_rounded,
                  //       color: whiteclr,
                  //     ),
                  //   ),
                  //   Column(
                  //     children: [
                  //       const Text(
                  //         "Rental",
                  //         style: TextStyle(
                  //             color: whiteclr,
                  //             fontSize: 28,
                  //             fontWeight: FontWeight.w500),
                  //       ),
                  //       SizedBox(
                  //         height: screenSize.height * 0.002,
                  //       ),
                  //       // const Text(
                  //       //   "02-075 Konstructorska 9",
                  //       //   style: TextStyle(
                  //       //     color: primaryclr,
                  //       //     fontSize: 15,
                  //       //   ),
                  //       // ),
                  //     ],
                  //   ),
                  //   // Container(
                  //   //   height: screenSize.height * 0.065,
                  //   //   width: screenSize.width * 0.115,
                  //   //   decoration: BoxDecoration(
                  //   //       image: const DecorationImage(
                  //   //           fit: BoxFit.cover,
                  //   //           image: NetworkImage(
                  //   //               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz-LJaTp0HFRT2GHznf3n7iSAzu-z7och7Vc0GsJkTHWEk67OjQ0t0o6piSTpTv9sr7UI&usqp=CAU")),
                  //   //       color: lbackgroundclr,
                  //   //       borderRadius: BorderRadius.circular(15)),
                  //   // ),
                  // ],
                ),
                SizedBox(
                  height: screenSize.height * 0.025,
                ),
                const Text(
                  "What would you like to service",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: whiteclr,
                    fontSize: 19,
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.027,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.065,
                      width: screenSize.width * 0.785,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            ViewService(value.toString());
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: "Find your choice...",
                          hintStyle: const TextStyle(color: Colors.grey),
                          fillColor: lbackgroundclr,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: screenSize.height * 0.065,
                      width: screenSize.width * 0.115,
                      decoration: BoxDecoration(
                        color: lbackgroundclr,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.tune,
                        color: whiteclr,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.027,
                ),
                SizedBox(
                  height: screenSize.height * 0.185,
                  child:
                  ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: (() {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNearestArtistPage(title: '',),));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LocationFetchScreen(),));

                          }),
                          child: Container(
                            width: screenSize.width * 0.22,
                            decoration: BoxDecoration(
                              color: lbackgroundclr,
                              borderRadius: BorderRadius.circular(55),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: screenSize.height * 0.1,
                                    width: screenSize.width * 0.2,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage("assets/makeup.jpeg")),
                                        shape: BoxShape.circle),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.015,
                                  ),
                                  Text(
                                    "Nearest Artist",
                                    style: const TextStyle(color: whiteclr),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: (() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AllServicesPage(title: '',),));




                          }),
                          child: Container(
                            width: screenSize.width * 0.22,
                            decoration: BoxDecoration(
                              color: lbackgroundclr,
                              borderRadius: BorderRadius.circular(55),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: screenSize.height * 0.1,
                                    width: screenSize.width * 0.2,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage("assets/cart.jpg")),
                                        shape: BoxShape.circle),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.015,
                                  ),
                                  Text(
                                    "Services",
                                    style: const TextStyle(color: whiteclr),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: (() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceBookingPage(title: '',),));




                          }),
                          child: Container(
                            width: screenSize.width * 0.22,
                            decoration: BoxDecoration(
                              color: lbackgroundclr,
                              borderRadius: BorderRadius.circular(55),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: screenSize.height * 0.1,
                                    width: screenSize.width * 0.2,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage("assets/bk.jpeg")),
                                        shape: BoxShape.circle),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.015,
                                  ),
                                  Text(
                                    "Booking",
                                    style: const TextStyle(color: whiteclr),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: (() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ViewArtistPaymentPage(title: '',),));




                          }),
                          child: Container(
                            width: screenSize.width * 0.22,
                            decoration: BoxDecoration(
                              color: lbackgroundclr,
                              borderRadius: BorderRadius.circular(55),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: screenSize.height * 0.1,
                                    width: screenSize.width * 0.2,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage("assets/pay.png")),
                                        shape: BoxShape.circle),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.015,
                                  ),
                                  Text(
                                    "Payment",
                                    style: const TextStyle(color: whiteclr),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: (() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ViewReplyPage(title: '',),));



                          }),
                          child: Container(
                            width: screenSize.width * 0.22,
                            decoration: BoxDecoration(
                              color: lbackgroundclr,
                              borderRadius: BorderRadius.circular(55),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: screenSize.height * 0.1,
                                    width: screenSize.width * 0.2,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage("assets/comp.jpeg")),
                                        shape: BoxShape.circle),
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.015,
                                  ),
                                  Text(
                                    "Complaint",
                                    style: const TextStyle(color: whiteclr),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )

                    ],

                  ),

                ),
                SizedBox(
                  height: screenSize.height * 0.015,
                ),
                // const Text(
                //   "Fastest delivery",
                //   style: TextStyle(
                //     fontWeight: FontWeight.w500,
                //     color: whiteclr,
                //     fontSize: 21,
                //   ),
                // ),
                SizedBox(
                  height: screenSize.height * 0.020,
                ),
                SizedBox(
                  height: screenSize.height * 0.357,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: id_.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: (() {

                              }),
                              child: Container(
                                width: screenSize.width * 0.65,
                                decoration: BoxDecoration(
                                  color: lbackgroundclr,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: screenSize.height * 0.2125,
                                      width: screenSize.width * 0.60,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                          NetworkImage(photo_[index]),
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                service_[index],
                                                style: const TextStyle(
                                                    color: whiteclr,
                                                    fontSize: 17,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.alarm,
                                                    size: 16,
                                                    color: Color(
                                                      0xff513330,
                                                    ),
                                                  ),
                                                  // Text(
                                                  //   BigCon[0].time,
                                                  //   style: const TextStyle(
                                                  //       fontSize: 15,
                                                  //       color: whiteclr),
                                                  // ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenSize.height * 0.005,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.currency_bitcoin,
                                                color: Color(0xffFCD506),
                                                size: 16,
                                              ),
                                              Text(
                                                price_[index],
                                                style: const TextStyle(
                                                    fontSize: 14.5,
                                                    color: whiteclr),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenSize.height * 0.009,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                    color: const Color(
                                                        0xff40404B)),
                                                height:
                                                screenSize.height * 0.045,
                                                width: screenSize.width * 0.2,
                                                child: Center(
                                                  child: TextButton(
                                                    onPressed: () async {
                                                      SharedPreferences sh = await SharedPreferences.getInstance();
                                                      sh.setString("rid", id_[index].toString());


                                                      Navigator.push(context, MaterialPageRoute(



                                                        builder: (context) => ServiceBookingPage(title: ""),));
                                                    },
                                                    child: Text(
                                                      "Book",
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          color: whiteclr),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: screenSize.width * 0.025,
                                              ),
                                              // Container(
                                              //   decoration: BoxDecoration(
                                              //       borderRadius:
                                              //       BorderRadius.circular(
                                              //           12),
                                              //       color: const Color(
                                              //           0xff40404B)),
                                              //   height:
                                              //   screenSize.height * 0.045,
                                              //   width: screenSize.width * 0.2,
                                              //   child: const Center(
                                              //     child: Text(
                                              //       "Chicken",
                                              //       style: TextStyle(
                                              //           fontWeight:
                                              //           FontWeight.w500,
                                              //           color: whiteclr),
                                              //     ),
                                              //   ),
                                              // ),
                                              SizedBox(
                                                width: screenSize.width * 0.025,
                                              ),
                                              // Container(
                                              //   decoration: BoxDecoration(
                                              //       borderRadius:
                                              //       BorderRadius.circular(
                                              //           12),
                                              //       color: const Color(
                                              //           0xff40404B)),
                                              //   height:
                                              //   screenSize.height * 0.045,
                                              //   width: screenSize.width * 0.12,
                                              //   child: const Center(
                                              //     child: Text(
                                              //       "Fries",
                                              //       style: TextStyle(
                                              //           fontWeight:
                                              //           FontWeight.w500,
                                              //           color: whiteclr),
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 0,
                              child: Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.favorite_rounded,
                                    size: 25,
                                    color: whiteclr,
                                  )),
                            )
                          ],
                        ),
                      );

                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  List<String> id_ = <String>[];
  List<String> service_ = <String>[];
  List<String> price_= <String>[];
  List<String> name_= <String>[];
  List<String> photo_= <String>[];


  Future<void> ViewService(value) async {
    List<String> id = <String>[];
    List<String> service = <String>[];
    List<String> price = <String>[];
    List<String> name = <String>[];
    List<String> photo = <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String aid = sh.getString('aid').toString();
      String url = '$urls/user_view_service_home/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid,
        'aid':aid,
        'value':value,

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        service.add(arr[i]['service'].toString());
        price.add(arr[i]['price'].toString());
        name.add(arr[i]['name'].toString());
        photo.add(sh.getString("img_url").toString()+arr[i]['photo']);

      }

      setState(() {
        id_ = id;
        service_ = service;
        price_ = price;
        name_ = name;
        photo_ = photo;

      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }
}
