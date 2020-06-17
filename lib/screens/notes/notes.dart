import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}


class _NoteListState extends State<NoteList> {
  TextEditingController addNoteController = TextEditingController();
  List<String> _todoItems = [];

  void _addTodoItem(String task) {
    if (task.length > 0) {
      setState(() => _todoItems.add(task));
    }
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('You want to Delete? \n "${_todoItems[index]}" '),
              actions: <Widget>[
                FlatButton(
                    child: Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop()),
                FlatButton(
                    child: Text('Delete'),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  Widget _textDecription() {
    return Text(" click + button to add note in list");
  }
  _listView() {
    return ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (context, index) {
        return _buildTodoItem(_todoItems[index], index);
      },
    );
  }


  Widget _buildTodoItem(String todoText, int index) {
    return ListTile(
        title: Text(todoText,style: TextStyle(fontFamily: "Bal")), onTap: () => _promptRemoveTodoItem(index));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(title: Text('Note List',style: TextStyle(fontFamily: "Bal"))),
        body: _listView(),

        floatingActionButton: FloatingActionButton(
            mini: true,
            onPressed: _pushAddTodoScreen,
            tooltip: 'Add Note',
            child: Icon(Icons.add)),

        ///
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),);
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
          appBar: AppBar(title: Text('Add a item',style: TextStyle(fontFamily: "Bal"))),
          body: Padding(
            padding: EdgeInsets.all(30.0),
            child:  ListView(
              children: <Widget>[
                Text("Add note Text :",style: TextStyle(fontFamily: ('Bal')),),
                SizedBox(height: 30,),
                 TextField(
                  autofocus: true,
                  controller: addNoteController,
                  onSubmitted: (val) {
                    _addTodoItem(val);
                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                      hintText: 'Write Note text...',
                      contentPadding: const EdgeInsets.all(6.0)),
                ),
                SizedBox(height: 80,),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.black,
                  child: Text('Add Note',style: TextStyle(fontFamily: "Bal")),
                  onPressed: () {
                    _addTodoItem(addNoteController.text);
                    addNoteController.text="";
                    Navigator.pop(context);

                   /* _loginOperations(nameController.text,
                        passwordController.text);*/
                  },
                )
              ],
            ),
          ));
    }));
  }




}

