class LoginCall {
  String name;

  LoginCall({
    this.name,
  });

  factory LoginCall.fromJson(Map<String, dynamic> json) {
    return LoginCall(
      name: json['name'] as String,
    );
  }
}

