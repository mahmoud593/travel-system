import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FirebaseApi {
  static const String baseUrl = "https://airline-system-4e527-default-rtdb.firebaseio.com";

  // post
  static Future<Map<String, dynamic>> postCall({required String path, required Map<String, dynamic> data}) async {
    final url = Uri.parse('$baseUrl/$path.json');
    try {
      final response = await http.post(url, body: json.encode(data));
      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      }else{
        throw Exception('Failed to create data ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Read
  static Future<Map<String, dynamic>> getCall({required String path}) async {
    final url = Uri.parse('$baseUrl/$path.json');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to read data ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Update
  static Future<Map<String, dynamic>> updateCall({required String path, required Map<String, dynamic> data}) async {
    final url = Uri.parse('$baseUrl/$path.json');
    try {
      final response = await http.patch(url, body: json.encode(data));
      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      }else{
        throw Exception('Failed to update data ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Put
  static Future<void> putCall({required String path, required Map<String, dynamic> data}) async {
    final url = Uri.parse('$baseUrl/$path.json');
    try {
      final response = await http.put(url, body: json.encode(data));
      if (response.statusCode == 200) {
        debugPrint("Put successful $url");
      } else {
        throw Exception('Failed to put data ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Delete
  static Future<void> deleteCall({required String path}) async {
    final url = Uri.parse('$baseUrl/$path.json');
    try {
      final response = await http.delete(url);
      if (response.statusCode == 200) {
        debugPrint("deleted successful $url");
      }else{
        throw Exception('Failed to delete data ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
