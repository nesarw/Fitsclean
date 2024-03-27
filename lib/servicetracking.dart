import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sample/servicehistory.dart';
import 'Firebase_Auth/session_manager.dart';
import 'Homepage.dart';
import 'package:order_tracker/order_tracker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();// initialize Flutter binding

  String orderId = "some-order-id-value";

  runApp(MaterialApp(
    home: Servicetracking(orderId: orderId),
  ));
}

class Servicetracking extends StatefulWidget {
  final String orderId;

  Servicetracking({required this.orderId});

  @override
  State<Servicetracking> createState() => _ServicetrackingState();
}

class _ServicetrackingState extends State<Servicetracking> {
  @override
  Widget build(BuildContext context) {
    if (widget.orderId.isNotEmpty) {
      return TrackingScreen(orderId: widget.orderId);
    } else {
      return Center(
        child: Text('No order ID provided'),
      );
    }
  }
}

class TrackingScreen extends StatefulWidget {
  final String orderId;

  TrackingScreen({required this.orderId});

  @override
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: const Text(
          "FitsClean",
          style: TextStyle(
            fontSize: 35.0,
            fontFamily: 'Roboto',
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Add your onPressed event here
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const serivcehistory()),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20, // Add this line to add space between the text fields
          ),
          const Text(
            "Order Details",
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 25, // Add this line to add space between the text fields
          ),
          Text('Order ID: ${widget.orderId}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 15, // Add this line to add space between the text fields
          ),
          const Text(
            "Order Status",
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 25, // Add this line to add space between the text fields
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0), // Set the left margin here
            child: SizedBox(
              width: 300, // Set the width here
              height: 400, // Set the height here
              child: OrderTracker(
                status: Status.order,
                activeColor: Colors.red[400],
                inActiveColor: Colors.white,
                orderTitleAndDateList: orderList,
                shippedTitleAndDateList: shippedList,
                outOfDeliveryTitleAndDateList: outOfDeliveryList,
                deliveredTitleAndDateList: deliveredList,
              ),
            ),
          ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add your on pressed event here
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: const Size(350, 50), // Set the width and height of the button here
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 22.0, // Increase the font size here
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<TextDto> orderList = [
  TextDto("Order Placed.", ""),
];

List<TextDto> shippedList = [
  TextDto("Order Shipped.", ""),
];

List<TextDto> outOfDeliveryList = [
  TextDto("Order Out for Delivery.", ""),
];

List<TextDto> deliveredList = [
  TextDto("Order Delivered.", ""),
];