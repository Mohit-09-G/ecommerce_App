import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:third_app/data/model/charachter_model.dart';

class HomeScreenController extends GetxController {
  // Observable list to store fetched characters
  var characterList = <Character>[].obs;

  // Dio instance for making API requests
  final Dio _dio = Dio();

  // Function to fetch character data from the API
  Future<void> fetchCharacters() async {
    try {
      // Make GET request using Dio
      final response =
          await _dio.get('https://rickandmortyapi.com/api/character');

      // Check if response is successful (status code 200)
      if (response.statusCode == 200) {
        // Decode the 'results' part of the JSON response
        final List results = response.data['results'];

        // Convert each result into a Character object and add it to the list
        characterList.value =
            results.map((json) => Character.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print('Error fetching characters: $e');
      throw Exception('Failed to fetch characters');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCharacters(); // Automatically fetch characters when the controller is initialized
  }
}
