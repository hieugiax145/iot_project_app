class SensorsDataModel {
  int? id;
  num? temp;
  num? hum;
  num? light;
  String? time;

  SensorsDataModel({this.id, this.temp, this.hum, this.light, this.time});

  SensorsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    temp = json['temp'];
    hum = json['hum'];
    light = json['light'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['temp'] = this.temp;
    data['hum'] = this.hum;
    data['light'] = this.light;
    data['time'] = this.time;
    return data;
  }
}
