// import 'dart:convert';
//
// import 'package:aicctv/sent_complaint.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:aicctv/screens/Home.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: '',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
//         useMaterial3: true,
//       ),
//       home: const Viewcomplaints(title: 'Profile'),
//     );
//   }
// }
//
// class Viewcomplaints extends StatefulWidget {
//   const Viewcomplaints({super.key, required this.title});
//
//
//   final String title;
//
//   @override
//   State<Viewcomplaints> createState() => _ViewcomplaintsState();
// }
//
// class _ViewcomplaintsState extends State<Viewcomplaints> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     viewdata();
//   }
//
//
//
//
//
//
//   List<int> id_=[];
//
//
//   List<String> complaint_=[];
//   List<String> date_=[];
//   List<String> reply_=[];
//   List<String> status_=[];
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return WillPopScope(
//       onWillPop: () async{
//         Navigator.push(context, MaterialPageRoute(builder: (context) =>Home (),));
//
//         return false;
//
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.teal,
//
//           title: Text(widget.title),
//         ),
//
//
//           floatingActionButton:  FloatingActionButton.extended(
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => MyComplaintHome(title: 'New complint',)));
//             },
//             label: const Text('Add'),
//             icon: const Icon(Icons.add),
//           ),
//
//         body:  ListView.builder(
//
//           itemCount: id_.length,
//           itemBuilder: (context, index) {
//             return Card(
//               child: Padding(
//                 padding: EdgeInsets.all(5.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     SizedBox(height: 5,),
//                     Text(date_[index]
//                     ,
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 14
//                     ),),
//
//                     SizedBox(height: 5,),
//                     Text(complaint_[index]),
//                     SizedBox(height: 5,),
//                     Text(status_[index]),
//                     SizedBox(height: 5,),
//                     Text(reply_[index]),
//                   ],
//                 ),
//               ),
//             );
//           },
//         )
//
//
//
//       ),
//     );
//   }
//
//
//
//   void viewdata() async {
//
//     List<int> id=[];
//
//
//     List<String> complaint=[];
//     List<String> date=[];
//     List<String> reply=[];
//     List<String> status=[];
//
//     SharedPreferences sh=await SharedPreferences.getInstance();
//     try {
//       String urls = sh.getString('url').toString();
//       String url = '$urls/auth_view_complaints/';
//       String lid = sh.getString("lid").toString();
//       String tone = sh.getString("tone").toString();
//       String imgurl = sh.getString("imgurl").toString();
//       var data = await http.post(Uri.parse(url), body: {
//         "lid": lid,
//         "tone": tone,
//       });
//       var jsondata = json.decode(data.body);
//       String statuss = jsondata['status'];
//
//       var arr = jsondata["data"];
//
//       for (int i = 0; i < arr.length; i++) {
//         id.add(arr[i]['id']);
//         complaint.add(arr[i]['complaint']);
//         date.add(arr[i]['date']);
//         reply.add(arr[i]['reply']);
//         status.add(arr[i]['status']);
//       }
//
//
//       setState(() {
//         id_ = id;
//         complaint_ = complaint;
//         date_ = date;
//         reply_ = reply;
//         status_ = status;
//       });
//
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//       //there is error during converting file image to base64 encoding.
//     }
//   }
//
//
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
