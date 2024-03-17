import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'package:order_tracker/order_tracker.dart';

void main() => runApp(const MaterialApp(
  home: Servicetracking(),
));

class Servicetracking extends StatelessWidget {
  const Servicetracking({super.key});

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
              MaterialPageRoute(builder: (context) => const Homepage()),
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
            "Order Tracking",
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
                height: 500, // Set the height here
                child: OrderTracker(
                  status: Status.shipped,
                  activeColor: Colors.red[400],
                  inActiveColor: Colors.white,
                  orderTitleAndDateList: orderList,
                  shippedTitleAndDateList: shippedList,
                  outOfDeliveryTitleAndDateList: outOfDeliveryList,
                  deliveredTitleAndDateList: deliveredList,
                ),
              ),
            ),
          const SizedBox(
            height: 15, // Add this line to add space between the text fields
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
  TextDto("The delivery partner is out for pickup", ""),
  TextDto("Your item has been picked up by delivery partner.", ""),
];

List<TextDto> shippedList = [
  TextDto("Your item has been received in the nearest hub to you.", null),
  TextDto("Your laundry order is currently being prepared and will soon be ready for delivery.", null),
];

List<TextDto> outOfDeliveryList = [
  TextDto("Your laundry order is currently out for delivery.",""),
];

List<TextDto> deliveredList = [
  TextDto("Your laundry order has been delivered successfully. We value your feedback!", ""),
];