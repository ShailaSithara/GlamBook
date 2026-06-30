
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'artist home.dart';


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
      home: const ArtistViewServicePage(title: 'View Reply'),
    );
  }
}

class ArtistViewServicePage extends StatefulWidget {
  const ArtistViewServicePage({super.key, required this.title});

  final String title;

  @override
  State<ArtistViewServicePage> createState() => _ArtistViewServicePageState();
}

class _ArtistViewServicePageState extends State<ArtistViewServicePage> {

  _ArtistViewServicePageState(){
    ArtistViewService();
  }

  List<String> id_ = <String>[];
  List<String> service_ = <String>[];
  List<String> price_= <String>[];
  List<String> photo_= <String>[];


  Future<void> ArtistViewService() async {
    List<String> id = <String>[];
    List<String> service = <String>[];
    List<String> price = <String>[];
    List<String> photo = <String>[];




    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/artist_view_service/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        service.add(arr[i]['service'].toString());
        price.add(arr[i]['price'].toString());
        photo.add(sh.getString("img_url").toString()+arr[i]['photo']);


      }

      setState(() {
        id_ = id;
        service_ = service;
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
                                  Image(image: NetworkImage(photo_[index]),height: 200,width: 200,),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(service_[index]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(price_[index]),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [IconButton(onPressed: ()async{
                                      SharedPreferences sh =await SharedPreferences.getInstance();
                                      sh.setString('sid', id_[index]);

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ArtistEditServicePage(title: 'Edit service page')));
                                    }, icon: Icon(Icons.edit)),SizedBox(width: 2,),IconButton(onPressed: ()async{
            SharedPreferences sh = await SharedPreferences.getInstance();
            String url = sh.getString('url').toString();

            final urls = Uri.parse('$url/artist_delete_service/');
            try {
            final response = await http.post(urls, body: {
            'tid':id_[index],



            });
            if (response.statusCode == 200) {
            String status = jsonDecode(response.body)['status'];
            if (status=='ok') {
              Fluttertoast.showToast(msg: 'Deleted..');

            Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArtistViewServicePage(title: "View Service"),));
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
