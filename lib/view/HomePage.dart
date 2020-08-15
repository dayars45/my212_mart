import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my212_mart/view/UserList.dart';


class HomePage extends StatelessWidget {

  List<String>listMenu = ["User", "Store", "Product"];
  final String imagePath = "assets/images/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath+"user.png"), fit: BoxFit.cover),),
        child: Container(
          margin: const EdgeInsets.only(top: 120.0),
          child: GridView(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: listMenu.map((title){
                return Card(
                    margin: const EdgeInsets.all(20.0),
                    child: getCardByTitle(title, context));
                    Fluttertoast.showToast(
                      msg: title+"click",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                    );
              }).toList(),
          ),
        ),));
  }

  GestureDetector getCardByTitle(String title, BuildContext context){
    String img = "";
    Widget list;
    if (title == "User"){
      img = imagePath + "user.png";
      list = UserList();
    } else if (title == "Store"){
      img = imagePath + "store.png";
      // list = StoreList();
    } else if (title == "Product"){
      img = imagePath + "product.png";
      // list = ProductList();
    }

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>list));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: Container(
              child: new Stack(children: <Widget>[
                new Image.asset(img, width:80.0, height: 80.0)
              ]),
            )),
          Text(title, 
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

}