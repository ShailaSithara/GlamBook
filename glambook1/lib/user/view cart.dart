
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glambook/user/user%20home.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'add to cart.dart';
import 'newhome/Screens/user rental home.dart';


void main() {
  runApp(const ViewCart());
}

class ViewCart extends StatelessWidget {
  const ViewCart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Cart',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ViewCartPage(title: 'Cart'),
    );
  }
}

class ViewCartPage extends StatefulWidget {
  const ViewCartPage({super.key, required this.title});

  final String title;

  @override
  State<ViewCartPage> createState() => _ViewCartPageState();
}

class _ViewCartPageState extends State<ViewCartPage> {

  _ViewCartPageState(){
    ViewCart();
  }

  List<String> id_ = <String>[];
  List<String> productname_ = <String>[];
  List<String> price_= <String>[];
  List<String> photo_= <String>[];
  List<String> quantity_= <String>[];



  Future<void> ViewCart() async {
    List<String> id = <String>[];
    List<String> productname = <String>[];
    List<String> price = <String>[];
    List<String> photo = <String>[];
    List<String> quantity = <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String img_url = sh.getString('img_url').toString();
      String url = '$urls/user_view_cart/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid,

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        productname.add(arr[i]['productname']);
        price.add(arr[i]['price']);
        photo.add(img_url+arr[i]['photo']);
        quantity.add(arr[i]['quantity']);

      }

      setState(() {
        id_ = id;
        productname_ = productname;
        price_ = price;
        photo_ = photo;
        quantity_ = quantity;

      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }




  @override
  Widget build(BuildContext context) {



    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton( onPressed:() {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserRentalHome()),);

          },),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          // padding: EdgeInsets.all(5.0),
          // shrinkWrap: true,
          itemCount: id_.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onLongPress: () {
                print("long press" + index.toString());
              },
              title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        child:
                        Row(
                            children: [
                              Column(
                                children: [
                                  Image(image: NetworkImage(photo_[index]),height: 200,width: 200,),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(productname_[index]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(price_[index]),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text(photo_[index]),
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(quantity_[index]),
                                  ),

                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          SharedPreferences sh = await SharedPreferences.getInstance();
                                          String lid = sh.getString('lid').toString();
                                          String url = sh.getString('url').toString();

                                          final urls = Uri.parse('$url/user_delete_cart/');
                                          try {
                                            final response = await http.post(urls, body: {
                                              'cid':id_[index],
                                              'lid':lid,



                                            });
                                            if (response.statusCode == 200) {
                                              String status = jsonDecode(response.body)['status'];
                                              if (status=='ok') {

                                                ViewCart();
                                              }else {
                                                Fluttertoast.showToast(msg: 'Not Found');
                                              }
                                            }
                                            else {
                                              Fluttertoast.showToast(msg: 'Network Error');
                                            }
                                          }
                                          catch (e){
                                            Fluttertoast.showToast(msg: e.toString());
                                          }
                                        },
                                        child: Text("Delete"),
                                      ),
                                      SizedBox(width: 10,),

                                      ElevatedButton(
                                        onPressed: () async {
                                          SharedPreferences sh = await SharedPreferences.getInstance();
                                          String url = sh.getString('url').toString();
                                          String lid = sh.getString('lid').toString();

                                          final urls = Uri.parse('$url/user_booking_product/');
                                          try {
                                            final response = await http.post(urls, body: {
                                              'pid':id_[index],
                                              'lid':lid,



                                            });
                                            if (response.statusCode == 200) {
                                              String status = jsonDecode(response.body)['status'];
                                              if (status=='ok') {
                                                Fluttertoast.showToast(msg: 'booked successfully');

                                                ViewCart();
                                              }else {
                                                Fluttertoast.showToast(msg: 'Not Found');
                                              }
                                            }
                                            else {
                                              Fluttertoast.showToast(msg: 'Network Error');
                                            }
                                          }
                                          catch (e){
                                            Fluttertoast.showToast(msg: e.toString());
                                          }
                                        },
                                        child: Text("Book"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                            ]
                        ),

                        elevation: 8,
                        margin: EdgeInsets.all(10),
                      ),
                    ],
                  )),
            );
          },
        ),
        // floatingActionButton: FloatingActionButton(onPressed: () {
        //
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => MySendComplaint()));
        //
        // },
        //   child: Icon(Icons.plus_one),
        // ),


      ),
    );
  }
}
