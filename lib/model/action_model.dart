class ActionModel {
  String? device;
  int? action;
  int? id;
  String? time;

  ActionModel({this.device, this.action, this.id, this.time});

  ActionModel.fromJson(Map<String, dynamic> json) {
    device = json['device'];
    action = json['action'];
    id = json['id'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device'] = this.device;
    data['action'] = this.action;
    data['id'] = this.id;
    data['time'] = this.time;
    return data;
  }
}
