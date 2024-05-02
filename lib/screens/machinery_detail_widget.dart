import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MachineryDetailsWidget extends StatefulWidget {
  final String id;

  MachineryDetailsWidget({required this.id});

  @override
  _MachineryDetailsWidgetState createState() => _MachineryDetailsWidgetState();
}

class _MachineryDetailsWidgetState extends State<MachineryDetailsWidget> {
  Map<String, dynamic> machinery = {}; // Initialize with empty data

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://armada-server.glitch.me/api/machinery/${widget.id}/'));

    if (response.statusCode == 200) {
      setState(() {
        machinery = json.decode(response.body);
        print(machinery['machinery']['_id']);
      });
    } else {
      // Handle error (e.g., show an error message)
      print('Error fetching data: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Machinery Details')),
      body: machinery.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (machinery['machinery']['_id'] != null)
                    Text('ID: ${machinery['machinery']['_id']}'),
                  if (machinery['machinery']['owner_id'] != null)
                    Text('Owner ID: ${machinery['machinery']['owner_id']}'),
                  if (machinery['machinery']['type'] != null)
                    Text('Type: ${machinery['machinery']['type']}'),
                  if (machinery['machinery']['manufacturer'] != null)
                    Text(
                        'Manufacturer: ${machinery['machinery']['manufacturer']}'),
                  if (machinery['machinery']['model'] != null)
                    Text('Model: ${machinery['machinery']['model']}'),
                  if (machinery['machinery']['status'] != null)
                    Text('Status: ${machinery['machinery']['status']}'),
                  if (machinery['machinery']['year'] != null)
                    Text('Year: ${machinery['machinery']['year']}'),
                  if (machinery['machinery']['horsepower'] != null)
                    Text('Horsepower: ${machinery['machinery']['horsepower']}'),
                  if (machinery['machinery']['hour_meter'] != null)
                    Text('Hour Meter: ${machinery['machinery']['hour_meter']}'),
                  if (machinery['machinery']['region'] != null)
                    Text('Region: ${machinery['machinery']['region']}'),
                  if (machinery['machinery']['image'] != null)
                    Text('Image: ${machinery['machinery']['image']}'),
                  if (machinery['machinery']['grain_tank_capacity'] != null)
                    Text(
                        'Grain Tank Capacity: ${machinery['machinery']['grain_tank_capacity']}'),
                  if (machinery['machinery']['grain_types'] != null)
                    Text(
                        'Grain Types: ${machinery['machinery']['grain_types']}'),
                  if (machinery['machinery']['required_power'] != null)
                    Text(
                        'Required Power: ${machinery['machinery']['required_power']}'),
                  if (machinery['machinery']['working_capacity'] != null)
                    Text(
                        'Working Capacity: ${machinery['machinery']['working_capacity']}'),
                  if (machinery['machinery']['additional_info'] != null)
                    Text(
                        'Additional Info: ${machinery['machinery']['additional_info']}'),
                  if (machinery['machinery']['createdAt'] != null)
                    Text('Created At: ${machinery['machinery']['createdAt']}'),
                  if (machinery['machinery']['updatedAt'] != null)
                    Text('Updated At: ${machinery['machinery']['updatedAt']}'),
                ],
              ),
            ),
    );
  }
}
