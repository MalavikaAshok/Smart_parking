class User{
  final String userid;
  final String username;
  final String email;
  final String password;
  final double mobile;
  final String vehicle;


  User(
    this.userid,
    this.username,
    this.email,
    this.password,
    this.mobile,
    this.vehicle
  );

  Map<String, dynamic> toMap() {
    return{
      'userid':userid,
      'username':username,
      'email': email,
      'password': password,
      'mobile': mobile,
      'vehicle': vehicle,
    };
  }

  static User fromMap(Map<String, dynamic> map){
    if(map == null)return null;

    return User(
      userid: map['userid'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
      mobile: map['mobile'],
      vehicle: map['vehicle'],
  
      );
  }


}
