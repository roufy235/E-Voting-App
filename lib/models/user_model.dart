class UserModel {
  String? fullName;
  String? uid;
  String? email;

  UserModel({this.fullName, this.uid, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    uid = json['uid'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['uid'] = uid;
    data['email'] = email;
    return data;
  }
}
