import 'dart:convert';
import 'package:amrpfe/screens/machinery_detail_widget.dart';
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
    machinerys = fetchMachinerys(); // Fetch tractors on widget initialization
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
              return buildMachineryCard(machinery);
            }).toList(),
          );
        },
      ),
    );
  }

  Widget buildMachineryCard(Machinery machinery) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MachineryDetailsWidget(
                id: machinery.id), // Pass the machinery ID
          ),
        );
      },
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              width: double.infinity,
              child: Image.network(
                "https://armada-server.glitch.me/api/machinery/Image/${machinery.image}",
                fit: BoxFit.fill,
                // scale: 1.1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // height: 50,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text(
                            '${machinery.manufacturer}',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            // width: MediaQuery.of(context).size.width * 0.19,
                            child: Text(
                              '${machinery.type}',
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ),
    );
  }
}

Future<List<Machinery>> fetchMachinerys() async {
  var response = await http
      .get(Uri.parse("https://armada-server.glitch.me/api/machinery"));
  var jsonData = json.decode(response.body);
  List<Machinery> machinerys = [];

  for (var machineryData in jsonData) {
    Machinery machinery = Machinery(
      machineryData['_id'],
      machineryData['type'],
      machineryData['manufacturer'],
      machineryData['model'],
      machineryData['status'],
      machineryData['image'],
    );
    machinerys.add(machinery);
  }

  return machinerys;
}
