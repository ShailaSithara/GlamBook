
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'artist home.dart';
import 'newhome/Screens/homescreen.dart';


void main() {
  runApp(const ViewPayment());
}

class ViewPayment extends StatelessWidget {
  const ViewPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Reply',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ViewPaymentPage(title: 'View Reply'),
    );
  }
}

class ViewPaymentPage extends StatefulWidget {
  const ViewPaymentPage({super.key, required this.title});

  final String title;

  @override
  State<ViewPaymentPage> createState() => _ViewPaymentPageState();
}

class _ViewPaymentPageState extends State<ViewPaymentPage> {

  _ViewPaymentPageState(){
    ViewPayment();
  }

  List<String> id_ = <String>[];
  List<String> transactionid_ = <String>[];
  List<String> bookingid_ = <String>[];
  List<String> amount_= <String>[];
  List<String> date_= <String>[];


  Future<void> ViewPayment() async {
    List<String> id = <String>[];
    List<String> transactionid = <String>[];
    List<String> bookingid = <String>[];
    List<String> amount = <String>[];
    List<String> date = <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      // String aid = sh.getString('aid').toString();
      String url = '$urls/artist_view_payment/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid
        // 'aid':aid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        transactionid.add(arr[i]['transactionid'].toString());
        bookingid.add(arr[i]['bookingid'].toString());
        amount.add(arr[i]['amount'].toString());
        date.add(arr[i]['date'].toString());

      }

      setState(() {
        id_ = id;
        // status_ = status;
        transactionid_ = transactionid;
        bookingid_ = bookingid;
        amount_ = amount;
        date_ = date;

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
              MaterialPageRoute(builder: (context) => ArtistNewHome()),);

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
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text(status_[index]),
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(transactionid_[index]),
                                  ),    Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(bookingid_[index]),
                                  ),  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(amount_[index]),
                                  ),  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(date_[index]),
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
