import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'common/toast.dart';
import 'main.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();// initialize Flutter binding
  runApp(const MaterialApp(
    home: forgetpassword(),
  ));
}

class forgetpassword extends StatefulWidget {
  const forgetpassword({super.key});

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {

  final TextEditingController _emailcontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailcontroller.dispose();
    super.dispose();
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
          ),
        ),
        centerTitle: true,
        leading: null,
      ),
      body: SingleChildScrollView(
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 235, // Add this line to add space between the text fields
            ),
            const Text(
              "Reset Password",
              style: TextStyle(
                fontSize: 35.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10, // Add this line to add space between the text fields
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: 'Email Id',
                  labelStyle: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15, // Add this line to add space between the text fields
            ),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: resetpassword,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    fixedSize: const Size(00, 48), // Set the width and height of the button here
                  ),
                  child: const Text(
                    'Email To Reset Password',
                    style: TextStyle(
                      fontSize: 22.0, // Increase the font size here
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ),
            const SizedBox(
              height: 15, // Add this line to add space between the text fields
            ),
          ],
        ),
      ),
    ),
    );
  }


  Future<void> resetpassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail( email: _emailcontroller.text.trim());
      showToast(message: "Reset Password Email Sent.");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const login()),
      );
    }
    on FirebaseAuthException catch (e){
      print(e);
      showToast(message: 'Some Error Occured. ${e.code}');
    }
    }


}