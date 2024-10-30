import 'package:flutter/material.dart';

class MyLatihan extends StatelessWidget {
  const MyLatihan({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        // First Row
        Center(
          child: Text('MainAxisAlignment.spaceEvenly'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20),
        ),

        // Second Row
        Center(
          child: Text('MainAxisAlignment.spaceAround'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20),
        ),

        // Third Row
        Center(
          child: Text('MainAxisAlignment.spaceBetween'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20),
        ),

        // Fourth Row
        Center(
          child: Text('MainAxisAlignment.start'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20),
        ),

        // Fifth Row
        Center(
          child: Text('MainAxisAlignment.center'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20),
        ),

        // Sixth Row
        Center(
          child: Text('MainAxisAlignment.end'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20),
        ),
      ],

    );
  }
}