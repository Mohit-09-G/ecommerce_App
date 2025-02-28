import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:third_app/data/model/charachter_model.dart';

class HomeScreenController extends GetxController {
  var characterList = <Result>[].obs;
  var characterbyIdList = <Result>{}.obs;
  var isLoading = true.obs;
  var error = ''.obs;

  final Dio _dio = Dio();

  Future<void> fetchCharacters() async {
    try {
      isLoading.value = true;
      final response =
          await _dio.get('https://rickandmortyapi.com/api/character');

      if (response.statusCode == 200) {
        Character characterData = Character.fromJson(response.data);
        characterList.value = characterData.results;
        print(characterList);
      } else {
        error.value = 'Failed to load characters';
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      error.value = 'Error fetching characters: $e';
      print('Error fetching characters: $e');
      throw Exception('Failed to fetch characters');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchCharacterbyId(int id) async {
    try {
      isLoading.value = true;
      final singleRespose =
          await _dio.get('https://rickandmortyapi.com/api/character/$id');
      if (singleRespose.statusCode == 200) {
        Result characterdataById = Result.fromJson(singleRespose.data);
      }
    } catch (e) {
      error.value = 'Error fetching characters: $e';
      print('Error fetching characters: $e');
      throw Exception('Failed to fetch characters');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }
}
