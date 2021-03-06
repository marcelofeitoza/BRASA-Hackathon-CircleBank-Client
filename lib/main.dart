import 'package:circlebankapp/screens/BankBalance.dart';
import 'package:circlebankapp/screens/BankCards.dart';
import 'package:circlebankapp/screens/BankStatement.dart';
import 'package:circlebankapp/screens/BankingSettings.dart';
import 'package:circlebankapp/screens/FinancingScreen.dart';
import 'package:circlebankapp/screens/Home.dart';
import 'package:circlebankapp/screens/OpenBankingSettings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/balance': (context) => const BankBalance(),
        '/cards': (context) => const BankCards(),
        '/banking-settings': (context) => const OpenBankingSettings(),
        '/statements': (context) => const BankStatement(),
        '/financing': (context) =>
            const FinancingScreen(screen_configuration: "financing"),
        '/loans': (context) =>
            const FinancingScreen(screen_configuration: "loans"),
      },
    );
  }
}
