
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glambook/artist/reject%20user.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../artist/artist home.dart';

// import '../main.dart';
// import 'approve user.dart';
// import 'artist home.dart';


void main() {
  runApp(const ViewArtistPayment());
}

class ViewArtistPayment extends StatelessWidget {
  const ViewArtistPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Reply',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ViewArtistPaymentPage(title: 'View Reply'),
    );
  }
}

class ViewArtistPaymentPage extends StatefulWidget {
  const ViewArtistPaymentPage({super.key, required this.title});

  final String title;

  @override
  State<ViewArtistPaymentPage> createState() => _ViewArtistPaymentPageState();
}

class _ViewArtistPaymentPageState extends State<ViewArtistPaymentPage> {

  _ViewArtistPaymentPageState(){
    ViewArtistPayment();
  }

  List<String> id_ = <String>[];
  List<String> date_ = <String>[];
  List<String> amount_= <String>[];
  List<String> transactionid_= <String>[];
  List<String> name_= <String>[];
  // List<String> place_= <String>[];
  // List<String> date_= <String>[];
  // List<String> price_= <String>[];
  // List<String> phone_= <String>[];
  // List<String> mail_= <String>[];


  Future<void> ViewArtistPayment() async {
    List<String> id = <String>[];
    List<String> name = <String>[];
    List<String> date = <String>[];
    List<String> amount = <String>[];
    List<String> transactionid = <String>[];
    // List<String> photo = <String>[];
    // List<String> date = <String>[];
    // List<String> mail = <String>[];
    // List<String> phone = <String>[];
    // List<String> price = <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/user_artist_view_payment/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        date.add(arr[i]['date'].toString());
        // amount.add(sh.getString("img_url").toString()+arr[i]['photo']);
        amount.add(arr[i]['amount'].toString());
        name.add(arr[i]['name'].toString());
        transactionid.add(arr[i]['transactionid'].toString());
        // phone.add(arr[i]['phone'].toString());
        // place.add(arr[i]['place'].toString());
        // status.add(arr[i]['status'].toString());
        // date.add(arr[i]['Date'].toString());

      }

      setState(() {
        id_ = id;
        amount_ = amount;
        name_ = name;
        date_ = date;
        transactionid_ = transactionid;
        // place_ = place;
        // date_ = date;
        // phone_ = phone;
        // price_ = price;
        // mail_ = mail;

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
              MaterialPageRoute(builder: (context) => ArtistHome(title: '',)),);

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
                                  // Image(image: NetworkImage(photo_[index]),height: 200,width: 200,),

                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(name_[index]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(date_[index]),
                                  ),    Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(amount_[index]),
                                  ),  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(transactionid_[index]),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text(date_[index]),
                                  // ), Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text(price_[index]),
                                  // ), Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text(phone_[index]),
                                  // ), Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text(mail_[index]),
                                  // ),

                                  // ElevatedButton(
                                  //   onPressed: () async {
                                  //     SharedPreferences sh = await SharedPreferences.getInstance();
                                  //     String url = sh.getString('url').toString();
                                  //     String lid = sh.getString('lid').toString();
                                  //     String aid=sh.setString('bid', id_[index]).toString();
                                  //     final urls = Uri.parse('$url/artist_approve_user/');
                                  //     try {
                                  //       final response = await http.post(urls, body: {
                                  //
                                  //         'aid':id_[index],
                                  //
                                  //
                                  //
                                  //       });
                                  //       if (response.statusCode == 200) {
                                  //         String status = jsonDecode(response.body)['status'];
                                  //         if (status=='ok') {
                                  //           Fluttertoast.showToast(msg: 'Approved Successfully');
                                  //           Navigator.push(
                                  //               context,
                                  //               MaterialPageRoute(builder: (context) => ApprovedBooking(title: 'Login',)));
                                  //         }else {
                                  //           Fluttertoast.showToast(msg: 'Incorrect Password');
                                  //         }
                                  //       }
                                  //       else {
                                  //         Fluttertoast.showToast(msg: 'Network Error');
                                  //       }
                                  //     }
                                  //     catch (e){
                                  //       Fluttertoast.showToast(msg: e.toString());
                                  //     }
                                  //
                                  //
                                  //
                                  //
                                  //   },
                                  //   child: Text("Approve"),
                                  // ),
                                  // ElevatedButton(
                                  //   onPressed: () async {
                                  //     SharedPreferences sh = await SharedPreferences.getInstance();
                                  //     String url = sh.getString('url').toString();
                                  //     String lid = sh.getString('lid').toString();
                                  //
                                  //     final urls = Uri.parse('$url/artist_reject_user/');
                                  //     try {
                                  //       final response = await http.post(urls, body: {
                                  //
                                  //         'lid':lid,
                                  //         'aid':id_[index]
                                  //
                                  //
                                  //
                                  //       });
                                  //       if (response.statusCode == 200) {
                                  //         String status = jsonDecode(response.body)['status'];
                                  //         if (status=='ok') {
                                  //           Fluttertoast.showToast(msg: 'Rejected Successfully');
                                  //           Navigator.push(
                                  //               context,
                                  //               MaterialPageRoute(builder: (context) => RejectedBooking(title: 'Login',)));
                                  //         }else {
                                  //           Fluttertoast.showToast(msg: 'Incorrect Password');
                                  //         }
                                  //       }
                                  //       else {
                                  //         Fluttertoast.showToast(msg: 'Network Error');
                                  //       }
                                  //     }
                                  //     catch (e){
                                  //       Fluttertoast.showToast(msg: e.toString());
                                  //     }
                                  //
                                  //
                                  //
                                  //
                                  //   },
                                  //   child: Text("Reject"),
                                  // ),

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
