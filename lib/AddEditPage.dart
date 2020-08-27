import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phpmysqlcrud/main.dart';

class AddEditPage extends StatefulWidget {
  final List list;
  final int index;
  AddEditPage({this.list, this.index});
  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  TextEditingController titleNotes = TextEditingController();
  TextEditingController contentNotes = TextEditingController();

  bool editMode = false;

  addUpdateData() {
    if (editMode) {
      var url = 'http://10.0.2.2/notes-server/edit.php';
      http.post(url, body: {
        'id': widget.list[widget.index]['id'],
        'title': titleNotes.text,
        'content': contentNotes.text,
      });
    } else {
      var url = 'http://10.0.2.2/notes-server/add.php';
      http.post(url, body: {
        'title': titleNotes.text,
        'content': contentNotes.text,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      titleNotes.text = widget.list[widget.index]['title'];
      contentNotes.text = widget.list[widget.index]['content'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editMode ? 'Update' : 'Add Data'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: titleNotes,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: contentNotes,
              decoration: InputDecoration(
                labelText: 'Content',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  addUpdateData();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
                debugPrint('Clicked RaisedButton Button');
              },
              color: Colors.black,
              child: Text(
                editMode ? 'Update' : 'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
