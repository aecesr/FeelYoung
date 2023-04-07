class TempHumiModel {
  int? temp;
  int? humi;

  TempHumiModel({this.temp, this.humi});

  TempHumiModel.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    humi = json['humi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['humi'] = this.humi;
    return data;
  }
}
