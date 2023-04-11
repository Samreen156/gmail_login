# gmail_login


A new Flutter project. Informative and well commented project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Setup on Firebase 

1. Go to link https://console.firebase.google.com/  and create project.
   Give the name of project. Enable google analytics for project.
   Select Default Account for Firebase and Continue.
2. https://console.firebase.google.com/project/login-43131/overview  on this link go to 
   Build -> Authentication -> Get Started -> Sign-in method -> Sign in providers -> Additional providers -> Google 
3. Enable Google Auth and select project support email.
4. Go to Project Overview(on Sidebar) -> Android(logo) -> (Add firebase to our Android project -> 
   https://console.firebase.google.com/project/login-43131/overview) here register our app
5. For SHA-1 Key go to our project terminal -> type -> cd android -> .\gradlew signingReport this gives SHA key.
6. Download google-services.json file add in project app level directory.
7. Add Firebase plugins and dependencies in build.gradle files. where minSdkVersion 21 and targetSdkVersion is 33.
8. Run Application check gradle is work or not.
9. If gradle is not work proper that is error on Properties() in gradle.build(app file) then go to 
   File -> Project Structure -> Problem -> select SDK as per requirement. Now run the App and check gradle successfully run or not.

##  Coming to our flutter project
1. Add packages firebase_auth, firebase core and google_sign_in in pubspec.yaml file. Run Application with pub get.
2. Create Service of Firebase i.e FirebseServices class. This class FirebaseServices contains methods for signing in and out with
   Firebase using Google authentication.
3. The FirebaseServices class provides a convenient way to handle Firebase authentication in Flutter apps.
4. In main method,  initializes the Flutter app and Firebase, a backend platform commonly used in Flutter apps. It first ensures that the app's bindings are initialized before
   running the app, which establishes the connections between the Flutter framework and the underlying platform. Then, it initializes Firebase using Firebase.initializeApp() 
   and waits for it to complete before running the app using runApp(). The const keyword is used with MyApp() to create a constant instance of the MyApp widget, which is then passed to runApp().
5. There are Two Stateful classes Login MyLoginPage and HomePage. In which
6. MyLoginPage class provides a simple and effective way for users to sign in with Google, and the code is easy to read and understand.
7. HomePage class provides a simple user interface for the user to view their profile information and log out of their account.





