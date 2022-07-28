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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['uid'] = this.uid;
    data['email'] = this.email;
    return data;
  }
}
