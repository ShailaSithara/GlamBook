
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'dart:io';
// /import 'package:flutter_isolate/flutter_isolate.dart';
void backgroundTask( String s) {
  Timer.periodic(Duration(seconds: 10), (timer) {
    // Perform your periodic task here
    //print('Background task executed at ${DateTime.now()}');
  });
}
class sapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShakeDetectionDemo(),
    );
  }
}

class ShakeDetectionDemo extends StatefulWidget {
  @override
  _ShakeDetectionDemoState createState() => _ShakeDetectionDemoState();
}
class location_fn
{
  String lat="";
  String lon="";
  Future<String> location()
  async {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      lat=position.latitude.toString();
      lon=position.longitude.toString();
      return position.latitude.toString()+"#"+position.longitude.toString();

  }
  String loc_send()
  {
    //print("++++++++++++++++++++++");
    //print("++++++++++++++++++++++");
    //print("++++++++++++++++++++++");
    location();
    //print(lat+"#"+lon);
    return lat+"#"+lon;
  }
}
class _ShakeDetectionDemoState extends State<ShakeDetectionDemo> {
  double _accelerometerX = 0.0;
  double _accelerometerY = 0.0;
  double _accelerometerZ = 0.0;
  bool _isShaking = false;
  location_fn ob=location_fn();
  // bool _status=true;
  get flutterLocalNotificationsPlugin => null;
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  // FlutterLocalNotificationsPlugin();
  // static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // static const String name = 'Awesome Notifications - Example App';
  // static const Color mainColor = Colors.deepPurple;
  String s="0";
  int i=0;
  @override
  void initState() {


    super.initState();


    accelerometerEvents.listen((AccelerometerEvent event) async {
      // setState(()  async {
      ob.location();

      List<String> lll = ob.loc_send().split("#");
        // if(_status) {
        //   _accelerometerX = event.x;
        //   _accelerometerY = event.y;
        //   _accelerometerZ = event.z;
        //   //print(_accelerometerX);
        //   //print(_accelerometerY);
        //   //print(_accelerometerZ);
        //   //print("====================");

        //   // Define a threshold for shake detection
        //   final double shakeThreshold = 12.0;

        //   // Check if the device is shaking based on accelerometer data
        //   _isShaking = (_accelerometerX.abs() > shakeThreshold ||
        //       _accelerometerY.abs() > shakeThreshold ||
        //       _accelerometerZ.abs() > shakeThreshold);

        //   if (_isShaking) {

        //     //print(lll.toString() + "===>");
        //     //print("*************************************");
        //     final sh = await SharedPreferences.getInstance();

        //     String url = sh.getString("url").toString();
        //     String lid = sh.getString("lid").toString();
        //     print("okkkkkkkkkkkkkkkkk");
        //     var data = await http.post(
        //         Uri.parse(url + "emergency_noti"),
        //         body: {'lat': lll[0],
        //           "lon": lll[1],
        //           "lid": lid
        //         });

        //     var jasondata = json.decode(data.body);
        //     String status = jasondata['task'].toString();
        //     // print(status+"+++++++++++++++====++----");
        //     if (status == "ok") {
        //       print("notification==================");
        //       //print("notification==================");
        //       //print("notification==================");
        //       //print("notification==================");
        //       //print("notification==================");
        //       //print("notification==================");
        //       //print("notification==================");
        //       // _sendNotification();



        //     }
        //     else {
        //       print("error");
        //     }
        //   }
        // }
      // });




      if(i==0) {
        i=i+1;
        final sh = await SharedPreferences.getInstance();

        String url = sh.getString("url").toString();
        String bid = sh.getString("bid").toString();
        print(url+"loo");
        String lid = sh.getString("lid").toString();
        print("okkkkkkkkkkkkkkkkk");
        var data = await http.post(
            Uri.parse(url + "/updatelocation"),
            body: {'lat': lll[0],
              "lon": lll[1],
              "lid": lid,
              "bid": bid
            });

        var jasondata = json.decode(data.body);
        String status = jasondata['task'].toString();
        print(status + "+++++++++++++++====++----");
        print(lll.toString() + "===>");
        if (status == "ok") {
          // _sendNotification();
        }
        else {
          print("na");
        }

      }
      print(i);
      i=i+1;
      if(i==500)
        {
          i=0;
        }

    });
  }



  // void startBackgroundTask() async {
  //   final isolate = await FlutterIsolate.spawn(backgroundTask,"");
  // }
  // // Start the background task
  // Future<void> _startBackgroundTask() async {
  //
  //   // final bool isRunning =  await FlutterBackground.isBackgroundExecutionActive;
  //   //
  //   // if (!isRunning) {
  //   //   await FlutterBackground.initialize(androidConfig: AndroidConfig(
  //   //     notificationChannelName: 'Background Tasks',
  //   //     notificationTitle: 'Background Task',
  //   //     notificationText: 'Running in the background',
  //   //     notificationImportance: AndroidNotificationImportance.Default,
  //   //   ));
  //   //
  //   //   final taskId = await FlutterBackground.executeTask(
  //   //     task: (taskId) async {
  //   //       // Periodically make HTTP requests in the background
  //   //       Timer.periodic(Duration(seconds: 10), (timer) async {
  //   //         await _fetchData();
  //   //       });
  //   //     },
  //   //     // Set the interval to trigger the task
  //   //     interval: Duration(seconds: 10),
  //   //     // Run the task immediately
  //   //     executeOnBoot: true,
  //   //   );
  //   // }
  // }

  Future<void> _fetchData() async {
    try {
      // final response = await http.get(Uri.parse(apiUrl));
      //
      // if (response.statusCode == 200) {
      //   // Handle the response data here
      //   //print('Response data: ${response.body}');
      // } else {
      //   // Handle errors
      //   //print('Error: ${response.statusCode}');
      // }
      //print("fetch data");
    } catch (e) {
      // Handle network or other errors
      //print('Error: $e');
    }
  }
  // Future<void> _sendNotification() async {
  //   await AwesomeNotifications().createNotification(
  //     content: NotificationContent(
  //       id: 0,
  //       channelKey: 'basic_channel',
  //       title: 'Awesome Notification',
  //       body: 'This is an awesome notification!',
  //     ),
  //   );
  // }


  @override
  void dispose() {
    super.dispose();

    // Cancel the accelerometer subscription when the widget is disposed
    accelerometerEvents.drain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shake Detection Demo'),
      ),
      body:
       Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Accelerometer Data'),
            Text('X: $_accelerometerX'),
            Text('Y: $_accelerometerY'),
            Text('Z: $_accelerometerZ'),

            SizedBox(height: 20),
            Text(
              _isShaking ? 'Device is shaking!' : 'Device is not shaking.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _isShaking ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );

  }
}
