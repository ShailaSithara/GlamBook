// import 'dart:convert';
//
// import 'package:aicctv/screens/Home.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(const ViewOwnPost());
// }
//
// class ViewOwnPost extends StatelessWidget {
//   const ViewOwnPost({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
//         useMaterial3: true,
//       ),
//       home: const MyViewFamilyPerson(),
//     );
//   }
// }
//
// class MyViewFamilyPerson extends StatefulWidget {
//   const MyViewFamilyPerson({Key? key}) : super(key: key);
//
//   @override
//   State<MyViewFamilyPerson> createState() => _MyViewFamilyPersonState();
// }
//
// class _MyViewFamilyPersonState extends State<MyViewFamilyPerson> {
//   _MyViewFamilyPersonState() {
//     ViewOwnPost();
//   }
//
//   List<String> id_ = <String>[];
//   List<String> name_ = <String>[];
//   List<String> email_ = <String>[];
//   List<String> phone_ = <String>[];
//   List<String> place_ = <String>[];
//
//   List<String> relation_ = <String>[];
//   List<String> photo_ = <String>[];
//
//   Future<void> ViewOwnPost() async {
//     List<String> id = <String>[];
//     List<String> name = <String>[];
//     List<String> email = <String>[];
//     List<String> phone = <String>[];
//     List<String> place = <String>[];
//
//     List<String> relation = <String>[];
//     List<String> photo = <String>[];
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String lid = sh.getString('lid').toString();
//       String url = '$urls/and_parent_view_authority/';
//       var data = await http.post(Uri.parse(url), body: {'lid': lid});
//       var jsondata = json.decode(data.body);
//       String statuss = jsondata['status'];
//       var arr = jsondata["data"];
//       print(arr.length);
//       for (int i = 0; i < arr.length; i++) {
//         id.add(arr[i]['id'].toString());
//         name.add(arr[i]['name']);
//         email.add(arr[i]['email']);
//         phone.add(arr[i]['phone']);
//         place.add(arr[i]['place']);
//
//         relation.add(arr[i]['relation']);
//         photo.add(sh.getString("img_url").toString() + arr[i]['photo']);
//       }
//       setState(() {
//         id_ = id;
//         name_ = name;
//         email_ = email;
//         phone_ = phone;
//         place_ = place;
//
//         relation_ = relation;
//         photo_ = photo;
//       });
//       print(statuss);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//       //there is error during converting file image to base64 encoding.
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return true;
//       },
//       child: Scaffold(
//         backgroundColor: Color.fromARGB(250, 30, 90, 105),
//         // Set the background color here
//         appBar: AppBar(
//           leading: BackButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Home()),
//               );
//             },
//           ),
//           backgroundColor: Theme.of(context).colorScheme.primary,
//           title: Text("Authority"),
//         ),
//         body: ListView.builder(
//           physics: BouncingScrollPhysics(),
//           itemCount: id_.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               onLongPress: () {
//                 print("long press" + index.toString());
//               },
//               title: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Card(
//                     elevation: 8,
//                     margin: EdgeInsets.all(10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           height: 250,
//                           width: 250,
//                           child: Padding(
//                             padding: EdgeInsets.all(10),
//                             child: Image(
//                               image: NetworkImage(photo_[index], scale: 2),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(5),
//                           child: Text(
//                             "Name:   " + name_[index],
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 15.0,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(5),
//                           child: Text(
//                             "Relation:   " + relation_[index],
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 15.0,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(5),
//                           child: Text(
//                             "Place:   " + place_[index],
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 15.0,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(5),
//                           child: Text(
//                             "Email:   " + email_[index],
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 15.0,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(5),
//                           child: Text(
//                             "Phone:   " + phone_[index],
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 15.0,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
