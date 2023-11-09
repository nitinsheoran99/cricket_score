import 'dart:convert';

import 'package:cricket_score/model/match_api_response.dart';
import 'package:cricket_score/util/api_endpoints.dart';
import 'package:http/http.dart' as http;

class MatchApiService{
static  Future<MatchApiResponse> getMatchInfo() async {
    String url = ApiEndpoint.baseURl;
    http.Response response = await http.get(
      Uri.parse(url),

    );
    if (response.statusCode == 200) {
      String body = response.body;
      final data = jsonDecode(body);

     return MatchApiResponse.fromJson(data);
    } else {
      throw 'Something went wrong';
    }
  }
}