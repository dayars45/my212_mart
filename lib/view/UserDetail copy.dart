import 'package:flutter/material.dart';
import 'package:my212_mart/service/UserService.dart';
import 'package:my212_mart/model/User.dart';
import 'package:my212_mart/view/UserView.dart';

class UserDetail extends StatelessWidget {
  TextEditingController _idUser;
  TextEditingController _fullName;
  TextEditingController _birthPlace;
  TextEditingController _birthDate;
  TextEditingController _address;
  TextEditingController _gender;
  TextEditingController _religion;
  TextEditingController _telp;
  TextEditingController _email;
  TextEditingController _isPic;
  TextEditingController _note;
  TextEditingController _userName;
  User user;

  bool _isUpdate = false;

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;

    _idUser = TextEditingController();
    _fullName = TextEditingController();
    _birthPlace = TextEditingController();
    _birthDate = TextEditingController();
    _address = TextEditingController();
    _gender = TextEditingController();
    _religion = TextEditingController();
    _telp = TextEditingController();
    _email = TextEditingController();
    _userName = TextEditingController(); 
    
    // Method to clear TextField values
    _clearValues() {
      _idUser.text = '';
      _fullName.text = '';
      _email.text = '';
      _telp.text = '';
      _userName.text = '';
    }
 
    _showValues(User user) {
      _idUser.text = user.idUser;
      _fullName.text = user.fullName;
      _email.text = user.email;
      _telp.text = user.telp;
      _userName.text =  user.userName;
    }

    if(user != null){
      _showValues(user);
    } else{
      _clearValues();
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("FORM USER")),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _idUser,
                enabled: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _fullName,
                decoration: InputDecoration(hintText: 'Full Name'),
              )
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _birthPlace,
                decoration: InputDecoration(hintText: 'Birth Place'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _telp,
                decoration: InputDecoration(hintText: 'Telp')
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(hintText: 'Email'),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: _userName,
                  decoration: InputDecoration(hintText: 'User Name'),
                ),
              ),
            //start _isUpdate
            _isUpdate ? Row(
                  children: <Widget>[
                    OutlineButton(
                      child: Text('Update'),
                      onPressed: (){
                        UserService.updateUser(user).then((result) {});
                      }
                    ),
                    OutlineButton(
                      child: Text('Cancel'),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => UserView()));
                      }
                    )
                  ],
                  ) : 
                  Row(
                  children: <Widget>[
                    OutlineButton(
                      child: Text('Add'),
                      onPressed: (){
                        UserService.addUser(user).then((result) {});
                      }
                    ),
                    OutlineButton(
                      child: Text('Cancel'),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => UserView()));
                      }
                    )
                  ],
                  )
              //End _isUpdate
          ],
        )
      ),
    );

  }
}