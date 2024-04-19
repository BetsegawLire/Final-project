import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MachineryDetailsWidget extends StatefulWidget {
  @override
  _MachineryDetailsWidgetState createState() => _MachineryDetailsWidgetState();
}

class _MachineryDetailsWidgetState extends State<MachineryDetailsWidget> {
  Map<String, dynamic> machinery = {}; // Initialize with empty data

  Future<void> fetchData(String id) async {
    final response = await http
        .get(Uri.parse('https://armada-server.glitch.me/api/machinery/${id}/'));

    if (response.statusCode == 200) {
      setState(() {
        machinery = json.decode(response.body);
      });
    } else {
      // Handle error (e.g., show an error message)
      print('Error fetching data: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData("64d6cfa5eda2cea8bbfea504");
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
                  if (machinery['_id'] != null) Text('ID: ${machinery['_id']}'),
                  if (machinery['owner_id'] != null)
                    Text('Owner ID: ${machinery['owner_id']}'),
                  if (machinery['type'] != null)
                    Text('Type: ${machinery['type']}'),
                  if (machinery['manufacturer'] != null)
                    Text('Manufacturer: ${machinery['manufacturer']}'),
                  if (machinery['model'] != null)
                    Text('Model: ${machinery['model']}'),
                  if (machinery['status'] != null)
                    Text('Status: ${machinery['status']}'),
                  if (machinery['year'] != null)
                    Text('Year: ${machinery['year']}'),
                  if (machinery['horsepower'] != null)
                    Text('Horsepower: ${machinery['horsepower']}'),
                  if (machinery['hour_meter'] != null)
                    Text('Hour Meter: ${machinery['hour_meter']}'),
                  if (machinery['region'] != null)
                    Text('Region: ${machinery['region']}'),
                  if (machinery['image'] != null)
                    Text('Image: ${machinery['image']}'),
                  if (machinery['grain_tank_capacity'] != null)
                    Text(
                        'Grain Tank Capacity: ${machinery['grain_tank_capacity']}'),
                  if (machinery['grain_types'] != null)
                    Text('Grain Types: ${machinery['grain_types']}'),
                  if (machinery['required_power'] != null)
                    Text('Required Power: ${machinery['required_power']}'),
                  if (machinery['working_capacity'] != null)
                    Text('Working Capacity: ${machinery['working_capacity']}'),
                  if (machinery['additional_info'] != null)
                    Text('Additional Info: ${machinery['additional_info']}'),
                  if (machinery['createdAt'] != null)
                    Text('Created At: ${machinery['createdAt']}'),
                  if (machinery['updatedAt'] != null)
                    Text('Updated At: ${machinery['updatedAt']}'),
                ],
              ),
            ),
    );
  }
}
