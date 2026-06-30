
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glambook/artist/reject%20user.dart';
import 'package:glambook/artist/service%20management.dart';
import 'package:glambook/artist/view%20booking%20from%20user.dart';
import 'package:glambook/artist/view%20gallery.dart';
import 'package:glambook/artist/view%20payment.dart';
import 'package:glambook/artist/view%20profile.dart';
import 'package:glambook/artist/view%20rating%20&%20review%20from%20user.dart';
import 'package:glambook/artist/view%20service.dart';
import 'package:glambook/user/login.dart';

import '../pages/signup.dart';
import 'approve user.dart';
import 'change password.dart';
import 'edit service.dart';
import 'gallery management.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ArtistHome(title: ''),
    );
  }
}

class ArtistHome extends StatefulWidget {
  const ArtistHome({super.key, required this.title});



  final String title;

  @override
  State<ArtistHome> createState() => _ArtistHomeState();
}

class _ArtistHomeState extends State<ArtistHome> {
  TextEditingController ipcontroller=new TextEditingController();



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        // actions: [IconButton(
        //   color: Colors.white,
        //   icon: const Icon(Icons.logout),
        //
        //   // onPressed: () {
        //   //   Navigator.push(context, MaterialPageRoute(
        //   //     builder: (context) => LoginPage(title: ""),));
        //   // },
        // ),],
        backgroundColor: Color.fromARGB(250, 30, 90, 105),

