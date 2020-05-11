import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  @override
  _HomState createState() => _HomState();
}

class _HomState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[400],
      appBar: AppBar(
        title: Text(
          'KnowMe',
          style: TextStyle(
            color: Colors.yellow[400],
            fontWeight: FontWeight.bold,
            fontFamily: 'DancingScript',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Text(
                'Don\'t you want to know me? :3 \n IF so then fill me ;)',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DancingScript',
                ),
              ),
            ),
          ),
          SizedBox(height: 100),
          RaisedButton.icon(
            color: Colors.grey[900],
              onPressed: () {
                Navigator.pushNamed(context, '/form_screen');
               
              },
              icon: Icon(Icons.assessment, color: Colors.yellow[400],),
              label: Text(
                'Fill me',
                style: TextStyle(color: Colors.yellow[400], fontSize: 16,fontFamily: 'DancingScript', fontWeight: FontWeight.bold),
              )),
        ],
      )),
    );
  }
}
