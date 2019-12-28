import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:unsplash_image_picker/unsplash_result.dart';
import 'package:http/http.dart' as http;

Future<List<UnsplashResults>> fetchPhotos(http.Client client) async {
  Map<String, String> headers = {
    'Authorization': 'Client-ID 8e16e199e78d056d66a1f9ff249b8a4391482fcfef2833d56f76caf85a27a5b8'
  };
  final response = await client
      .get('https://api.unsplash.com/photos?page=1', headers: headers);
  return compute(parseData, response.body);
}

List<UnsplashResults> parseData(String response) {
  final parsed = json.decode(response).cast<Map<String, dynamic>>();
  List<UnsplashResults> list = parsed.map<UnsplashResults>((json) => UnsplashResults.fromJson(json)).toList();
  return list;
}