        title: Text(widget.title),
      ),
      body:
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/cat.jpg'), fit: BoxFit.cover),),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 210,
            childAspectRatio: 10/10,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,

          ),
          padding: const EdgeInsets.all(8.0),
          children: [

            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color:  Color.fromARGB(207, 28, 62, 100),


                    borderRadius: BorderRadius.circular(15)),
                child:  Column(
                    children: [
                      SizedBox(height: 5.0),
                      // InkWell(
                      //
                      //   child: CircleAvatar(
                      //       radius: 50,
                      //       backgroundImage: NetworkImage('https://cdn.business2community.com/wp-content/uploads/2018/10/notification_1540708456-900x900.png')
                      //   ),
                      //   onTap: () {Navigator.push(context, MaterialPageRoute(
                      //     builder: (context) => StudentViewNotification(),));},
                      // ),
                      SizedBox(height: 30.0),
                      // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(1),
                            child: Text("Join Notification",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
                            )),
                          ),],
                      ),


                    ]
                )
            ),


            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color:  Color.fromARGB(207, 28, 62, 100),


                    borderRadius: BorderRadius.circular(15)),
                child:  Column(
                    children: [
                      SizedBox(height: 5.0),
                      // InkWell(
                      //
                      //   child: CircleAvatar(
                      //       radius: 50,
                      //       backgroundImage: NetworkImage('https://albena.bg/image/MTM4MDMuanBnLzE2MDAvMTYwMC8xLzEvODUvLy8/.jpg')
                      //   ),
                      //   onTap: () {Navigator.push(context, MaterialPageRoute(
                      //     builder: (context) => StudentViewEvents(),));},
                      // ),
                      SizedBox(height: 30.0),
                      // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(1),
                            child: Text("Events",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
                            )),
                          ),],
                      ),


                    ]
                )
            ),







            // Container(
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //         color:  Color.fromARGB(207, 28, 62, 100),
            //
            //
            //         borderRadius: BorderRadius.circular(15)),
            //     child:  Column(
            //         children: [
            //           SizedBox(height: 5.0),
            //           InkWell(
            //
            //             child: CircleAvatar(
            //                 radius: 50,
            //                 backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP._dF3h309digWf96LoMjMfwHaGu?rs=1&pid=ImgDetMain')
            //             ),
            //             onTap: () {Navigator.push(context, MaterialPageRoute(
            //               builder: (context) => MySendFeedback(title: ""),));},
            //           ),
            //           SizedBox(height: 30.0),
            //           // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
            //           Column(
            //             children: [
            //               Padding(
            //                 padding: EdgeInsets.all(1),
            //                 child: Text("Feedback",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
            //                 )),
            //               ),],
            //           ),
            //
            //
            //         ]
            //     )
            // ),
            //
            // Container(
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //         color:  Color.fromARGB(207, 28, 62, 100),
            //
            //
            //         borderRadius: BorderRadius.circular(15)),
            //     child:  Column(
            //         children: [
            //           SizedBox(height: 5.0),
            //           InkWell(
            //
            //             child: CircleAvatar(
            //                 radius: 50,
            //                 backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.1unxtVc9Aj9g_9I5ezhMqgAAAA?pid=ImgDet&w=182&h=182&c=7')
            //             ),
            //             onTap: () {Navigator.push(context, MaterialPageRoute(
            //               builder: (context) => StudentViewSelectionTask(),));},
            //           ),
            //           SizedBox(height: 30.0),
            //           // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
            //           Column(
            //             children: [
            //               Padding(
            //                 padding: EdgeInsets.all(1),
            //                 child: Text("Selection Task",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
            //                 )),
            //               ),],
            //           ),
            //
            //
            //         ]
            //     )
            // ),
            //
            // Container(
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //         color:  Color.fromARGB(207, 28, 62, 100),
            //
            //
            //         borderRadius: BorderRadius.circular(15)),
            //     child:  Column(
            //         children: [
            //           SizedBox(height: 5.0),
            //           InkWell(
            //
            //             child: CircleAvatar(
            //                 radius: 50,
            //                 backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP._H82rLRWFYK9QINj2d331gAAAA?pid=ImgDet&w=206&h=206&c=7')
            //             ),
            //             onTap: () {Navigator.push(context, MaterialPageRoute(
            //               builder: (context) => StudentViewRequestStatus(),));},
            //           ),
            //           SizedBox(height: 30.0),
            //           // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
            //           Column(
            //             children: [
            //               Padding(
            //                 padding: EdgeInsets.all(1),
            //                 child: Text("Request Status",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
            //                 )),
            //               ),],
            //           ),
            //
            //
            //         ]
            //     )
            // ),
            //
            //
            // Container(
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //         color:  Color.fromARGB(207, 28, 62, 100),
            //
            //
            //         borderRadius: BorderRadius.circular(15)),
            //     child:  Column(
            //         children: [
            //           SizedBox(height: 5.0),
            //           InkWell(
            //
            //             child: CircleAvatar
            //
            //             (
            //                 radius: 50,
            //                 backgroundImage: NetworkImage('https://w7.pngwing.com/pngs/250/428/png-transparent-computer-icons-password-user-window-furniture-window-manager.png')
            //             ),
            //             onTap: () {Navigator.push(context, MaterialPageRoute(
            //               builder: (context) => MyStudentChangePassword(title: "",),));},
            //           ),
            //           SizedBox(height: 30.0),
            //           // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
            //           Column(
            //             children: [
            //               Padding(
            //                 padding: EdgeInsets.all(1),
            //                 child: Text("Change Password",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
            //                 )),
            //               ),],
            //           ),
            //
            //
            //         ]
            //     )
            // ),
            //
            //
            // Container(
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //         color:  Color.fromARGB(207, 28, 62, 100),
            //
            //
            //         borderRadius: BorderRadius.circular(15)),
            //     child:  Column(
            //         children: [
            //           SizedBox(height: 5.0),
            //           InkWell(
            //
            //             child: CircleAvatar(
            //                 radius: 50,
            //                 backgroundImage: NetworkImage('https://i.pinimg.com/originals/fa/ec/50/faec5006f1a3cc2210a70313c0954367.jpg')
            //             ),
            //             onTap: () {Navigator.push(context, MaterialPageRoute(
            //               builder: (context) => LoginPage(title: "",),));},
            //           ),
            //           SizedBox(height: 30.0),
            //           // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index])),
            //           Column(
            //             children: [
            //               Padding(
            //                 padding: EdgeInsets.all(1),
            //                 child: Text("Logout",style: TextStyle(color: Colors.white,fontSize: 18,    fontWeight: FontWeight.bold,
            //                 )),
            //               ),],
            //           ),
            //
            //
            //         ]
            //     )
            // ),
          ],

        ),
      ),




      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color:  Color.fromARGB(195, 29, 155, 187),


              ),
              child:
              Column(children: [

                Text(
                  'Style Rental & Glambook',
                  style: TextStyle(fontSize: 20,color: Colors.grey[200]),
                ),
                // CircleAvatar(radius: 50,backgroundImage: AssetImage('assets/images/nss.jpeg')),




              ])


              ,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ArtistHome(title: "",),));
              },
            ),
            ListTile(
              leading: Icon(Icons.person_outline_rounded),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProfilePage(title: "",),));
              },
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyGalleryPage(title: "",),));
              },
            ), ListTile(
              leading: Icon(Icons.photo),
              title: const Text('View Gallery'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ArtistViewGalleryPage(title: "",),));
              },
            ),
            ListTile(
              leading: Icon(Icons.home_repair_service),
              title: const Text(' Service '),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddServicePage(title: '',),));
              },
            ),
            ListTile(
              leading: Icon(Icons.miscellaneous_services_outlined),
              title: const Text(" View Service "),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ArtistViewServicePage(title: '',),));
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: const Text(' Booking '),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewBookingPage(title: " ",),));
              },
            ),
            ListTile(
              leading: Icon(Icons.phone_callback),
              title: const Text(' Approved Booking '),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ApprovedBooking(title: " ",),));
              },
            ),
            ListTile(
              leading: Icon(Icons.phone_disabled),
              title: const Text(' Reject Booking '),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => RejectedBooking(title: " ",),));
              },
            ),
            ListTile(
              leading: Icon(Icons.paypal_outlined),
              title: const Text(' Payment '),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPaymentPage(title: '',),));
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: const Text(' Rating '),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewRatingandReviewPage(title: '',),));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: const Text(' Change Password '),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ArtistChangePasswordPage(title: "",),));
              },
            ),


            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                builder: (context) => Sigpage(),));

                // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
              },
            ),
          ],
        ),
      ),

    );

  }

}
