class Endpoints {
  static const registerUser = "/api/Users";
  static const emailConfirmation = "/api/email-confirmations";
  static const login = "/api/sessions";
  static const getLoggedUserData = "/api/Users/me"; // require access token(from login endpoint)
  static const resetPassword = "/api/password-resets";
  static const verifyPassOTP = '/api/password-resets/verify';
  static const changeToNewPassword = "/api/password-resets";
}
