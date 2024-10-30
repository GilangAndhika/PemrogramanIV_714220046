import 'package:flutter/material.dart';
import 'package:praktikum_p3/latihan.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page!'),
      ),

      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(title: Text('Home Page')),
            ListTile(title: Text('About Page')),
          ],
        ),
      ),

      body: const MyLatihan(),

      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ]),
    );
  }
}

class Heading extends StatelessWidget {
  final String text; // State teks bersifat final

  const Heading({Key? key, required this.text}) : super(key: key);
  // Kemudian state teks masuk ke dalam konstruktor

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      )
    );
  }
}

class BiggerText extends StatefulWidget {
  final String text;

  const BiggerText({Key? key, required this.text}) : super(key: key);

  @override
  State<BiggerText> createState() => _BiggerTextState();
}

class _BiggerTextState extends State<BiggerText> {
  double _textSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.text,
          style: TextStyle(fontSize: _textSize),
        ),

      ElevatedButton(
        child: Text(_textSize == 16.0? 'Perbesar' : 'Perkecil'),
        onPressed: () {
          setState(() {
            _textSize = _textSize == 16.0? 32.0 : 16.0;
          });
        },
      ),
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,

      decoration: BoxDecoration(
        color: Colors.blue,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(3, 6),
            blurRadius: 10,
          ),
        ],
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1),
        ),

      width: 100,
      height: 100,

      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),

      child: const Text(
        'Hi',
        style: TextStyle(fontSize: 40),
      ),
      
    );
  }
}

class MyPadding extends StatelessWidget {
  const MyPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30),
      child: Text('Ini Padding'),
    );
  }
}

class MyCenter extends StatelessWidget {
  const MyCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Text berada di tengah'),
    );
  }
}

class MySizedBox extends StatelessWidget {
  const MySizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Ini Judul',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text('Universtitas Logistik dan Bisnis Internasional (ULBI)'),
      ],
    );
  }
}

class MyRow extends StatelessWidget {
  const MyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(Icons.share),
        Icon(Icons.thumb_up),
        Icon(Icons.thumb_down),
      ],
    );
  }
}
