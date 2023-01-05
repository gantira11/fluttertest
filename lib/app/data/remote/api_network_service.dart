import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/constants.dart';
import '../exception/app_exception.dart';
import 'base_network_service.dart';

class ApiNetworkService extends BaseServiceNetwork {
  ApiNetworkService(this.localStorage);

  final SharedPreferences localStorage;

  String? _token;

  _getToken() async {
    final token = localStorage.getString(Constants.TOKEN_KEY);

    if (token == null) {
      _token = "";
    }

    _token = '$token';
  }

  _setHeaders() => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      };

  @override
  Future delete(String url) async {
    dynamic responseJson;
    try {
      await _getToken();
      final response = await http.delete(
        Uri.parse('${Constants.BASE_URL}$url'),
        headers: _setHeaders(),
      );
      responseJson = returnResponse(response);
    } on IOException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future fetch(String url) async {
    dynamic responseJson;
    try {
      await _getToken();
      final response = await http.get(
        Uri.parse('${Constants.BASE_URL}$url'),
        headers: _setHeaders(),
      );
      responseJson = returnResponse(response);
    } on IOException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future store(String url, data) async {
    dynamic responseJson;
    try {
      await _getToken();
      final response = await http.post(
        Uri.parse('${Constants.BASE_URL}$url'),
        body: jsonEncode(data),
        headers: _setHeaders(),
      );

      responseJson = returnResponse(response);
    } on IOException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future storeWithParams(
      String url, data, Map<String, dynamic> queryParams) async {
    dynamic responseJson;
    try {
      await _getToken();
      final response = await http.post(
        Uri.https('exercise.smtapps.net', url, queryParams),
        body: data,
        headers: _setHeaders(),
      );
      responseJson = returnResponse(response);
    } on IOException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future update(String url, data) async {
    dynamic responseJson;
    try {
      await _getToken();
      final response = await http.put(
        Uri.parse('${Constants.BASE_URL}$url'),
        headers: _setHeaders(),
      );
      responseJson = returnResponse(response);
    } on IOException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 201:
        return jsonDecode(response.body);

      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorizedException(response.body.toString());
      case 403:
        throw ForbiddenException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
      case 405:
        throw MethodNotAllowedException(response.body.toString());
      case 409:
        throw ConflictException(response.body.toString());

      case 500:
        throw InternalServerErrorException(response.body.toString());

      default:
        throw FetchDataException(
          'Error occured while communication with server with status code ${response.statusCode}',
        );
    }
  }
}
