// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:glambook/user/chat%20with%20artist.dart';
// import 'package:glambook/user/view%20artist%20works.dart';
// import 'package:glambook/user/view%20rating%20artist.dart';
// import 'package:glambook/user/view%20services.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:url_launcher/url_launcher.dart';
// class NewViewNearestArtistPage extends StatefulWidget {
//   @override
//   _NewViewNearestArtistPageState createState() => _NewViewNearestArtistPageState();
// }
//
// class _NewViewNearestArtistPageState extends State<NewViewNearestArtistPage> {
//
//
//
//
//   _NewViewNearestArtistPageState(){
//     ViewNearestArtist();
//   }
//
//   List<String> id_ = <String>[];
//   List<String> name_= <String>[];
//   List<String> phone_= <String>[];
//   List<String> email_= <String>[];
//   List<String> place_= <String>[];
//   List<String> photo_= <String>[];
//   List<String> post_= <String>[];
//   List<String> pin_= <String>[];
//   List<String> state_= <String>[];
//   List<String> longitude_= <String>[];
//   List<String> latitude_= <String>[];
//
//   Future<void> ViewNearestArtist() async {
//     List<String> id = <String>[];
//     List<String> name = <String>[];
//     List<String> phone = <String>[];
//     List<String> email = <String>[];
//     List<String> place = <String>[];
//     List<String> photo = <String>[];
//     List<String> post = <String>[];
//     List<String> pin = <String>[];
//     List<String> state = <String>[];
//     List<String> longitude = <String>[];
//     List<String> latitude = <String>[];
//
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String lid = sh.getString('lid').toString();
//       String url = '$urls/user_view_nearestartist/';
//
//       var data = await http.post(Uri.parse(url), body: {
//
//         'lid':lid
//
//       });
//       var jsondata = json.decode(data.body);
//       String statuss = jsondata['status'];
//
//       var arr = jsondata["data"];
//
//       print(arr.length);
//
//       for (int i = 0; i < arr.length; i++) {
//         id.add(arr[i]['id'].toString());
//         name.add(arr[i]['name'].toString());
//         phone.add(arr[i]['phone'].toString());
//         email.add(arr[i]['mail'].toString());
//         place.add(arr[i]['place'].toString());
//         photo.add(sh.getString("img_url").toString()+arr[i]['photo']);
//         post.add(arr[i]['post'].toString());
//         pin.add(arr[i]['pin'].toString());
//         state.add(arr[i]['state'].toString());
//         longitude.add(arr[i]['longitude'].toString());
//         latitude.add(arr[i]['latitude'].toString());
//       }
//
//       setState(() {
//         id_ = id;
//         name_ = name;
//         phone_ = phone;
//         email_ = email;
//         place_ = place;
//         photo_ = photo;
//         post_ = post;
//         pin_ = pin;
//         state_ = state;
//         longitude_ = longitude;
//         latitude_ = latitude;
//       });
//
//       print(statuss);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//       //there is error during converting file image to base64 encoding.
//     }
//   }
//
//
//
//
//
//
//
//   List<Map<String, dynamic>> ambulanceData = [];
//   String _currentLocation = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchCurrentLocation();
//   }
//
//   Future<void> _fetchCurrentLocation() async {
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String url = sh.getString('url').toString();
//
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//       String lat = position.latitude.toString();
//       String lon = position.longitude.toString();
//
//
//
//       // String url = sh.getString("url").toString();
//
//       var data = await http.post(
//         Uri.parse(url + "/calculate_distance/"),
//         body: {
//           'latitude': lat,
//           'longitude': lon,
//         },
//       );
//       print(data);
//       print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
//       var jsonData = json.decode(data.body);
//       dynamic status = jsonData['status'];
//
//       if (status is int) {
//         status = status.toString(); // Convert to a string if it's an integer
//       } else if (status is! String) {
//         // Handle other data types or error cases
//         print("Error: Invalid status type");
//         return;
//       }
//
//       if (status == "ok") {
//         List<dynamic> data = jsonData['data'];
//         print(data);
//         ambulanceData = data.cast<Map<String, dynamic>>();
//         setState(() {}); // Update the UI with the fetched data
//       } else {
//         print("Error: Unable to fetch ambulance data");
//       }
//     } catch (e) {
//       print("Error fetching location: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Nearest Buss'),
//       ),
//
//       body: ListView.builder(
//         physics: BouncingScrollPhysics(),
//         // padding: EdgeInsets.all(5.0),
//         // shrinkWrap: true,
//         itemCount: id_.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             onLongPress: () {
//               print("long press" + index.toString());
//             },
//             title: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Card(
//                       child:
//                       Row(
//                           children: [
//                             Column(
//                               children: [
//                                 Image(image: NetworkImage(photo_[index]),height: 200,width: 200,),
//
//                                 Padding(
//                                   padding: EdgeInsets.all(5),
//                                   child: Text(name_[index]),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(5),
//                                   child: Text(phone_[index]),
//                                 ),    Padding(
//                                   padding: EdgeInsets.all(5),
//                                   child: Text(email_[index]),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(5),
//                                   child: Row(
//                                     children: [
//                                       Text('Address'),
//                                       Text(place_[index]+"\n"+post_[index]+"\n"+pin_[index]+"\n"+state_[index]),
//                                     ],
//                                   ),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () async {
//
//                                     SharedPreferences sh = await SharedPreferences.getInstance();
//                                     sh.setString("gid", id_[index].toString());
//
//
//                                     Navigator.push(context, MaterialPageRoute(
//
//
//
//                                       builder: (context) => ArtistWorksPage(title: ""),));
//                                   },
//                                   child: Text("Works"),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () async {
//
//                                     SharedPreferences sh = await SharedPreferences.getInstance();
//                                     sh.setString("aid", id_[index].toString());
//
//
//                                     Navigator.push(context, MaterialPageRoute(
//
//
//
//                                       builder: (context) => ViewServicePage(title: ""),));
//                                   },
//                                   child: Text("Service"),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () async {
//
//                                     final pref =await SharedPreferences.getInstance();
//                                     pref.setString("did", id_[index]);
//
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(builder: (context) => ChatWithArtistPage(title: "Chat"),),
//                                     );
//                                   },
//                                   child: Text("Chat"),
//                                 ),ElevatedButton(
//                                   onPressed: () async {
//
//                                     final pref =await SharedPreferences.getInstance();
//                                     pref.setString("sid", id_[index]);
//
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(builder: (context) => ViewRatingShop(title: ""),),
//                                     );
//                                   },
//                                   child: Text("View Rating"),
//                                 ),
//
//
//
//                               ],
//                             ),
//
//
//
//
//
//                             Column(
//                               children: [
//                                 Row(
//                                   children: [
//
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//
//                                   ],
//                                 ),
//                               ],
//                             ),
//
//
//
//                           ]
//                       ),
//
//                       elevation: 8,
//                       margin: EdgeInsets.all(10),
//                     ),
//                   ],
//                 )),
//           );
//         },
//       ),
//
//
//
//       // body: Center(
//       //   child: Column(
//       //     mainAxisAlignment: MainAxisAlignment.center,
//       //     children: <Widget>[
//       //       Text(
//       //         _currentLocation,
//       //         style: TextStyle(fontSize: 16),
//       //       ),
//       //       SizedBox(height: 16),
//       //       Expanded(
//       //         child: ListView.builder(
//       //           itemCount: ambulanceData.length,
//       //           itemBuilder: (context, index) {
//       //             final data = ambulanceData[index];
//       //             print(data);
//       //             print("=====================");
//       //             return Card(
//       //               child: ListTile(
//       //                 title: Text(ambulanceData[index]['name']),
//       //                 subtitle: Text(ambulanceData[index]['phone'].toString()),
//       //                 trailing: Icon(Icons.call),
//       // //                 onTap: () async{
//       // //                   String phoneNumber = 'tel:'+data['phone'].toString(); // Replace with the phone number you want to call
//       // //
//       // // await launch(phoneNumber);
//       // //
//       // //                   // Handle tapping on the ambulance item here
//       // //                   // You can navigate to a detailed view or perform an action
//       // //                 },
//       //               ),
//       //             );
//       //           },
//       //         ),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     );
//   }
// }







