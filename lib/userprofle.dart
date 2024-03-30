import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sample/Firebase_Auth/database.dart';
import 'Firebase_Auth/session_manager.dart';
import 'bookservice.dart';
import 'common/toast.dart';
import 'servicehistory.dart';
import 'Homepage.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();// initialize Flutter binding
  runApp(const MaterialApp(
    home: userprofile(),
  ));
}

class userprofile extends StatefulWidget {
  const userprofile({super.key});

  @override
  State<userprofile> createState() => _userprofileState();
}

class _userprofileState extends State<userprofile> {

  final ref = FirebaseFirestore.instance.collection('User').doc(SessionController().userId);

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _mobilenocontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  String? userId = SessionController().userId;
  // String? name = SessionController().name;

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
        leading: null,
      ),
      body:Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 8),
                alignment: Alignment.centerLeft,
                child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: ref.snapshots(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      final userData = snapshot.data!.data();
                      _namecontroller.text = userData?['Name'] ?? '';
                      _mobilenocontroller.text = userData?['Mobile No'] ?? '';
                      _addresscontroller.text = userData?['Address'] ?? '';
                      _emailcontroller.text = userData?['Email'] ?? '';
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10, // Add this line to add space between the text fields
                          ),
                          const Text(
                            "User Profile",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10, // Add this line to add space between the text fields
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 78, // Change this radius for the width of the circular border
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 75, // This radius is the radius of the picture in the circle avatar itself.
                                    backgroundImage: AssetImage(
                                      'Assets/usericon.png',
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   width: 190,
                                //   child: OutlinedButton(
                                //     onPressed: () {
                                //       // Navigator.pushReplacement(
                                //       //   context,
                                //       //   MaterialPageRoute(builder: (context) => login()),
                                //       // );
                                //       // Add your on pressed event here
                                //     },
                                //     style: OutlinedButton.styleFrom(
                                //       foregroundColor: Colors.red[400], shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(30),
                                //     ),
                                //       fixedSize: const Size(150, 48), // Set the width and height of the button here
                                //     ),
                                //     child: const Text(
                                //       'Update Picture',
                                //       style: TextStyle(
                                //         fontSize: 20.0, // Increase the font size here
                                //         fontFamily: 'Roboto',
                                //         fontWeight: FontWeight.bold,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          const Text(
                            "Name:",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            width: 370,
                            child: TextField(
                              controller: _namecontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: 'Name',
                                labelStyle: const TextStyle(
                                  fontSize: 10.0,
                                  fontFamily: 'Roboto',
                                ),
                                constraints: const BoxConstraints(
                                  minHeight: 40, // You can adjust this value to decrease or increase the height
                                  maxHeight: 40, // You can adjust this value to decrease or increase the height
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                prefixIcon: Icon(MdiIcons.account),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20, // Add this line to add space between the text fields
                          ),
                          const Text(
                            "Mobile Number:",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            width: 370,
                            child: TextField(
                              controller: _mobilenocontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: 'Mobile Number',
                                labelStyle: const TextStyle(
                                  fontSize: 10.0,
                                  fontFamily: 'Roboto',
                                ),
                                constraints: const BoxConstraints(
                                  minHeight: 40, // You can adjust this value to decrease or increase the height
                                  maxHeight: 40, // You can adjust this value to decrease or increase the height
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                prefixIcon: Icon(MdiIcons.phone),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),// Limit input to 10 characters
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20, // Add this line to add space between the text fields
                          ),
                          const Text(
                            "Address & Pincode:",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            width: 370,
                            child: TextField(
                              controller: _addresscontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: 'Address & Pincode',
                                labelStyle: const TextStyle(
                                  fontSize: 10.0,
                                  fontFamily: 'Roboto',
                                ),
                                constraints: const BoxConstraints(
                                  minHeight: 40, // You can adjust this value to decrease or increase the height
                                  maxHeight: 40, // You can adjust this value to decrease or increase the height
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                prefixIcon: Icon(MdiIcons.mapMarker),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20, // Add this line to add space between the text fields
                          ),
                          const Text(
                            "Email Address:",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            width: 370,
                            child: TextField(
                              controller: _emailcontroller,
                              readOnly: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                labelText: 'Email Address',
                                labelStyle: const TextStyle(
                                  fontSize: 10.0,
                                  fontFamily: 'Roboto',
                                ),
                                constraints: const BoxConstraints(
                                  minHeight: 40, // You can adjust this value to decrease or increase the height
                                  maxHeight: 40, // You can adjust this value to decrease or increase the height
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                prefixIcon: Icon(MdiIcons.email),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20, // Add this line to add space between the text fields
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 185,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      String? userId = SessionController().userId;
                                      if (userId != null) {
                                        Map<String, dynamic> updateInfo = {
                                          "UID": userId,
                                          "Name": _namecontroller.text,
                                          "Mobile No": _mobilenocontroller.text,
                                          "Address": _addresscontroller.text,
                                        };
                                        await DatabaseMethods().updateUserDetails(updateInfo, userId).then((value) {});
                                        showToast(message:"User Info Succesfully Updated.");
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      fixedSize: const Size(150, 48), // Set the width and height of the button here
                                    ),
                                    child: const Text(
                                      'Update Profile',
                                      style: TextStyle(
                                        fontSize: 18.0, // Increase the font size here
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 185,
                                  child: OutlinedButton(
                                    onPressed: resetpassword,
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.red[400], shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                      fixedSize: const Size(150, 48), // Set the width and height of the button here
                                    ),
                                    child: const Text(
                                      'Reset Password',
                                      style: TextStyle(
                                        fontSize: 18.0, // Increase the font size here
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20, // Add this line to add space between the text fields
                          ),
                          SizedBox(
                            width: 370,
                            child: OutlinedButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                                showToast(message:"User is Signout Succesfully.");
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const login()),
                                );
                                // Add your on pressed event here
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.red[400], shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                                fixedSize: const Size(150, 48), // Set the width and height of the button here
                              ),
                              child: const Text(
                                'Logout',
                                style: TextStyle(
                                  fontSize: 18.0, // Increase the font size here
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20, // Add this line to add space between the text fields
                          ),
                        ],
                      );
                    } else {
                      return const Center(child: Text('No data'));
                    }
                  },
                ),

              ),
            ),
          ),
          Container(
            color: Colors.red[400],
            alignment: Alignment.center,
            height: 55.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your on pressed event here
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Homepage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(98, 50), // Set the width and height of the button here
                  ),
                  child: const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your on pressed event here
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const bookservice()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(98, 50), // Set the width and height of the button here
                  ),
                  child: const Text(
                    'Book',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your on pressed event here
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const serivcehistory()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(98, 50), // Set the width and height of the button here
                  ),
                  child: const Text(
                    'History',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your on pressed event here
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const userprofile()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(98, 50), // Set the width and height of the button here
                  ),
                  child: const Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Future<void> resetpassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail( email: _emailcontroller.text.trim());
      showToast(message: "Reset Password Email Sent.");
    }
    on FirebaseAuthException catch (e){
      print(e);
      showToast(message: 'Some Error Occured. ${e.code}');
    }
  }
}