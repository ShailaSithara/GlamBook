import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ServicePayment(),
    );
  }
}

class ServicePayment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<ServicePayment> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();

    // Initializing Razorpay
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // Disposing Razorpay instance to avoid memory leaks
    _razorpay.clear();
    super.dispose();
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse responses) async {
    // Handle successful payment


    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();
    String pid = sh.getString('pid').toString();
    String aid = sh.getString('aid').toString();
    String sid = sh.getString('price').toString();

    final urls = Uri.parse('$url/user_payment_Artist/');
    try {
      final response = await http.post(urls, body: {
        "lid": lid,
        "price": sid,
        "pid": pid,
        "aid": aid,
        "transactionid":'${responses.paymentId}'




      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status == 'ok') {
          Fluttertoast.showToast(msg: 'payment Successfull');
          // Navigator.push(context, MaterialPageRoute(
          //   builder: (context) => MyLoginPage(title: "Login"),));
        } else {
          Fluttertoast.showToast(msg: 'Not Found');
        }
      }
      else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    }
    catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }


    print("Payment Successful: ${responses.paymentId}");
  }

  Future<void> _handlePaymentError(PaymentFailureResponse response) async {
    // Handle payment failure



    print("Error in Payment: ${response.code} - ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet
    print("External Wallet: ${response.walletName}");
  }

  Future<void> _openCheckout() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String total = sh.getString("price").toString();
    String pid = sh.getString('pid').toString();


    if (total == null){
      total = '0';
    }
    double totalam = double.parse(total);

    totalam = totalam * 100;
    var options = {
      'key': 'rzp_test_HKCAwYtLt0rwQe', // Replace with your Razorpay API key
      'amount': totalam, // Amount in paise (e.g. 2000 paise = Rs 20)
      'name': 'Flutter Razorpay Example',
      'description': 'Payment for the product',
      'prefill': {'contact': '9747360170', 'email': 'tlikhil@gmail.com'},
      'external': {
        'wallets': ['paytm'] // List of external wallets
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Razorpay Flutter Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed:
          _openCheckout,

          child: Text('Make Payment'),
        ),
      ),
    );
  }


}