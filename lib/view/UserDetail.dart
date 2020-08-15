import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:my212_mart/common/CommElement.dart';
import 'package:my212_mart/model/ModelElement.dart';
import 'package:my212_mart/service/UserService.dart';
import 'package:my212_mart/model/User.dart';
import 'package:my212_mart/view/UserList.dart';

class UserDetail extends StatefulWidget {
  @override
  _UserDetailState createState() => _UserDetailState();

  final String title = 'User Detail';
}

class _UserDetailState extends State<UserDetail> {
  final _formKey = GlobalKey<FormState>();
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
  TextEditingController _password;
  DateTime _dtBirthDate;
  String _titleProgress;
  String _radioItem;
  bool boolPic = true;
  String strPic;

  bool _isUpdate = false;
  User _user = new User();
  List<User> _listUser;
  
  List<ModelElement> listModelElement; 

  @override
  void initState(){
    super.initState();
    _idUser = TextEditingController();
    _fullName = TextEditingController();
    _birthPlace = TextEditingController();
    _birthDate = TextEditingController();
    _address = TextEditingController();
    _gender = TextEditingController();
    _religion = TextEditingController();
    _telp = TextEditingController();
    _email = TextEditingController();
    _note = TextEditingController();
    _userName = TextEditingController(); 
    _password = TextEditingController();
    _radioItem = '';
    strPic = '0';
    boolPic = false;
    _titleProgress = widget.title;
    listModelElement = getListModelElement();
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    if(user != null){
      _showValues(user);
    }

    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text(_titleProgress),),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommElement.textField1(_idUser, 'ID', true, Icons.text_fields, user != null ? true:false, false),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommElement.textField1(_fullName, 'Full Name', true, Icons.text_fields, true, false),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommElement.textField1(_birthPlace, 'Birth Place', true, Icons.text_fields, true, false),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    CommElement.datePicker1(_birthDate, context, _dtBirthDate),
                  ],
                ), 
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommElement.textField1(_address, 'Address', true, Icons.text_fields, true, false),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                // child: CommElement.twoRadio1('Male','Male','Female','Female'),
                child: Column(
                      children: <Widget>[
                        RadioListTile(
                          value: 'male', 
                          title: Text('Male'),
                          groupValue: _radioItem, 
                          onChanged: (val){
                            setState((){
                              _radioItem = val;
                            });
                        },
                        ),
                        RadioListTile(
                          value: 'female', 
                          title: Text('Female'),
                          groupValue: _radioItem, 
                          onChanged: (val){
                            setState((){
                              _radioItem = val;
                            });
                        },
                        ),
                      ],
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommElement.textField1(_religion, 'Religion', true, Icons.text_fields, true, false),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommElement.textField1(_telp, 'Telp', true, Icons.text_fields, true, false),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommElement.textField1(_email, 'Email', true, Icons.mail, true, false),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    CheckboxListTile(title: const Text('Store PIC'), value: boolPic, onChanged: (val){
                      setState(() {
                        boolPic = val;
                        strPic = boolPic == true?'1':'0';
                      });

                    })
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommElement.textField1(_note, 'Note', true, Icons.text_fields, true, false),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommElement.textField1(_userName, 'Username', true, Icons.text_fields, true, false),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CommElement.textField1(_password, 'Password', true, Icons.text_fields, user!=null?false:true, true),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(margin: EdgeInsets.all(10.0),
                    child: ButtonTheme(minWidth: 130.0, height: 40.0,
                      child: RaisedButton(
                        onPressed: (){user != null ? _addUser() : _updateUser();},
                        // onPressed: (){_addUser();},
                        child: Text(user != null ? 'Update' : 'Add'),
                        color: Colors.blue,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      ),
                    ),
                  ),
                  ButtonTheme(minWidth: 130.0, height: 40.0,
                      child: RaisedButton(
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext)=>UserList()));
                        },
                        child: Text('Cancel'),
                        color: Colors.blue,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  _clearValues() {
    _idUser.text = '';
    _fullName.text = '';
    _birthPlace.text = '';
    _birthDate.text = '';
    _address.text = '';
    _gender.text = '';
    _religion.text = '';
    _telp.text = '';
    _email.text = '';
    _isPic.text = '';
    _note.text = '';
    _userName.text =  '';
    _password.text = '';
  }

  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }
 
  _showValues(User user) {
    _idUser.text = user.idUser;
    _fullName.text = user.fullName;
    _birthPlace.text = user.birthPlace;
    _birthDate.text = user.birthDate;
    _address.text = user.address;
    _gender.text = user.gender;
    _religion.text = user.religion;
    _telp.text = user.telp;
    _email.text = user.email;
    _note.text = user.note;
    _userName.text =  user.userName;
    _password.text = user.password;
  }

  User _setUser(){
    _user.fullName = _fullName.text;
    _user.birthPlace = _birthPlace.text;
    _user.birthDate = _birthDate.text;
    _user.address = _address.text;
    _user.gender = _radioItem;
    _user.religion = _religion.text;
    _user.telp = _telp.text;
    _user.email = _email.text;
    _user.isPic = strPic;
    _user.note = _note.text;
    _user.userName = _userName.text;
    _user.password = _password.text;
  }

  _getUsers() {
    _showProgress('Loading Users...');
    UserService.getUsers().then((users) {
      setState(() {
        _listUser = users;
      });
      _showProgress(widget.title);
      print("Length Users${users.length}");
    });
  }

  void _addUser(){
    if(_formKey.currentState.validate()){
      _showProgress('Adding User...');
      _setUser();
      UserService.addUser(_user).then((result){
        // _clearValues();
        _showProgress('User Detail');
        if(result != "error"){
          /* Fluttertoast.showToast(
                      msg: "Add User Success",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                    ); */
        }
      });
    }
  }

  _updateUser(){
    if(_formKey.currentState.validate()){
      _showProgress('Updating User...');
      _setUser();
      UserService.addUser(_user).then((result){
        _showProgress('User Detail');
      } );
    }
  }

  List<ModelElement> getListModelElement(){
    return <ModelElement>[
      ModelElement(textEditingController: _idUser, labelText: "ID", enabled: false, iconData: Icons.text_fields),
      ModelElement(textEditingController: _fullName, labelText: "Full Name", enabled: false, iconData: Icons.text_fields),
      ModelElement(textEditingController: _address, labelText: "Address", enabled: false, iconData: Icons.text_fields),
      ModelElement(textEditingController: _telp, labelText: "Telp", enabled: false, iconData: Icons.text_fields),
      ModelElement(textEditingController: _email, labelText: "Email", enabled: false, iconData: Icons.text_fields),
      ModelElement(textEditingController: _birthPlace, labelText: "Birth Place", enabled: false, iconData: Icons.text_fields),
    ];
  }

}