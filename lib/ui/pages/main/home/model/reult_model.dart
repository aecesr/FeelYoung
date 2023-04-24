import 'package:FeelYoung_getx/ui/pages/main/home/model/user_info.dart';
import 'package:json2dart_safe/json2dart.dart';

class ResultModel{
  String? msg;
  int? code;
  List<Permissions>? permissions;
  List<Roles>? roles;
  UserInfoModel? user;

  ResultModel({this.msg,this.code,this.permissions,this.roles,this.user,});

  Map<String, dynamic> toJson() {
    return Map<String, dynamic>()
      ..put('msg',this.msg)
      ..put('code',this.code)
      ..put('permissions',this.permissions?.map((v)=>v.toJson()).toList())
      ..put('roles',this.roles?.map((v)=>v.toJson()).toList())
      ..put('user',this.user?.toJson());
  }

  ResultModel.fromJson(Map<String, dynamic> json) {
    this.msg=json.asString('msg');
    this.code=json.asInt('code');
    this.permissions=json.asList<Permissions>('permissions',(v)=>Permissions.fromJson(v));
    this.roles=json.asList<Roles>('roles',(v)=>Roles.fromJson(v));
    this.user=json.asBean('user',(v)=>UserInfoModel.fromJson(v));
  }

  static ResultModel toBean(Map<String, dynamic> json) => ResultModel.fromJson(json);
}

class Permissions{

  Map<dynamic, dynamic> toJson() {
    return Map<dynamic, dynamic>();
  }

  Permissions.fromJson(Map<dynamic, dynamic> json) {
  }
}

class Roles{

  Map<dynamic, dynamic> toJson() {
    return Map<dynamic, dynamic>();
  }

  Roles.fromJson(Map<dynamic, dynamic> json) {
  }
}
