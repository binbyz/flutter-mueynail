class ApiService {
  ApiService._construct();

  static final ApiService _instance = ApiService._construct();

  factory ApiService() {
    return _instance;
  }
}