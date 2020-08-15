import 'package:my212_mart/model/BaseModel.dart';

class User extends BaseModel{
  String idUser;//int
  String fullName;
  String birthPlace;
  String birthDate;
  String address;
  String gender;
  String religion;
  String telp;
  String email;
  String isPic;//int
  String note;
  String userName;
  String password;

  User({this.idUser, this.fullName, this.birthPlace, this.birthDate, this.address, this.gender, this.religion,
  this.telp, this.email, this.isPic, this.note, this.userName, this.password});

  factory User.fromJson(Map<String, dynamic>json){
    return User(
      idUser: json['id_user'] as String,
      fullName: json['full_name'] as String,
      birthPlace: json['birth_place'] as String,
      birthDate: json['birth_date'] as String,
      address: json['address'] as String,
      gender: json['gender'] as String,
      religion: json['religion'] as String,
      telp: json['telp'] as String,
      email: json['email'] as String,
      isPic: json['is_pic'] as String,
      note: json['note'] as String,
      userName: json['user_name'] as String,
      password: json['password'] as String,
    );
  }
}