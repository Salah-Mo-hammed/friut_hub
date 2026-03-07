class Endpoints {
  static const baseUrl = "http://127.0.0.1:8080";
  // ! =================== Auth ====================
  static const registerUser = "/api/Users";
  static const emailConfirmation = "/api/email-confirmations";
  static const login = "/api/sessions";
  static const getLoggedUserData =
      "/api/Users/me"; // require access token(from login endpoint)
  static const resetPassword = "/api/password-resets";
  static const verifyPassOTP = '/api/password-resets/verify';
  static const changeToNewPassword = "/api/password-resets";
  // ! =================== Products ====================
  static const getAllProducts =
      '/api/Products'; // note: also for get detaild product bt Id

  // ! =================== Categories ====================
  static const getAllCategories = "/api/Categories";

  static const addToCart = "/api/Cart";

  // ! =================== Orders ====================
  static const createOrder = "/api/Orders";
}
