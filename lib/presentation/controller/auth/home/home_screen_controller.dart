import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:third_app/data/model/charachter_model.dart';

class HomeScreenController extends GetxController {
  var characterList = <Character>[].obs;

  final Dio _dio = Dio();

  Future<void> fetchCharacters() async {
    try {
      final response =
          await _dio.get('https://rickandmortyapi.com/api/character');

      if (response.statusCode == 200) {
        final List results = response.data['results'];

        characterList.value =
            results.map((json) => Character.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      print('Error fetching characters: $e');
      throw Exception('Failed to fetch characters');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }
}
