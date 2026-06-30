
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glambook/user/rental%20view%20payment.dart';
import 'package:glambook/user/send%20complaint.dart';
import 'package:glambook/user/view%20cart.dart';
import 'package:glambook/user/view%20nearest%20artist.dart';
import 'package:glambook/user/view%20nearest%20shop.dart';
import 'package:glambook/user/view%20products.dart';
import 'package:glambook/user/view%20profile.dart';
import 'package:glambook/user/view%20reply.dart';
import 'package:glambook/user/view%20services.dart';


import '../pages/signup.dart';
import 'all services.dart';
import 'artist view payment.dart';
import 'book service.dart';
import 'booking.dart';
import 'change password.dart';
import 'login.dart';

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
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            //             child: CircleAvatar(
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
                  'Glam Book',
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
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "",),));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text(' Profile '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserViewProfilePage(title: 'Profile',),));
              },
            ),
            ListTile(
              leading: Icon(Icons.production_quantity_limits),
              title: const Text(' Products '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProductPage(title: 'Product',),));
              },
            ),
    ListTile(
              leading: Icon(Icons.shopping_cart),
              title: const Text(' Cart '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewCartPage(title: 'Cart',),));
              },
            ),ListTile(
              leading: Icon(Icons.brush_outlined),
              title: const Text(' Services '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => AllServicesPage(title: 'Service',),));
              },
            ),
            ListTile(
              leading: Icon(Icons.production_quantity_limits),
              title: const Text(" Products Booking "),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductBookingPage(title: 'Product Booking',),));
              },
            ),
            ListTile(
              leading: Icon(Icons.brush_outlined),
              title: const Text(' Services Booking '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceBookingPage(title: "Service Booking ",),));
              },
            ),
            ListTile(
              leading: Icon(Icons.task_alt),
              title: const Text(' Nearest Artist '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNearestArtistPage(title: 'Nearest Artist',),));
              },
            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: const Text(' Nearest Shop '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNearestShopPage(title: 'Nearest Shop',),));
              },
            ),
            ListTile(
              leading: Icon(Icons.paypal_outlined),
              title: const Text('Artist Payment '),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewArtistPaymentPage(title: 'Artist Payment',),));
              },
            ), ListTile(
              leading: Icon(Icons.paypal_outlined),
              title: const Text('Rental Payment '),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewRentalPaymentPage(title: 'Rental Payment',),));
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: const Text(' Complaint '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewReplyPage(title: 'Complaint',),));
              },
            ),
            ListTile(
              leading: Icon(Icons.password),
              title: const Text(' Change Password '),
              onTap: () {
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserChangePasswordPage(title: "Change Password ",),));
              },
            ),


            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(
                // builder: (context) => LoginPage(title: ""),));

                Navigator.push(context, MaterialPageRoute(builder: (context) => Sigpage(),));
              },
            ),
          ],
        ),
      ),





    );

  }

}
