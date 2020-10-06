import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    // change bg and color dynamically based on time /
    String bgImg = data['isDaytime'] ? 'daytime.jpeg' : 'nighttime.jpeg';
    Color unSafeClr = data['isDaytime'] ? Color(0xFF0a395e) : Colors.black;
    Color timedText = data['isDaytime'] ? Color(0xFF0a395e) : Colors.white;

    return Scaffold(
      backgroundColor: unSafeClr,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImg'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[

                  SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 3.0,
                          color: timedText,
                        )
                      )
                    ]
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 50.0,
                      color: timedText,
                    )
                  ),
                  SizedBox(height: 140.0),
                  FlatButton.icon(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    color: unSafeClr,
                    // textColor: ${homeText},
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/place_chooser');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag']
                        };
                      });
                    },
                    icon: Icon(
                      Icons.map,
                      color: Colors.white,
                    ),
                    label: Text(
                        'Change Place',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
