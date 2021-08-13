# rating_widget

A simple and customizable Flutter rating widget package.

## Usage

[Example] (https://github.com/Destiny-Ed/rating_widget/blob/main/example/example.dart)

To use this package : add the dependency to your [pubspec.yaml] file

```yaml
dependencies:
  flutter:
    sdk: flutter
  rating_widget:
```

## Add to your dart file

```dart

import 'package:flutter/material.dart';
import 'package:rating_widget/rating_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rating Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Rating Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _horizontalStar = 0;
  int _verticalSstar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Column(
        children: [
          //Horizontal Rating Bar
          Rating(
            rating: 6,
            onRatingSelected: (value) {
              setState(
                () {
                  _horizontalStar = value!;
                },
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Text("$_horizontalStar"),

          const SizedBox(
            height: 50,
          ),

          //Vertical Rating 8 Bar with a different Icon and Color
          Rating(
            rating: 8,
            onRatingSelected: (value) {
              setState(() {
                _verticalSstar = value!;
              });
            },
            horizontal: false,
            selectedColor: Colors.red,
            unSelectedColor: Colors.blue,
            selectedIcon: Icons.category_sharp,
            unSelectedIcon: Icons.category_outlined,
          ),
          const SizedBox(
            height: 10,
          ),
          Text("$_verticalSstar"),
        ],
      ),
    );
  }
}

```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
