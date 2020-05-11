import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuto/infos.dart';

class PrintPage extends StatefulWidget {
  @override
  _PrintPageState createState() => _PrintPageState(); //paperInfo
}

class _PrintPageState extends State<PrintPage> {
  Infos data = Infos();
  String image = 'assets/me.jpg';

  _accordPicture() {
    if (data.gender == 1) {
      setState(() {
        image = 'assets/women_avatar.png';
      });
    } else {
      setState(() {
        image = 'assets/men_avatar.png';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments as Infos;
    print('mail:${data.email} ');
    _accordPicture();

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
        body: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 20.0, 10.0, 0.0),
          child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[700],
                    backgroundImage: AssetImage('$image'),
                    radius: 40.0,
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${data.famillyName}',
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'DancingScript',
                              letterSpacing: 2.0),
                        ),
                        SizedBox(width: 15),
                        Text(
                          '${data.firstName}',
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'DancingScript',
                              letterSpacing: 2.0),
                        ),
                      ]),
                ),
                Divider(
                  height: 30.0,
                  color: Colors.transparent,
                ),
                Row(children: <Widget>[
                  Text(
                    'Email:',
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'DancingScript',
                        letterSpacing: 2.0),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '${data.email}',
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'DancingScript',
                        letterSpacing: 2.0),
                  ),
                  RaisedButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: data.email));
                      },
                      color: Colors.grey[900],
                      child: Text(
                        'Copy email',
                        style: TextStyle(
                            color: Colors.yellow[400],
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DancingScript',
                            letterSpacing: 1.0),
                      ))
                ]),
                Divider(
                  height: 30.0,
                  color: Colors.transparent,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Phone Number:',
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DancingScript',
                            letterSpacing: 2.0),
                      ),
                      Text(
                        '${data.phoneNumber}',
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DancingScript',
                            letterSpacing: 2.0),
                      ),
                      SizedBox(width: 50.0),
                    ]),
                Divider(
                  height: 30.0,
                  color: Colors.transparent,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Country:',
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DancingScript',
                          letterSpacing: 2.0),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '${data.country}',
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DancingScript',
                          letterSpacing: 2.0),
                    ),
                    SizedBox(width: 100),
                  ],
                ),
                Divider(
                  height: 10.0,
                  color: Colors.transparent,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Bio:',
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DancingScript',
                          letterSpacing: 2.0),
                    ),
                    SizedBox(width: 20),
                    Container(
                        margin: const EdgeInsets.all(30.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[900],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Text(
                          "${data.aboutMe}",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'DancingScript',
                              letterSpacing: 2.0),
                        ))
                  ],
                ),
                Divider(
                  height: 90.0,
                  color: Colors.transparent,
                ),
                Center(
                  child: RaisedButton.icon(
                      color: Colors.grey[900],
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      icon: Icon(
                        Icons.home,
                        color: Colors.yellow[400],
                      ),
                      label: Text(
                        'Done',
                        style: TextStyle(
                            color: Colors.yellow[400],
                            fontSize: 16,
                            fontFamily: 'DancingScript',
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ]),
        ));
  }
}
