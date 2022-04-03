import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final ArrowIcon = 'assets/back-arrow.svg';
final Widget svg = SvgPicture.asset(
  ArrowIcon,
  semanticsLabel: 'Back',
);

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(children: [
          IconButton(
              onPressed: () => print("123"),
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black),
          Text('voltar', style: TextStyle(color: Colors.black))
        ]),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
    );
  }
}
