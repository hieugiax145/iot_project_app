class DropdownModel {
  int? id;
  String? name;
  String? phone;

  DropdownModel({this.id, this.name, this.phone});

  DropdownModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    name = json['name'] ?? json["fullName"];
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DropdownModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
