import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail_page.dart';
import 'login.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<dynamic> agents = [];

  @override
  void initState() {
    super.initState();
    fetchAgents();
  }

  Future<void> fetchAgents() async {
    final response =
        await http.get(Uri.parse('https://valorant-api.com/v1/agents'));
    if (response.statusCode == 200) {
      setState(() {
        agents = json.decode(response.body)['data'];
      });
    }
  }

  void navigateToDetailPage(dynamic agent) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgentDetail(uuid: agent),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Valorant App'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }),
                    (route) => false,
              );
            },
          ),
        ],
      ),
      body: agents.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                ListView.builder(
                  itemCount: agents.length,
                  itemBuilder: (context, index) {
                    final agent = agents[index];
                    return GestureDetector(
                      onTap: () => navigateToDetailPage(agent),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.network(
                                      agent['background'],
                                      fit: BoxFit.cover,
                                      height: 200,
                                      width: 200,
                                    ),
                                    Image.network(
                                      agent['fullPortrait'] ?? '',
                                      fit: BoxFit.cover,
                                      height: 200,
                                      width: 200,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                            Column(

                              children: [
                                Text(
                                  agent['displayName'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  agent['role']['displayName'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
