import 'package:flutter/material.dart';
import 'package:testecv/doencas_page/doenca1.dart';
import 'package:testecv/doencas_page/doenca4.dart';

import 'doencas_page/doenca2.dart';
import 'doencas_page/doenca3.dart';
import 'doencas_page/doenca5.dart';

class MinhaHome extends StatefulWidget {
  @override
  _MinhaHomeState createState() => _MinhaHomeState();
}

class _MinhaHomeState extends State<MinhaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doenças"),
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    elevation: 50.0,
                    color: Colors.lightBlue[300],
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 10, 20, 10),
                          child: Center(
                            child: Text(
                              "Febre Amarela",
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ),
                        ),
                        Container(
                          height: 80.0,
                          width: 140.0,
                          child: ButtonBar(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.keyboard_arrow_right),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Doenca1_Home()),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    elevation: 50.0,
                    color: Colors.lightBlue[300],
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 10, 5, 10),
                          child: Center(
                            child: Text(
                              "Dengue",
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ),
                        ),
                        Container(
                          height: 80.0,
                          width: 220.0,
                          child: ButtonBar(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.keyboard_arrow_right),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Doenca2_Home()),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    elevation: 50.0,
                    color: Colors.lightBlue[300],
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 10, 5, 10),
                          child: Center(
                            child: Text(
                              "Hepatite A",
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ),
                        ),
                        Container(
                          height: 80.0,
                          width: 190.0,
                          child: ButtonBar(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.keyboard_arrow_right),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Doenca3_Home()),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    elevation: 50.0,
                    color: Colors.lightBlue[300],
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 10, 5, 10),
                          child: Center(
                            child: Text(
                              "Poliomelite",
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ),
                        ),
                        Container(
                          height: 80.0,
                          width: 188.0,
                          child: ButtonBar(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.keyboard_arrow_right),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Doenca4_Home()),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    elevation: 50.0,
                    color: Colors.lightBlue[300],
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(30, 10, 5, 10),
                          child: Center(
                            child: Text(
                              "Tetra Viral",
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ),
                        ),
                        Container(
                          height: 80.0,
                          width: 188.0,
                          child: ButtonBar(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.keyboard_arrow_right),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Doenca5_Home()),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}
