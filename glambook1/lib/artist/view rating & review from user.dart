
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glambook/artist/service%20management.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../user/send complaint.dart';
import '../user/send rating & review about service.dart';
import 'artist home.dart';


void main() {
  runApp(const ViewRatingandReview());
}

class ViewRatingandReview extends StatelessWidget {
  const ViewRatingandReview({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Reply',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ViewRatingandReviewPage(title: 'View Reply'),
    );
  }
}

class ViewRatingandReviewPage extends StatefulWidget {
  const ViewRatingandReviewPage({super.key, required this.title});

  final String title;

  @override
  State<ViewRatingandReviewPage> createState() => _ViewRatingandReviewPageState();
}

class _ViewRatingandReviewPageState extends State<ViewRatingandReviewPage> {

  _ViewRatingandReviewPageState(){
    ViewRatingandReview();
  }

  List<String> id_ = <String>[];
  List<String> review_ = <String>[];
  List<String> rating_= <String>[];
  List<String> username_= <String>[];
  List<String> date_= <String>[];


  Future<void> ViewRatingandReview() async {
    List<String> id = <String>[];
    List<String> review = <String>[];
    List<String> rating = <String>[];
    List<String> username = <String>[];
    List<String> date = <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/artist_view_rating_and_review_fromuser/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        review.add(arr[i]['reviw']);
        rating.add(arr[i]['rating']);
        username.add(arr[i]['username']);
        date.add(arr[i]['date']);

      }

      setState(() {
        id_ = id;
        review_ = review;
        rating_ = rating;
        username_ = username;
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
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(review_[index]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(rating_[index]),
                                  ),    Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(username_[index]),
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
        floatingActionButton: FloatingActionButton(onPressed: () {

          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewRatingandReviewPage(title: 'review&rating ',)));

        },
          child: Icon(Icons.plus_one),
        ),


      ),
    );
  }
}
