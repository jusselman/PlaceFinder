import 'package:flutter/material.dart';
import 'package:flutter_right_place_and_time/services/world_time.dart';
import '../services/world_time.dart';

class PlaceChooser extends StatefulWidget {
  @override
  _PlaceChooserState createState() => _PlaceChooserState();
}

class _PlaceChooserState extends State<PlaceChooser> {

  List<WorldTime> locations = [
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'newyork.jpeg'),
    // WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'la.jpeg'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'berlin.jpeg'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'madrid.jpeg'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'dubai.jpeg'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'tokyo.jpeg'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'hongkong.jpeg'),
    WorldTime(url: 'Asia/Tehran', location: 'Tehran', flag: 'tehran.jpeg'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to homescreen //
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
     backgroundColor: Color(0xFF1968a6),
      appBar: AppBar(
        backgroundColor: Color(0xFF0a395e),
        title: Text('Choose Place'),
        centerTitle: true,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                child: Card(
                child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/${locations[index].flag}'),
                    ),
                  )
                ),
              );
            },

        ),
      )

    );
  }
}
