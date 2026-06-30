import 'package:flutter/material.dart';
import 'package:glambook/user/user%20home.dart';
import 'package:glambook/user/view%20cart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'edit profile.dart';
import 'newhome/Screens/user rental home.dart';

void main() {
  runApp(const AddCart());
}

class AddCart extends StatelessWidget {
  const AddCart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' add to cart',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const AddToCart(title: 'add to cart'),
    );
  }
}

class AddToCart extends StatefulWidget {
  const AddToCart({super.key, required this.title});

  final String title;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  _AddToCartState() {
    _send_data();
  }

  TextEditingController qntController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leadingWidth: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: 20.0,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  splashRadius: 1.0,
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.green,
                    size: 24.0,
                  ),
                ),
              ),
              Text(
                'Cart',
                style: GoogleFonts.poppins(
                  color: Colors.green,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 40.0,
                child: IconButton(
                  onPressed: () {},
                  splashRadius: 1.0,
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 34.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // CircleAvatar(
              //   radius: 50,
              // ),
              Column(
                children: [
                  // Image(
                  //   image: NetworkImage(photo_),
                  //   height: 150,
                  //   width: 150,
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.all(5),
                  //   child: Text(name_),
                  // ),
                  //
                  // // Padding(
                  // //   padding: EdgeInsets.all(5),
                  // //   child: Text(gender_),
                  // // ),
                  // Padding(
                  //   padding: EdgeInsets.all(5),
                  //   child: Text(price_),
                  // ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                        controller: qntController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: Text("Quantity"))),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.all(5),
                  //   child: Text(place_),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.all(5),
                  //   child: Text(pin_),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.all(5),
                  //   child: Text(email_),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.all(5),
                  //   child: Text(phonenumber_),
                  // ),
                  ElevatedButton(
                    onPressed: () async {
                      String password = qntController.text;

                      SharedPreferences sh =
                          await SharedPreferences.getInstance();
                      String url = sh.getString('url').toString();
                      String lid = sh.getString('lid').toString();
                      String pid = sh.getString('rid').toString();

                      final urls = Uri.parse('$url/user_addto_cart/');
                      try {
                        final response = await http.post(urls, body: {
                          'quantity': password,
                          'pid': pid,
                          'lid':lid,
                        });
                        if (response.statusCode == 200) {
                          String status = jsonDecode(response.body)['status'];
                          if (status == 'ok') {
                            Fluttertoast.showToast(msg: "Added successfully");

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ViewCartPage(title: '',),
                                ));


                          } else {
                            Fluttertoast.showToast(msg: 'Not Found');
                          }
                        } else {
                          Fluttertoast.showToast(msg: 'Network Error');
                        }
                      } catch (e) {
                        Fluttertoast.showToast(msg: e.toString());
                      }
                    },
                    style:
                        ElevatedButton.styleFrom(alignment: Alignment.center),
                    child: Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String id_ = "";
  String name_ = "";
  String photo_ = "";
  String price_ = "";

  void _send_data() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();
    String pid = sh.getString('pid').toString();
    String imgurl = sh.getString("img_url").toString();

    final urls = Uri.parse('$url/user_addto_cart/');
    try {
      final response = await http.post(urls, body: {'pid': pid,'lid':lid,});
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status == 'ok') {
          String id = jsonDecode(response.body)['id'].toString();
          String name = jsonDecode(response.body)['name'];
          String photo = imgurl + jsonDecode(response.body)['photo'].toString();
          String price = jsonDecode(response.body)['price'].toString();

          setState(() {
            id_ = id;
            name_ = name;
            photo_ = photo;
            price_ = price;
          });
        } else {
          Fluttertoast.showToast(msg: 'Not Found');
        }
      } else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
