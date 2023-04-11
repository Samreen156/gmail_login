import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmail_login/main.dart';
import 'package:gmail_login/services/firebase_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //The CircleAvatar widget displays the user's profile picture retrieved from the FirebaseAuth instance
            CircleAvatar(
              radius: 50, // Adjust the radius to change the size of the circle
              backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),
            ),

            const SizedBox(height: 30),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("UserId: ${FirebaseAuth.instance.currentUser!.uid}",
                    style: const TextStyle(
                      fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,
                      //fontFamily: 'Playfair'
                    )),
                const SizedBox(height: 10),

                //The Text widgets display the user's name and email address, also retrieved from the FirebaseAuth instance.
                Text("Username: ${FirebaseAuth.instance.currentUser!.displayName}",
                    style: const TextStyle(
                      fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,
                      //fontFamily: 'Playfair'
                    )),
                const SizedBox(height: 10),


                Text("Email: ${FirebaseAuth.instance.currentUser!.email}",
                    style: const TextStyle(
                      fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,
                      //fontFamily: 'Playfair'
                    )),
                const SizedBox(height: 10),


                Text("Contact no: ${FirebaseAuth.instance.currentUser!.phoneNumber}",
                    style: const TextStyle(
                      fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,
                      //fontFamily: 'Playfair'
                    )),

                const SizedBox(height: 10),
                Text("Email Verification: ${FirebaseAuth.instance.currentUser!.emailVerified  ? "Verified" : "Not Accepted"}",
                    style: const TextStyle(
                      fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,
                      //fontFamily: 'Playfair'
                    )),

                const SizedBox(height: 10),


                Text("Creation Time: ${FirebaseAuth.instance.currentUser!.metadata.creationTime}",
                    style: const TextStyle(
                      fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,
                      //fontFamily: 'Playfair'
                    )),
                const SizedBox(height: 10),

                Text("Last Sign-in Time: ${FirebaseAuth.instance.currentUser!.metadata.lastSignInTime}",
                    style: const TextStyle(
                      fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,
                      //fontFamily: 'Playfair'
                    )),
              ],
            ),


             const SizedBox(height: 30),

            // When the user taps the InkWell widget, the FirebaseServices method signOut is called to log the user out of their account.
            InkWell(
              onTap: () async{
                await FirebaseServices().signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyLoginPage()));
              },
              child: Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child:  const Center(
                  child: Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        //  fontFamily: 'Playfair'
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
