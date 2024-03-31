
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sample/servicehistory.dart';
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

  const Servicetracking({super.key, required this.orderId});

  @override
  State<Servicetracking> createState() => _ServicetrackingState();
}

class _ServicetrackingState extends State<Servicetracking> {
  @override
  Widget build(BuildContext context) {
    if (widget.orderId.isNotEmpty) {
      return TrackingScreen(orderId: widget.orderId);
    } else {
      return const Center(
        child: Text('No order ID provided'),
      );
    }
  }
}

class TrackingScreen extends StatefulWidget {
  final String orderId;

  const TrackingScreen({super.key, required this.orderId});

  @override
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {

  String? orderStatus;
  String? orderDate;
  String? orderPDate;
  late Status status;
  bool isLoading = true;

  //orders
  //male
  int? mtshirt;
  int? mshirt;
  int? mpant;
  int? msuits;
  int? mtraditional;

  //female
  int? ftshirt;
  int? fkurta;
  int? fpant;
  int? fsaree;

  //kids
  int? ktshirt;
  int? kshirt;
  int? kpant;
  int? ktoddler;
  int? kethinic;



  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      getOrderStatus();
    });
  }

  @override
  void dispose() {
    // Call the super.dispose method to clean up the State object
    super.dispose();
  }


  Future<void> getOrderStatus() async {
    final db = FirebaseFirestore.instance;
    final orderSnapshot =
    await db.collection('Order').doc(widget.orderId).get();

    if (orderSnapshot.exists) {
      final orderData = orderSnapshot.data();
      final orderDateTime = orderData?['Order Date and Time'].toDate();
      final orderTimestamp = orderData?['timestamp'];

      // Update the state with non-nullable values
      setState(() {
        orderStatus = orderData?['orderStatus'];
        orderDate = DateFormat.yMMMd().format(orderDateTime!);
        orderPDate = DateFormat.yMMMd().format(orderTimestamp!.toDate());

        mtshirt = orderData?['mtshirt'] as int?;
        mshirt = orderData?['mshirt'] as int?;
        mpant = orderData?['mpant'] as int?;
        msuits = orderData?['msuits'] as int?;
        mtraditional = orderData?['mtraditional'] as int?;

        ftshirt = orderData?['ftshirt'] as int?;
        fkurta = orderData?['fkurta'] as int?;
        fpant = orderData?['fpant'] as int?;
        fsaree = orderData?['fsaree'] as int?;

        ktshirt = orderData?['ktshirt'] as int?;
        kshirt = orderData?['kshirt'] as int?;
        kpant = orderData?['kpant'] as int?;
        ktoddler = orderData?['ktoddler'] as int?;
        kethinic = orderData?['kethinic'] as int?;


        if (orderStatus != null) {
          if (orderStatus == 'Ordered') {
            status = Status.order;
          } else if (orderStatus == 'Shipped') {
            status = Status.shipped;
          } else if (orderStatus == 'outOfDelivery') {
            status = Status.outOfDelivery;
          } else if (orderStatus == 'Delivered') {
            status = Status.delivered;
          }
        }
        isLoading = false;
      });
    }
  }

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
              color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: IconTheme(
            data: const IconThemeData(color: Colors.white),
            child: Icon(MdiIcons.pagePreviousOutline),
          ),
          onPressed: () {
            // Add your onPressed event here
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const serivcehistory()),
            );
          },
        ),
      ),
      body:
      isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      ):
      SingleChildScrollView(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20, // Add this line to add space between the text fields
          ),
          const Center(
            child: Column(
              children: [
                Text(
                  "Order Details",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15, // Add this line to add space between the text fields
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Order ID:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  widget.orderId,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10, // Add this line to add space between the text fields
                ),
                Text(
                  'Order Status: $orderStatus',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10, // Add this line to add space between the text fields
                ),
                Text(
                  'Order Booked: $orderPDate',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10, // Add this line to add space between the text fields
                ),
                Text(
                  'Order Pickup: $orderDate',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10, // Add this line to add space between the text fields
                ),
                const Text(
                  'Order List:',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                            if (mtshirt != null)
                              Text(
                                'Men T-Shirt: $mtshirt',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (mshirt != null)
                              Text(
                                'Men Shirt: $mshirt',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (mpant != null)
                              Text(
                                'Men Pants/Shorts: $mpant',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (msuits != null)
                              Text(
                                'Men Suits/Blazers: $msuits',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (mtraditional != null)
                              Text(
                                'Men Traditional: $mtraditional',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),

                            if (ftshirt != null)
                              Text(
                                'Female T-Shirt: $ftshirt',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (fkurta != null)
                              Text(
                                'Female Kurtas: $fkurta',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (fpant != null)
                              Text(
                                'Female Pants/Shorts: $fpant',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (fsaree != null)
                              Text(
                                'Female Sarees: $fsaree',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),

                            if (ktshirt != null)
                              Text(
                                'Kids T-shirts: $ktshirt',
                                style:const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (kshirt != null)
                              Text(
                                'Kids Shirts: $kshirt',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (kpant != null)
                              Text(
                                'Kids Pants/Shorts: $kpant',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (ktoddler != null)
                              Text(
                                'Kids (Toddlers): $ktoddler',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (kethinic != null)
                              Text(
                                'Kids Ethinic: $kethinic',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          ),
              ],
            ),
          ),
          const SizedBox(
            height: 25, // Add this line to add space between the text fields
          ),
          const Text(
            "Order Current Status",
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
              height: 320, // Set the height here
              child: OrderTracker(
                status: status,
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
          const SizedBox(
            height: 30, // Add this line to add space between the text fields
          ),
        ],
      ),
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

