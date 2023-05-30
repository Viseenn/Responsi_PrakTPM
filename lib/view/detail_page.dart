import 'package:flutter/material.dart';

class AgentDetail extends StatefulWidget {
  final dynamic uuid;

  AgentDetail({required this.uuid});

  @override
  _AgentDetailState createState() => _AgentDetailState();
}

class _AgentDetailState extends State<AgentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black, // Warna hitam
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
                child: Column(
              children: [
                Text(
                  widget.uuid['displayName'] ?? '',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 15),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.uuid['fullPortrait'] ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  widget.uuid['description'] ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Row(
                    children: [
                      Text(
                        'Role : ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.uuid['role'] != null
                            ? widget.uuid['role']['displayName']
                            : 'Initiator',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Abilities',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                    color: Colors.black, // Background hitam
                    padding: EdgeInsets.all(16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            widget.uuid['abilities'] != null &&
                                                    widget.uuid['abilities']
                                                            .length >
                                                        0
                                                ? widget.uuid['abilities'][0]
                                                    ['displayIcon']
                                                : '',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      widget.uuid['abilities'] != null &&
                                              widget.uuid['abilities'].length >
                                                  0
                                          ? widget.uuid['abilities'][0]
                                              ['displayName']
                                          : '',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            widget.uuid['abilities'] != null &&
                                                    widget.uuid['abilities']
                                                            .length >
                                                        1
                                                ? widget.uuid['abilities'][1]
                                                    ['displayIcon']
                                                : '',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      widget.uuid['abilities'] != null &&
                                              widget.uuid['abilities'].length >
                                                  1
                                          ? widget.uuid['abilities'][1]
                                              ['displayName']
                                          : '',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            widget.uuid['abilities'] != null &&
                                                    widget.uuid['abilities']
                                                            .length >
                                                        2
                                                ? widget.uuid['abilities'][2]
                                                    ['displayIcon']
                                                : '',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      widget.uuid['abilities'] != null &&
                                              widget.uuid['abilities'].length >
                                                  2
                                          ? widget.uuid['abilities'][2]
                                              ['displayName']
                                          : '',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ])),
              ],
            ))));
  }
}
