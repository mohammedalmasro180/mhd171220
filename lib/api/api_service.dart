import 'package:http/http.dart' as http;

import 'dart:convert';
import '../model/login_model.dart';
class APIService {
  APIService();


  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String email;
    String pass;
    String url = "https://p3ly.com/api/customers/?filter[email]="+email+"&filter[passwd]="+pass+"";

    LoginRequestModel loginRequestModel=new LoginRequestModel(email: email,password: pass);
    print(url);
    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),

      );
      print(url);
    } else {
      print(url);
      throw Exception('Failed to load data!');
    }
  }
}
