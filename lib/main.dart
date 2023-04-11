import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gmail_login/services/firebase_services.dart';

import 'homePage.dart';


void main() async{

  /* This line ensures that the app's bindings are initialized before running the app. Bindings are the connections between the
     Flutter framework and the underlying platform. This line is necessary for any Flutter app that uses widgets.*/
     WidgetsFlutterBinding.ensureInitialized();

  /* This line initializes Firebase, a backend platform commonly used in Flutter apps. The await keyword is used because
     Firebase.initializeApp() returns a Future.*/
     await Firebase.initializeApp();
     runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(

        // Button for login
        /* This widget provides an ink splash effect when the user taps on it.
           It is used to wrap the login button and make it interactive.*/
        child: InkWell(

          /*This line sets a callback function that is called when the user taps on the login button.
            It uses the FirebaseServices class to sign in with Google and then navigates to the HomePage using Navigator.push.*/
          onTap: () async{
            await FirebaseServices().signInWithGoogle();
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Container(
            height: 70,
            width: 250,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child:  Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //This line displays an image of the Google logo that is loaded from a network URL.
                    Image.network("https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png"),
                    const Text(
                        "Login with Gmail",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                           // fontFamily: 'Playfair'
                        )
                    )
                  ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

