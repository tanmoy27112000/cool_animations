import 'package:cool_animations/cool_animations.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BounceWidget(
              onTap: (val) {
                // ignore: avoid_print
                print(val);
              },
            ),
            RotateWidget(
              onTap: (val) {
                // ignore: avoid_print
                print(val);
              },
              inactiveIcon: Icons.hourglass_empty_rounded,
              activeIcon: Icons.hourglass_full_rounded,
              activeColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
