class UserModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? userName;
  String? name;
  String? role;
  String? maTinh;
  String? issued;
  String? expires;

  UserModel(
      {this.accessToken,
      this.tokenType,
      this.expiresIn,
      this.userName,
      this.name,
      this.role,
      this.maTinh,
      this.issued,
      this.expires});

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'expires_in': expiresIn,
      'userName': userName,
      'name': name,
      'role': role,
      'maTinh': maTinh,
      '.issued': accessToken,
      '.expires': accessToken,
    };
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    userName = json['userName'];
    name = json['name'];
    role = json['role'];
    maTinh = json['maTinh'];
    issued = json['.issued'];
    expires = json['.expires'];
  }
}
