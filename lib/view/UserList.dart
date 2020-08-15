
import 'package:flutter/material.dart';
import 'package:my212_mart/model/User.dart';
import 'package:my212_mart/service/UserService.dart';
import 'package:my212_mart/view/UserDetail.dart';

class UserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "USER LIST",
      home: new UserList(),
    );
  }
}

class UserList extends StatefulWidget {
  final String title = 'Table User';
  UserList() : super();
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User>_listUser;
  GlobalKey<ScaffoldState>_scaffoldKey;
  String _titleProgress;
  User _selectedUser;
  bool _isUpdating;
  String _titleProgerss;
  User _user;

  @override
  void initState(){
    super.initState();
    _listUser = [];
    _scaffoldKey = GlobalKey();
    _getUsers();
    _titleProgress = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleProgress),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(

            ),Expanded(child: _dataBody(),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // __isUpdating = false;
          // Navigator.push(context, MaterialPageRoute(
          //   builder: (BuildContext)=>UserDetail()));
            Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>UserDetail(),
                          settings: RouteSettings(arguments: _user)
                        )
                      );
        },
        child: Icon(Icons.add),
      ),
    );
    
  }

  // Let's create a DataTable and show the User list in it.
  SingleChildScrollView _dataBody() {
    // Both Vertical and Horozontal Scrollview for the DataTable to
    // scroll both Vertical and Horizontal...
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('ID'),
            ),
            DataColumn(
              label: Text('Name'),
            ),
            DataColumn(
              label: Text('Telp'),
            ),
            DataColumn(
              label: Text('Email'),
            ),
            DataColumn(
              label: Text('User Name'),
            ),
            // Lets add one more column to show a delete button
            DataColumn(
              label: Text('Delete'),
            ),
            DataColumn(
              label: Text('Edit'),
            )
          ],
          rows: _listUser
              .map(
                (user) => DataRow(cells: [
                  DataCell(
                    Text(user.idUser.toString()),
                    onTap: () {
                      //_showValues(user);
                      _selectedUser = user;
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(
                    Text(user.fullName),
                    onTap: () {
                      _selectedUser = user;
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(
                    Text(user.telp),
                    onTap: () {
                      _selectedUser = user;
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(
                    Text(user.email),
                    onTap: () {
                      _selectedUser = user;
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(
                    Text(user.userName),
                    onTap: () {
                      _selectedUser = user;
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteUser(user);
                    },
                  )),
                  DataCell(IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      setState(() {_isUpdating = true;});
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context)=>UserDetail(),
                          settings: RouteSettings(arguments: user)
                        )
                      );
                    },
                  ))
                ]),
              )
              .toList(),
        ),
      ),
    );
  }

  _getUsers() {
    _showProgress('Loading Users...');
    UserService.getUsers().then((listUser) {
      setState(() {
        _listUser = listUser;
      });
      _showProgress(widget.title); // Reset the title...
      print("Length ${_listUser.length}");
    });
  }

  _createTable() {
    _showProgress('Creating Table...');
    UserService.createTable().then((result) {
      if ('success' == result) {
        // Table is created successfully.
        _showSnackBar(context, result);
        _showProgress(widget.title);
      }
    });
  }

  _deleteUser(User user) {
    _showProgress('Deleting User...');
    UserService.deleteUser(user.idUser).then((result) {
      if ('success' == result) {
        _getUsers(); // Refresh after delete...
      }
    });
  }

  _showProgress(String message){
    setState((){
      _titleProgress = message;
    });
  }

  _showSnackBar(context, message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
  
}
