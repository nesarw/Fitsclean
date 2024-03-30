// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:uuid/uuid.dart';
//
// class OrderItem {
//   final String itemName;
//   final int quantity;
//
//   OrderItem({required this.itemName, required this.quantity});
// }
//
// class Order {
//   final String orderId;
//   final String userId;
//   final List<OrderItem> orderList;
//   final Timestamp timestamp;
//
//   Order({required this.orderId, required this.userId, required this.orderList, required this.timestamp});
//
//   Map<String, dynamic> toMap() {
//     return {
//       'orderId': orderId,
//       'userId': userId,
//       'orderList': orderList.map((item) => item.toMap()).toList(),
//       'timestamp': timestamp,
//     };
//   }
// }
//
// void placeOrder(String userId, List<OrderItem> orderList) {
//   // Generate a unique order ID
//   String orderId = const Uuid().v4();
//
//   // Get the current timestamp
//   Timestamp timestamp = Timestamp.now();
//
//   // Create a new order object
//   Order order = Order(
//     orderId: orderId,
//     userId: userId,
//     orderList: orderList,
//     timestamp: timestamp,
//   );
//
//   // Store the order in the Firestore database
//   FirebaseFirestore.instance.collection('Orders').doc(orderId).set(order.toMap());
// }