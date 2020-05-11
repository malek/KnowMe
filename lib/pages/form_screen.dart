import 'package:flutter/material.dart';
import 'package:tuto/infos.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
// this allows us to access the TextField text
  TextEditingController textFieldController = TextEditingController();

  String famillyName;
  String firstName;
  String email;
  String phoneNumber;
  String country;
  String aboutMe;
  int gender = 0;
  Infos user;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFamillyName() {
    return TextFormField(
      style: TextStyle(
          color: Colors.grey[900],
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0),
      decoration: InputDecoration(
        labelText: 'Family Name',
        labelStyle: TextStyle(
          fontFamily: 'DancingScript',
        ),
      ),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Family Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        famillyName = value;
      },
    );
  }

  Widget _buildFirstName() {
    return TextFormField(
      style: TextStyle(
          color: Colors.grey[900],
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0),
      decoration: InputDecoration(
        labelText: 'First Name',
        labelStyle: TextStyle(
          fontFamily: 'DancingScript',
        ),
      ),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'First Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        firstName = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      style: TextStyle(
          color: Colors.grey[900],
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0),
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(
          fontFamily: 'DancingScript',
        ),
        hintText: 'Enter your Mail adress',
        hintStyle: TextStyle(
          fontFamily: 'DancingScript',
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      style: TextStyle(
          color: Colors.grey[900],
          fontSize: 14,
          fontFamily: 'DancingScript',
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0),
      decoration: InputDecoration(
        labelText: 'Phone number',
        hintText: 'Your Phone nuber please',
      ),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        phoneNumber = value;
      },
    );
  }

  Widget _buildCountry() {
    return TextFormField(
      style: TextStyle(
          color: Colors.grey[900],
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0),
      decoration: InputDecoration(
        labelText: 'Country',
        labelStyle: TextStyle(
          fontFamily: 'DancingScript',
        ),
        hintText: 'Country Name',
        hintStyle: TextStyle(
          fontFamily: 'DancingScript',
        ),
      ),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Country is Required';
        }

        return null;
      },
      onSaved: (String value) {
        country = value;
      },
    );
  }

  Widget _buildAboutMe() {
    return TextFormField(
      style: TextStyle(
          color: Colors.grey[900],
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(new Radius.circular(25.0))),
        labelText: 'About Me',
        labelStyle: TextStyle(
          fontFamily: 'DancingScript',
        ),
        hintText: 'Talk us about you :D ',
        hintStyle: TextStyle(
          fontFamily: 'DancingScript',
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'This field is Required';
        }
        return null;
      },
      onSaved: (String value) {
        aboutMe = value;
      },
    );
  }

  void _isGender(int value) {
    setState(() {
      gender = value;

      //my logic : if he s a male so gender = to 0 else (women) then gender = to 1 :D
    });
  }

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
      // i added this singlechild.. to avoid that error in typing
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildFamillyName(),
                _buildFirstName(),
                _buildEmail(),
                Row(children: <Widget>[
                  Text(
                    'Gender:',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontFamily: 'DancingScript',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                    ),
                  ),
                  Radio(
                    value: 0,
                    groupValue: gender,
                    onChanged: _isGender,

                    //activeColor: Colors.black54,
                  ),
                  Text(
                    'Men',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontFamily: 'DancingScript',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                    ),
                  ),
                  Radio(
                    value: 1,
                    groupValue: gender,
                    onChanged: _isGender,
                  ),
                  Text(
                    'Women',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontFamily: 'DancingScript',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                    ),
                  ),
                ]),
                _buildPhoneNumber(),
                _buildCountry(),
                _buildAboutMe(),
                SizedBox(height: 100),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //cancel button
                      RaisedButton.icon(
                          color: Colors.grey[900],
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.home,
                            color: Colors.yellow[400],
                          ),
                          label: Text(
                            'Cancel',
                            style: TextStyle(
                                color: Colors.yellow[400],
                                fontSize: 16,
                                fontFamily: 'DancingScript',
                                fontWeight: FontWeight.bold),
                          )),

                      SizedBox(width: 100),
                      //print button
                      RaisedButton.icon(
                          color: Colors.grey[900],
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              Infos user = Infos(
                                  famillyName: '$famillyName',
                                  firstName: '$firstName',
                                  email: '$email',
                                  phoneNumber: '$phoneNumber',
                                  country: '$country',
                                  aboutMe: '$aboutMe',
                                  gender: gender);
                              Navigator.of(context)
                                  .pushNamed('/printPage', arguments: user);

                              return;
                            }

                            //Send to API
                          },
                          icon: Icon(
                            Icons.local_printshop,
                            color: Colors.yellow[400],
                          ),
                          label: Text(
                            'Print',
                            style: TextStyle(
                                color: Colors.yellow[400],
                                fontSize: 16,
                                fontFamily: 'DancingScript',
                                fontWeight: FontWeight.bold),
                          )),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
