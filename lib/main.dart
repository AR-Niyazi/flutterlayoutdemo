import 'dart:html';

import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded
              /*1*/
              (
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey[500]
                  ),
                ),
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'Call'),
          _buildButtonColumn(color, Icons.near_me, 'Route'),
          _buildButtonColumn(color, Icons.share, 'Share'),
        ],
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter layout demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/8b9d3b4.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Bl??emlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );

  Column _buildButtonColumn(
    Color color,
    IconData icon,
    String label,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }

}
