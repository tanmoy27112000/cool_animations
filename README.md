# Simple Form Builder
[![pub package](https://img.shields.io/pub/v/simple_form_builder.svg)](https://pub.dev/packages/simple_form_builder)
[![GitHub Stars](https://img.shields.io/github/stars/tanmoy27112000/SimpleFormBuilder.svg?logo=github)](https://pub.dev/packages/simple_form_builder)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20IOS%20%7C%20Web-green)](https://img.shields.io/badge/Platform-Android%20%7C%20IOS%20%7C%20Web-green)

A simple, colorful and fluid animations built with flutter

Maintainer : [Tanmoy Karmakar](https://tanmoykarmakar.in)<br>


### Specs
<!-- [![pub](https://img.shields.io/pub/v/flash.svg?style=flat)](https://pub.dev/packages/flash) -->


This library allows you easily implement bottom navigation with many customizable fields to make it your own
<!-- multiple types of fields `text` , `checkbox`, `multiselect` , `datetime` , `date` , `time` , and `file upload`.
This package also provides additional remark options. -->

It has been written **100% in Dart**. ❤️

<p>
  <img width="205px" alt="Example" src="https://i.imgur.com/3uxKgfr.mp4"/>
</p>


<br>

## Installing
Add the following to your `pubspec.yaml` file:
```yaml
dependencies:
   cool_animations: ^0.0.1
```

<br>

## Sample code

```
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


```

<br>

## Simple Usage

To integrate the simple bottom navigation bar just implement it with the following code


## Custom Usage
There are several options that allow for more control:

|  Properties  |   Description   |
|--------------|-----------------|
| `inavtiveColor` | color of the icon when inactive |
| `activeColor` | color of the icon when active |
| `inactiveSize` | Size of the icon when inactive |
| `activeSize` | Size of the icon when active |
| `curve` | Curved followed by the icon during animation |
| `duration` | Duration of the icon during animation |
| `activeIcon` | icon when active |
| `inactiveIcon` | icon when inactive |
| `onTap` | function called when the icon is tapped |
<br>