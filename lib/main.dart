import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sample/common/toast.dart';
import 'CreateAccount.dart';
import 'Firebase_Auth/firebase_auth_services.dart';
import 'Homepage.dart';
import 'forgetpassword.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();// initialize Flutter binding
  runApp(const MaterialApp(
    home: login(),
  ));
}

class login extends StatefulWidget {
  const login({super.key});
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
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
              height: 20, // Add this line to add space between the text fields
            ),
            const SizedBox(
              width: 400,
              height: 220, // Set the height of the image here
              child: Image(
                image: AssetImage("Assets/HDesign.png"),
              ),
            ),
            const Text(
              "Login",
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
              child: TextField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: 'Email Address',
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
              child: TextField(
                controller: _passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(MdiIcons.eye),// Add this line to add the password show icon
                    onPressed: () {
                      // Add your on pressed event here
                    },
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
                  onPressed: _signIn,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    fixedSize: const Size(00, 48), // Set the width and height of the button here
                  ),
                  child: const Text(
                    'Login',
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
            SizedBox(
                width: 300,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const CreateAccount()),
                    );
                    // Add your on pressed event here
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red[400], shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    fixedSize: const Size(00, 48), // Set the width and height of the button here
                  ),
                  child: const Text(
                    "Don't Have a Account? Sign Up",
                    style: TextStyle(
                      fontSize: 18.0, // Increase the font size here
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ),
            const SizedBox(
              height: 10, // Add this line to add space between the text fields
            ),
            const Text(
              "----------------------Or----------------------",
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 10, // Add this line to add space between the text fields
            ),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const forgetpassword()),
                    );
                    // Add your on pressed event here
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    fixedSize: const Size(00, 48), // Set the width and height of the button here
                  ),
                  child: const Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      fontSize: 18.0, // Increase the font size here
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    ),
    );
  }

  void _signIn() async {
    String email = _emailcontroller.text;
    String password = _passwordcontroller.text;

    User? user = await _auth.signInwithEmailAndPassword(email, password);

    if (user != null){
      showToast(message:"User is Signedin Successfully.");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    }
    else {
      showToast(message:"Some Error Occured...");
    }
  }
}