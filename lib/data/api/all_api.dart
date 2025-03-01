import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:third_app/config/rick_api.dart';

class AllApi extends RickAndMortyApi {
  final Dio _dio = Dio();

  // Method to fetch characters that can be called from a controller
  Future<dynamic> getCharacters() async {
    try {
      final response = await _dio.get(RickAndMortyApi.charactersEndpoint);
      return response.data;
    } catch (e) {
      // Handle errors
      if (kDebugMode) {
        print('Error fetching characters: $e');
      }
      rethrow;
    }
  }
}
