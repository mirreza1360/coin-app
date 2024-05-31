import 'dart:convert';
import 'dart:io';
import 'package:shopping/constants/base_url.dart';
import 'package:shopping/data/app_exeptions.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/data/network/base_api_servise.dart';

class NetworkApiServise extends BaseApiServise {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      var response = await http
          .get(Uri.parse(BASE_URL))
          .timeout(const Duration(seconds: 5));
      responseJson = returneResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('no internet');
    }
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      var response = await http
          .post(Uri.parse(BASE_URL), body: data)
          .timeout(const Duration(seconds: 5));
      responseJson = returneResponse(response);
    } on SocketException {
      throw FetchDataException('no internet');
    }
    return responseJson;
  }

  dynamic returneResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
      case 500:
        throw UnauthorizeException(response.body.toString());
      default:
        throw FetchDataException('Error accorded while communicate' +
            'with statusCode' +
            response.statusCode.toString());
    }
  }
}
