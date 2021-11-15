
class User {
  User({required this.phone, this.name, this.surname, this.email, this.address, this.pinCode});

  final String phone;
  final String? name;
  final String? surname;
  final String? email;
  final String? pinCode;
  final String? address;

  static User fromJson(Map<String, dynamic> json) {
    return User(
      phone: json['phone'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      pinCode: json['pin_code'],
      address: json['address']
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic> {
      'phone': phone,
      'name': name ?? '',
      'surname': surname ?? '',
      'email': email ?? '',
      'pin_code': pinCode ?? '',
      'address': address ??''
    };
  }
}