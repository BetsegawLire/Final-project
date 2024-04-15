import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/machinery_model.dart';

class MachineryListScreen extends StatefulWidget {
  @override
  _MachineryListScreenState createState() => _MachineryListScreenState();
}

class _MachineryListScreenState extends State<MachineryListScreen> {
  Future<List<Machinery>>?
      machinerys; // Declare a Future<List<Tractor>> for tractors

  @override
  void initState() {
    super.initState();
    machinerys = fetchTractors(); // Fetch tractors on widget initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Machinery>>(
        future: machinerys, // Use the pre-fetched tractors Future
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final machinerys = snapshot.data!; // Unwrap the data
          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            padding: EdgeInsets.all(10.0),
            children: machinerys.map((machinery) {
              return buildTractorCard(machinery);
            }).toList(),
          );
        },
      ),
    );
  }

  Widget buildTractorCard(Machinery machinery) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
                "https://armada-server.glitch.me/api/machinery/Image/${machinery.image}"), // Display the tractor image
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${machinery.manufacturer}',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        '${machinery.type}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${machinery.model}',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        '${machinery.status}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  // Add other fields (year, horsepower, etc.) as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<List<Machinery>> fetchTractors() async {
  var response = await http
      .get(Uri.parse("https://armada-server.glitch.me/api/machinery"));
  var jsonData = json.decode(response.body);
  List<Machinery> machinerys = [];

  for (var tractorData in jsonData) {
    Machinery machinery = Machinery(
      tractorData['_id'],
      tractorData['type'],
      tractorData['manufacturer'],
      tractorData['model'],
      tractorData['status'],
      tractorData['image'],
    );
    machinerys.add(machinery);
  }

  return machinerys;
}
