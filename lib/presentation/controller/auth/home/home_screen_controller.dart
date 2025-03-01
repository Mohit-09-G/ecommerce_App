import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:third_app/data/model/charachter_model.dart';
import 'package:third_app/data/model/single_charachter_model.dart';

class HomeScreenController extends GetxController {
  RxList<Result> characterList = <Result>[].obs;
  Rx<SingleCharachterModel> characterById = Rx<SingleCharachterModel>(
      SingleCharachterModel(
          id: 0,
          name: '',
          status: Status.UNKNOWN,
          species: Species.HUMAN,
          type: '',
          gender: Gender.UNKNOWN,
          origin: Location(name: "", url: ""),
          location: Location(name: "", url: ""),
          image: '',
          episode: [],
          url: '',
          created: DateTime.now()));
  RxBool isLoading = true.obs;
  RxBool isDetailLoading = true.obs;
  RxString error = ''.obs;

  final Dio _dio = Dio();

  Future<void> fetchCharacters() async {
    try {
      isLoading.value = true;
      final response =
          await _dio.get('https://rickandmortyapi.com/api/character');

      if (response.statusCode == 200) {
        Character characterData = Character.fromJson(response.data);
        characterList.value = characterData.results;
      } else {
        error.value = 'Failed to load characters';
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      error.value = 'Error fetching characters: $e';
      if (kDebugMode) {
        print('Error fetching characters: $e');
      }
      throw Exception('Failed to fetch characters');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchCharacterbyId(int id) async {
    try {
      isDetailLoading.value = true;
      final singleResponse =
          await _dio.get('https://rickandmortyapi.com/api/character/$id');
<<<<<<< HEAD
      if (singleResponse.statusCode == 200) {
        characterById.value =
            SingleCharachterModel.fromJson(singleResponse.data);
=======
      if (singleRespose.statusCode == 200) {
        // Result characterdataById = Result.fromJson(singleRespose.data);
>>>>>>> ba5ba7d8d0d279c997a1ad0c5f592d65c64d96e0
      }
    } catch (e) {
      error.value = 'Error fetching characters: $e';
      if (kDebugMode) {
        print('Error fetching characters: $e');
      }
      throw Exception('Failed to fetch characters');
    } finally {
      isDetailLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }
}