import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:glambook/user/view%20artist%20works.dart';
import 'package:glambook/user/view%20rating%20artist.dart';
import 'package:glambook/user/view%20services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'chat with artist.dart';

// import 'map.dart';
class LocationFetchScreen extends StatefulWidget {
  @override
  _LocationFetchScreenState createState() => _LocationFetchScreenState();
}

class _LocationFetchScreenState extends State<LocationFetchScreen> {
  List<Map<String, dynamic>> id_ = [];
  List<Map<String, dynamic>> name_ = [];
  List<Map<String, dynamic>> phone_ = [];
  List<Map<String, dynamic>> email_ = [];
  List<Map<String, dynamic>> photo_ = [];
  List<Map<String, dynamic>> place_ = [];
  List<Map<String, dynamic>> post_ = [];
  List<Map<String, dynamic>> pin_ = [];
  List<Map<String, dynamic>> state_ = [];
  List<Map<String, dynamic>> latitude_ = [];
  List<Map<String, dynamic>> longitude_ = [];




  String _currentLocation = '';

  @override
  void initState() {
    super.initState();
    _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String url = sh.getString('url').toString();


      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      //         photo.add(sh.getString("img_url").toString()+arr[i]['photo']);

      String lat = position.latitude.toString();
      String lon = position.longitude.toString();
      // String url = sh.getString("url").toString();
      sh.setString("lati",lat).toString();
      sh.setString("longi",lon).toString();

      var data = await http.post(
        Uri.parse('$url/calculate_distance/'),
        body: {
          'latitude': lat,
          'longitude': lon,
        },
      );
      var jsonData = json.decode(data.body);
      dynamic status = jsonData['status'];

      if (status is int) {
        status = status.toString(); // Convert to a string if it's an integer
      } else if (status is! String) {
        // Handle other data types or error cases
        print("Error: Invalid status type");
        return;
      }

      if (status == "ok") {
        List<dynamic> data = jsonData['data'];
        print(data);
        id_ = data.cast<Map<String, dynamic>>();
        name_ = data.cast<Map<String, dynamic>>();
        phone_ = data.cast<Map<String, dynamic>>();
        email_ = data.cast<Map<String, dynamic>>();
        place_ = data.cast<Map<String, dynamic>>();
        photo_ = data.cast<Map<String, dynamic>>();
        post_ = data.cast<Map<String, dynamic>>();
        pin_ = data.cast<Map<String, dynamic>>();
        state_ = data.cast<Map<String, dynamic>>();
        longitude_ = data.cast<Map<String, dynamic>>();
        latitude_ = data.cast<Map<String, dynamic>>();
        setState(() {}); // Update the UI with the fetched data
      } else {
        print("Error: Unable to fetch  data");
      }
    } catch (e) {
      print("Error fetching location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearest Signal'),
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
                                Image(image: NetworkImage(photo_[index]['photo']),height: 200,width: 200,),

                                  Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Text(name_[index]['name'].toString()),
                                                ),

            // Padding(
            //                                       padding: EdgeInsets.all(5),
            //                                       child: Text(email_[index]['email']),
            //                                     ),
                                                Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Text(place_[index]['place']),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Text(post_[index]['post']),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Text(pin_[index]['pin']),
                                                ),

                                                Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Text(state_[index]['state']),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Text(latitude_[index]['latitude']),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Text(longitude_[index]['longitude']),
                                                ),
                                ElevatedButton(
                                  onPressed: () async {

                                    SharedPreferences sh = await SharedPreferences.getInstance();
                                    sh.setString("gid", id_[index].toString());


                                    Navigator.push(context, MaterialPageRoute(



                                      builder: (context) => ArtistWorksPage(title: ""),));
                                  },
                                  child: Text("Works"),
                                ),
                                ElevatedButton(
                                  onPressed: () async {

                                    SharedPreferences sh = await SharedPreferences.getInstance();
                                    sh.setString("aid", id_[index].toString());


                                    Navigator.push(context, MaterialPageRoute(



                                      builder: (context) => ViewServicePage(title: ""),));
                                  },
                                  child: Text("Service"),
                                ),
                                ElevatedButton(
                                  onPressed: () async {

                                    final pref =await SharedPreferences.getInstance();
                                    pref.setString("did", id_[index]['id']);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ChatWithArtistPage(title: "Chat"),),
                                    );
                                  },
                                  child: Text("Chat"),
                                ),ElevatedButton(
                                  onPressed: () async {

                                    final pref =await SharedPreferences.getInstance();
                                    pref.setString("sid", id_[index]['id']);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ViewRatingShop(title: ""),),
                                    );
                                  },
                                  child: Text("View Rating"),
                                ),



                              ],
                            ),





                            Column(
                              children: [
                                Row(
                                  children: [

                                  ],
                                ),
                                Row(
                                  children: [

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

    );
  }
}
