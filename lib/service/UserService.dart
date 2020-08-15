import 'dart:convert';
import 'package:http/http.dart'
    as http; // add the http plugin in pubspec.yaml file.
import 'package:my212_mart/model/User.dart';

class UserService {
  // static const ROOT = 'https://fluttercrudmysql1.000webhostapp.com/user_action.php';
  static const ROOT =
      'http://192.168.43.157:122/my212mart/user_action.php'; //local
  static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_ACTION = 'ADD';
  // static const _ADD_EMPLOYEE_ACTION = 'ADD_EMP';
  static const _UPDATE_ACTION = 'UPDATE';
  static const _DELETE_ACTION = 'DELETE';

  // Method to create the table Users.
  static Future<String> createTable() async {
    try {
      // add the parameters to pass to the request.
      var map = Map<String, dynamic>();
      map['action'] = _CREATE_TABLE_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Create Table Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<List<User>> getUsers() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      print('getUsers Response: ${response.body}');
      if (200 == response.statusCode) {
        List<User> list = parseResponse(response.body);
        return list;
      } else {
        return List<User>();
      }
    } catch (e) {
      return List<User>(); // return an empty list on exception/error
    }
  }

  static List<User> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  // Method to add user to the database...
  static Future<String> addUser(User user) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_ACTION;
      // map['id_user'] = ''; AUTO INCREMENT
      map['full_name'] = user.fullName;
      map['birth_place'] = user.birthPlace;
      map['birth_date'] = user.birthDate;
      map['address'] = user.address;
      map['gender'] = user.gender;
      map['religion'] = user.religion;
      map['telp'] = user.telp;
      map['email'] = user.email;
      map['is_pic'] = user.isPic;
      map['note'] = user.note;
      map['user_name'] = user.userName;
      map['password'] = user.password;
      final response = await http.post(ROOT, body: map);
      print('addUser Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to update an User in Database...
  static Future<String> updateUser(User user) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_ACTION;
      map['full_name'] = user.fullName;
      map['birth_place'] = user.birthPlace;
      map['birth_date'] = user.birthDate;
      map['address'] = user.address;
      map['gender'] = user.gender;
      map['religion'] = user.religion;
      map['telp'] = user.telp;
      map['email'] = user.email;
      map['is_pic'] = user.isPic;
      map['note'] = user.note;
      map['user_name'] = user.userName;
      map['password'] = user.password;
      final response = await http.post(ROOT, body: map);
      print('updateUser Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to Delete an User from Database...
  static Future<String> deleteUser(String idUser) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _DELETE_ACTION;
      map['id_user'] = idUser;
      final response = await http.post(ROOT, body: map);
      print('deleteUser Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error"; // returning just an "error" string to keep this simple...
    }
  }
}
