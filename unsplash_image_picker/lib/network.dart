import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:unsplash_image_picker/unsplash_result.dart';
import 'package:http/http.dart' as http;

Future<List<UnsplashResults>> fetchPhotos(http.Client client) async {
  final response = await client.get('https://jsonbox.io/box_5e9c00b2fa5702ea39b7');
  return compute(parseData, response.body);
}

List<UnsplashResults> parseData(String response) {
  final parsed = json.decode(response).cast<Map<String, dynamic>>();
  List<UnsplashResults> list = parsed.map<UnsplashResults>((json) => UnsplashResults.fromJson(json)).toList();
  return list;
}