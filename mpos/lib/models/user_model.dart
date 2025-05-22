class UserModel {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String password;
  final String? passwordConfirm;
  final String? phone;
  final String? userName;

  UserModel({
    this.email,
    required this.password,
    this.firstName,
    this.lastName,
    this.passwordConfirm,
    this.phone,
    this.userName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {'email': email, 'password': password};
    if (firstName != null) data['first_name'] = firstName;
    if (lastName != null) data['last_name'] = lastName;
    if (passwordConfirm != null) data['password_confirm'] = passwordConfirm;
    if (phone != null) data['phone'] = phone;
    if (userName != null) data['user_name'] = userName;
    return data;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      passwordConfirm: json['password_confirm'],
      phone: json['phone'],
      userName: json['user_name'],
    );
  }
}
