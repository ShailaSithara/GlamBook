
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glambook/artist/edit%20service.dart';
import 'package:glambook/artist/newhome/Screens/homescreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'artist home.dart';
import 'edit availability.dart';


void main() {
  runApp(const ArtistViewService());
}

class ArtistViewService extends StatelessWidget {
  const ArtistViewService({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Reply',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ViewArtistAvailabilityPage(title: 'View Reply'),
    );
  }
}

class ViewArtistAvailabilityPage extends StatefulWidget {
  const ViewArtistAvailabilityPage({super.key, required this.title});

  final String title;

  @override
  State<ViewArtistAvailabilityPage> createState() => _ViewArtistAvailabilityPageState();
}

class _ViewArtistAvailabilityPageState extends State<ViewArtistAvailabilityPage> {

  _ViewArtistAvailabilityPageState(){
    ArtistViewService();
  }

  List<String> id_ = <String>[];
  List<String> date_ = <String>[];
  List<String> fromtime_= <String>[];
  List<String> totime_= <String>[];


  Future<void> ArtistViewService() async {
    List<String> id = <String>[];
    List<String> date = <String>[];
    List<String> fromtime = <String>[];
    List<String> totime = <String>[];




    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/artist_view_availability/';

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
        fromtime.add(arr[i]['fromtime'].toString());
        totime.add(arr[i]['totime'].toString());


      }

      setState(() {
        id_ = id;
        date_ = date;
        fromtime_ = fromtime;
        totime_ = totime;

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
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Date"),
                                  Text(date_[index]),
                                ],
                              ),
                            ),Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text("From Time"),
                                  Text(fromtime_[index]),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text("To Time"),
                                  Text(totime_[index]),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [IconButton(onPressed: ()async{
                                SharedPreferences sh =await SharedPreferences.getInstance();
                                sh.setString('sid', id_[index]);

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ArtistEditAvailabilityPage(title: 'Edit availability page')));
                              }, icon: Icon(Icons.edit)),SizedBox(width: 2,),IconButton(onPressed: ()async{
                                SharedPreferences sh = await SharedPreferences.getInstance();
                                String url = sh.getString('url').toString();

                                final urls = Uri.parse('$url/artist_delete_availability/');
                                try {
                                  final response = await http.post(urls, body: {
                                    'tid':id_[index],



                                  });
                                  if (response.statusCode == 200) {
                                    String status = jsonDecode(response.body)['status'];
                                    if (status=='ok') {
                                      Fluttertoast.showToast(msg: 'Deleted..');

                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => ViewArtistAvailabilityPage(title: "View Availability"),));
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


                              }, icon: Icon(Icons.delete))],
                            )

                          ],
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
