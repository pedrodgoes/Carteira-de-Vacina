import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:masked_text/masked_text.dart';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Doenca3_Home extends StatefulWidget {
  @override
  _Doenca3_Home createState() => _Doenca3_Home();
}

class _Doenca3_Home extends State<Doenca3_Home> {
  final _toDoController = TextEditingController();
  final _toDoController2 = TextEditingController();

  List _toDoList = [];
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        _toDoList = json.decode(data);
      });
    });
  }

  void _addToDo() {
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["title"] = ("Data: "+_toDoController.text+"\n"+"Lote: "+_toDoController2.text);
      _toDoController.text = "";
      _toDoController2.text = "";
      newToDo["ok"] = false;
      _toDoList.add(newToDo);
      _saveData();
    });
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _toDoList.sort((a, b) {
        if (a["ok"] && !b["ok"])
          return 1;
        else if (!a["ok"] && b["ok"])
          return -1;
        else
          return 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hepatite A"),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: MaskedTextField(
                  maskedTextFieldController: _toDoController,
                  mask: "xx/xx/xxxx",
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  inputDecoration: InputDecoration(
                      labelText: "Data",
                      hintText: "00/00/0000",
                      labelStyle:
                          TextStyle(color: Colors.lightBlueAccent, fontSize: 25.0)),
                )),
                Text("|",
                style: TextStyle(
                  fontSize: 60.0,
                ),
                ),
                Expanded(
                    child: MaskedTextField(
                  maskedTextFieldController: _toDoController2,
                  mask: "xxxx-x",
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  inputDecoration: InputDecoration(
                      labelText: "Lote",
                      hintText: "0000-0",
                      labelStyle:
                          TextStyle(color: Colors.lightBlueAccent, fontSize: 25.0)),
                )),
                RaisedButton(
                  color: Colors.blueAccent,
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  textColor: Colors.white,
                  onPressed: _addToDo,
                )
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  itemCount: _toDoList.length,
                  itemBuilder: buildItem),
            ),
          )
        ],
      ),
    );
  }

  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      direction: DismissDirection.startToEnd,
        child: CheckboxListTile(
        title: Text(_toDoList[index]["title"]),
        value: _toDoList[index]["ok"],
        secondary: CircleAvatar(
          child: Icon(_toDoList[index]["ok"] ? Icons.check : Icons.error),
        ),
        onChanged: (c) {
          setState(() {
            _toDoList[index]["ok"] = c;
            _saveData();
          });
        },
      ),
      onDismissed: (direction) {
        setState(() {
          _lastRemoved = Map.from(_toDoList[index]);
          _lastRemovedPos = index;
          _toDoList.removeAt(index);

          _saveData();

          final snack = SnackBar(
            content: Text("Tarefa \"${_lastRemoved["title"]}\" removida!"),
            action: SnackBarAction(
              label: "Desfazer",
              onPressed: () {
                setState(() {
                  _toDoList.insert(_lastRemovedPos, _lastRemoved);
                  _saveData();
                });
              },
            ),
            duration: Duration(seconds: 2),
          );
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(snack);
        });
      },
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data2.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
