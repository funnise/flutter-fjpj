import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_demo/components/ui/pages/LoginPage.dart';
import 'package:flutter_demo/components/ui/pages/UserProfilePage.dart';
import 'package:flutter_demo/firebase/firestore.dart';
import 'package:flutter_demo/firebase/index.dart';
import 'package:flutter_demo/provider/CounterProvider.dart';
import 'package:flutter_demo/provider/UserProvider.dart';
import 'package:provider/provider.dart';
import 'components/ui/atoms/CircularProgress.dart';
import 'components/ui/pages/HomePage.dart';
import 'firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
  final userDataSnapshot =
      await FirebaseFirestoreService().getFirestoreProfile('123456');
  return userDataSnapshot;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder<User?>(
            stream: auth.authStateChanges(),
            builder: ((context, snapshot) {
              final UserProvider userProvider =
                  Provider.of<UserProvider>(context, listen: true);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgress();
              }
              if (snapshot.hasData) {
                getUserData().then((value) {});
                final String userId = snapshot.data!.uid;
                userProvider.setUserId(userId ?? "");
                return const HomePage();
              }
              return const LoginPage();
            })),
        routes: {
          '/home': ((context) => const HomePage()),
          '/profile': ((context) => const UserProfilePage()),
        },
      ),
    );
  }
}

class CountProvider {}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
