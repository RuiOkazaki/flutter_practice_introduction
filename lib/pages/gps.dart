import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/components/header.dart';
import 'package:geolocator/geolocator.dart';

class Gps extends StatefulWidget {
  const Gps({super.key});

  @override
  State<Gps> createState() => _GpsState();
}

class _GpsState extends State<Gps> {
  String _latitude = 'NoData';
  String _longitude = 'NoData';
  String _altitude = 'NoData';

  Future<void> getLocation() async {
    // 権限を取得
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _latitude = position.latitude.toStringAsFixed(2);
      _longitude = position.longitude.toStringAsFixed(2);
      _altitude = position.altitude.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genHeader('GPS'),
      body: Center(
          child: Column(children: [
        Text(_latitude),
        Text(_longitude),
        Text(_altitude),
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: getLocation,
        child: const Icon(Icons.gps_fixed),
      ),
    );
  }
}
