
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glambook/artist/edit%20service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'artist home.dart';
import 'gallery management.dart';
import 'newhome/Screens/homescreen.dart';


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
      home: const ArtistViewGalleryPage(title: 'View Reply'),
    );
  }
}

class ArtistViewGalleryPage extends StatefulWidget {
  const ArtistViewGalleryPage({super.key, required this.title});

  final String title;

  @override
  State<ArtistViewGalleryPage> createState() => _ArtistViewGalleryPageState();
}

class _ArtistViewGalleryPageState extends State<ArtistViewGalleryPage> {

  _ArtistViewGalleryPageState(){
    ArtistViewService();
  }

  List<String> id_ = <String>[];
  // List<String> service_ = <String>[];
  // List<String> price_= <String>[];
  List<String> photo1_= <String>[];
  List<String> photo2_= <String>[];
  List<String> photo3_= <String>[];


  Future<void> ArtistViewService() async {
    List<String> id = <String>[];
    // List<String> service = <String>[];
    // List<String> price = <String>[];
    List<String> photo1 = <String>[];
    List<String> photo2 = <String>[];
    List<String> photo3 = <String>[];




    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/artist_view_gallery/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        // service.add(arr[i]['service'].toString());
        // price.add(arr[i]['price'].toString());
        photo1.add(sh.getString("img_url").toString()+arr[i]['photo1']);
        photo2.add(sh.getString("img_url").toString()+arr[i]['photo2']);
        photo3.add(sh.getString("img_url").toString()+arr[i]['photo3']);


      }

      setState(() {
        id_ = id;
        // service_ = service;
        // price_ = price;
        photo1_ = photo1;
        photo2_ = photo2;
        photo3_ = photo3;

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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: [

                                    Image(image: NetworkImage(photo1_[index]),height: 200,width: 200,),
                                    Image(image: NetworkImage(photo2_[index]),height: 200,width: 200,),
                                    Image(image: NetworkImage(photo3_[index]),height: 200,width: 200,),


                                    // Padding(
                                    //   padding: EdgeInsets.all(5),
                                    //   child: Text(service_[index]),
                                    // ),
                                    // Padding(
                                    //   padding: EdgeInsets.all(5),
                                    //   child: Text(price_[index]),
                                    // ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        IconButton(onPressed: ()async{
                                        SharedPreferences sh =await SharedPreferences.getInstance();
                                        sh.setString('sid', id_[index]);

                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyGalleryPage(title: 'Edit service page')));
                                      }, icon: Icon(Icons.edit)),SizedBox(width: 2,),
                                        IconButton(onPressed: ()async{
                                        SharedPreferences sh = await SharedPreferences.getInstance();
                                        String url = sh.getString('url').toString();

                                        final urls = Uri.parse('$url/artist_delete_gallery/');
                                        try {
                                          final response = await http.post(urls, body: {
                                            'tid':id_[index],



                                          });
                                          if (response.statusCode == 200) {
                                            String status = jsonDecode(response.body)['status'];
                                            if (status=='ok') {
                                              Fluttertoast.showToast(msg: 'Deleted..');

                                              Navigator.push(context, MaterialPageRoute(
                                                builder: (context) => ArtistViewGalleryPage(title: "View Gallery"),));
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


                                      }, icon: Icon(Icons.delete))
                                      ],
                                    )



                              ]
                          ),
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
