
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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

  String? orderStatus;
  late Status status;
  String? orderDate;
  String? orderPDate;

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
    getOrderStatus();
  }

  Future<void> getOrderStatus() async {
    final db = FirebaseFirestore.instance;
    final orderSnapshot =
    await db.collection('Order').doc(widget.orderId).get();

    if (orderSnapshot.exists) {
      setState(() {
        orderStatus = orderSnapshot.data()?['orderStatus'];
        var orderDateTime = orderSnapshot.data()?['Order Date and Time'].toDate();
        if (orderDateTime != null) {
          orderDate = DateFormat.yMMMd().format(orderDateTime);
        }
        var orderTimestamp = orderSnapshot.data()?['timestamp'];
        if (orderTimestamp != null) {
          orderPDate = DateFormat.yMMMd().format(orderTimestamp.toDate());
        }

        //orders
        //male
        mtshirt = orderSnapshot.data()?['mtshirt'] as int?;
        mshirt = orderSnapshot.data()?['mshirt']as int?;
        mpant = orderSnapshot.data()?['mpant']as int?;
        msuits = orderSnapshot.data()?['msuits']as int?;
        mtraditional = orderSnapshot.data()?['mtraditional']as int?;

        //female
        ftshirt = orderSnapshot.data()?['ftshirt'] as int?;
        fkurta = orderSnapshot.data()?['fkurta']as int?;
        fpant = orderSnapshot.data()?['fpant']as int?;
        fsaree = orderSnapshot.data()?['fsaree']as int?;

        //kids
        ktshirt = orderSnapshot.data()?['ktshirt']as int?;
        kshirt = orderSnapshot.data()?['kshirt']as int?;
        kpant = orderSnapshot.data()?['kpant']as int?;
        ktoddler = orderSnapshot.data()?['ktoddler']as int?;
        kethinic = orderSnapshot.data()?['kethinic']as int?;

        if (orderStatus == 'Ordered') {
          status = Status.order;
        } else if (orderStatus == 'Shipped') {
          status = Status.shipped;
        } else if (orderStatus == 'Outfordelivery') {
          status = Status.outOfDelivery;
        } else if (orderStatus == 'Delivered') {
          status = Status.delivered;
        } else {
          status = Status.order;
        }

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
            data: IconThemeData(color: Colors.white),
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
      SingleChildScrollView(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20, // Add this line to add space between the text fields
          ),
          Center(
            child: Column(
              children: const [
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
                Text(
                  'Order ID:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  widget.orderId,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10, // Add this line to add space between the text fields
                ),
                Text(
                  'Order Status: $orderStatus',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10, // Add this line to add space between the text fields
                ),
                Text(
                  'Order Booked: $orderPDate',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10, // Add this line to add space between the text fields
                ),
                Text(
                  'Order Pickup: $orderDate',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10, // Add this line to add space between the text fields
                ),
                Text(
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
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (mshirt != null)
                              Text(
                                'Men Shirt: $mshirt',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (mpant != null)
                              Text(
                                'Men Pants/Shorts: $mpant',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (msuits != null)
                              Text(
                                'Men Suits/Blazers: $msuits',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (mtraditional != null)
                              Text(
                                'Men Traditional: $mtraditional',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),

                            if (ftshirt != null)
                              Text(
                                'Female T-Shirt: $ftshirt',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (fkurta != null)
                              Text(
                                'Female Kurtas: $fkurta',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (fpant != null)
                              Text(
                                'Female Pants/Shorts: $fpant',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (fsaree != null)
                              Text(
                                'Female Sarees: $fsaree',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),

                            if (ktshirt != null)
                              Text(
                                'Kids T-shirts: $ktshirt',
                                style:TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (kshirt != null)
                              Text(
                                'Kids Shirts: $kshirt',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (kpant != null)
                              Text(
                                'Kids Pants/Shorts: $kpant',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (ktoddler != null)
                              Text(
                                'Kids (Toddlers): $ktoddler',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (kethinic != null)
                              Text(
                                'Kids Ethinic: $kethinic',
                                style: TextStyle(
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
          SizedBox(
            height: 25, // Add this line to add space between the text fields
          ),
          Text(
            "Order Current Status",
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
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
          SizedBox(
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