class User {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String securityQuestion;
  final String securityAnswer;

  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.securityQuestion,
    required this.securityAnswer,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'securityQuestion': securityQuestion,
      'securityAnswer': securityAnswer,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
      securityQuestion: map['securityQuestion'],
      securityAnswer: map['securityAnswer'],
    );
  }
}
