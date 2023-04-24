import 'package:json2dart_safe/json2dart.dart';

class UserInfoModel {
  String? createBy;
  String? createTime;
  String? updateBy;
  String? updateTime;
  String? remark;
  int? userId;
  String? deptId;
  String? userName;
  String? nickName;
  String? email;
  String? phonenumber;
  String? sex;
  String? avatar;
  String? password;
  String? status;
  String? delFlag;
  String? loginIp;
  String? loginDate;
  String? dept;
  List<Roles>? roles;
  String? roleIds;
  String? postIds;
  String? roleId;
  bool? admin;

  UserInfoModel({
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.remark,
    this.userId,
    this.deptId,
    this.userName,
    this.nickName,
    this.email,
    this.phonenumber,
    this.sex,
    this.avatar,
    this.password,
    this.status,
    this.delFlag,
    this.loginIp,
    this.loginDate,
    this.dept,
    this.roles,
    this.roleIds,
    this.postIds,
    this.roleId,
    this.admin,
  });

  Map<String, dynamic> toJson() {
    return Map<String, dynamic>()
      ..put('createBy', this.createBy)
      ..put('createTime', this.createTime)
      ..put('updateBy', this.updateBy)
      ..put('updateTime', this.updateTime)
      ..put('remark', this.remark)
      ..put('userId', this.userId)
      ..put('deptId', this.deptId)
      ..put('userName', this.userName)
      ..put('nickName', this.nickName)
      ..put('email', this.email)
      ..put('phonenumber', this.phonenumber)
      ..put('sex', this.sex)
      ..put('avatar', this.avatar)
      ..put('password', this.password)
      ..put('status', this.status)
      ..put('delFlag', this.delFlag)
      ..put('loginIp', this.loginIp)
      ..put('loginDate', this.loginDate)
      ..put('dept', this.dept)
      ..put('roles', this.roles?.map((v) => v.toJson()).toList())
      ..put('roleIds', this.roleIds)
      ..put('postIds', this.postIds)
      ..put('roleId', this.roleId)
      ..put('admin', this.admin);
  }

  UserInfoModel.fromJson(Map<dynamic, dynamic> json) {
    this.createBy = json.asString('createBy');
    this.createTime = json.asString('createTime');
    this.updateBy = json.asString('updateBy');
    this.updateTime = json.asString('updateTime');
    this.remark = json.asString('remark');
    this.userId = json.asInt('userId');
    this.deptId = json.asString('deptId');
    this.userName = json.asString('userName');
    this.nickName = json.asString('nickName');
    this.email = json.asString('email');
    this.phonenumber = json.asString('phonenumber');
    this.sex = json.asString('sex');
    this.avatar = json.asString('avatar');
    this.password = json.asString('password');
    this.status = json.asString('status');
    this.delFlag = json.asString('delFlag');
    this.loginIp = json.asString('loginIp');
    this.loginDate = json.asString('loginDate');
    this.dept = json.asString('dept');
    this.roles = json.asList<Roles>('roles', (v) => Roles.fromJson(v));
    this.roleIds = json.asString('roleIds');
    this.postIds = json.asString('postIds');
    this.roleId = json.asString('roleId');
    this.admin = json.asBool('admin');
  }

  static UserInfoModel toBean(Map<String, dynamic> json) =>
      UserInfoModel.fromJson(json);
}

class Roles {
  Map<dynamic, dynamic> toJson() {
    return Map<dynamic, dynamic>();
  }

  Roles.fromJson(Map<dynamic, dynamic> json) {}
}
