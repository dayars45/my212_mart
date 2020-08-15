
class BaseModel{
  String createdDate;
  String createdBy;
  String modifyDate;
  String modifyBy;

  BaseModel({this.createdDate, this.createdBy, this.modifyDate, this.modifyBy});

  factory BaseModel.fromJson(Map<String, dynamic>json){
    return BaseModel(
      createdDate: json['created_date'] as String,
      createdBy: json['created_by'] as String,
      modifyDate: json['modify_date'] as String,
      modifyBy: json['modify_by'] as String
    );
  }
} 