import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glambook/user/user%20home.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'add to cart.dart';


void main() {
  runApp(const ViewProduct());
}

class ViewProduct extends StatelessWidget {
  const ViewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Reply',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ViewShopProductPage(title: 'View Reply'),
    );
  }
}

class ViewShopProductPage extends StatefulWidget {
  const ViewShopProductPage({super.key, required this.title});

  final String title;

  @override
  State<ViewShopProductPage> createState() => _ViewShopProductPageState();
}

class _ViewShopProductPageState extends State<ViewShopProductPage> {

  _ViewShopProductPageState(){
    ViewProduct();
  }

  List<String> id_ = <String>[];
  List<String> productname_= <String>[];
  List<String> price_= <String>[];
  List<String> photo_= <String>[];


  Future<void> ViewProduct() async {
    List<String> id = <String>[];
    List<String> productname = <String>[];
    List<String> price = <String>[];
    List<String> photo = <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String rid = sh.getString('rid').toString();
      String url = '$urls/user_viewproduct/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid,
        'rid':rid,

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        productname.add(arr[i]['productname']);
        price.add(arr[i]['price']);
        photo.add(sh.getString("img_url").toString()+arr[i]['photo']);
      }

      setState(() {
        id_ = id;
        productname_ = productname;
        price_ = price;
        photo_ = photo;
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
              MaterialPageRoute(builder: (context) => MyHomePage(title: '',)),);

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



                                  ElevatedButton(
                                    onPressed: () async {

                                      SharedPreferences sh = await SharedPreferences.getInstance();
                                      sh.setString("rid", id_[index].toString());


                                      Navigator.push(context, MaterialPageRoute(



                                        builder: (context) => AddToCart(title: ""),));
                                    },
                                    child: Text("Add to Cart"),
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
        //   // Navigator.push(
        //   //     context,
        //   //     MaterialPageRoute(builder: (context) => MySendComplaint()));
        //
        // },
        //   child: Icon(Icons.plus_one),
        // ),


      ),
    );
  }
}
