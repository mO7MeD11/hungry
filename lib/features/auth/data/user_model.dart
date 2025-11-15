class UserModel {
  final String name;
  final String email;
  final String? image;
  final String? token;
  final String? vise;
  final String? address;

  UserModel({
    required this.name,
    required this.email,

    this.image,

    this.token,

    this.vise,

    this.address,
  });

  factory UserModel.fromjson(json) {
    return UserModel(
      name: json['name']??'',
      email: json['email']??'',
      address: json['address']??'',
      image: json['image']??'',
      token: json['token']??'',
      vise: json['Visa']??'',
    );
  }
}
