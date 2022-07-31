class LoginRequest {
  LoginRequest(
    this.eamil,
    this.password,
  );
  String eamil;
  String password;
}

class RegisterRequest {
  String userName;
  String countryMobileCode;
  String mobileNumber;
  String email;
  String password;
  String profilePicture;

  RegisterRequest(this.userName, this.countryMobileCode, this.mobileNumber,
      this.email, this.password, this.profilePicture);
}
