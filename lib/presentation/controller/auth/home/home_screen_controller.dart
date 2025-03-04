import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:third_app/config/app_route.dart';

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

  RxList<SingleCharachterModel> characterListOfCart =
      <SingleCharachterModel>[].obs;
  Map<int, List<SingleCharachterModel>> mapByID = {};
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
      if (singleResponse.statusCode == 200) {
        characterById.value =
            SingleCharachterModel.fromJson(singleResponse.data);
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

  // void addtoCart(Rx<SingleCharachterModel> characterById) {
  //   characterListOfCart.add(characterById.value);
  //   print(characterListOfCart.value[0].id);

  //   for (int i = 0; i < characterListOfCart.value.length; i++) {
  //     SingleCharachterModel character = characterListOfCart.value[i];
  //     mapByID[character.id] = character;
  //     print(mapByID);
  //   }
  // }

  void addtoCart(Rx<SingleCharachterModel> characterById) {
    SingleCharachterModel character = characterById.value;

    if (mapByID.containsKey(character.id)) {
      mapByID[character.id]!.add(character);
    } else {
      mapByID[character.id] = [character];
    }

    characterListOfCart.add(character);

    print(mapByID);

    mapByID.forEach((key, value) {
      print("Length of the list for key '$key': ${value.length}");
    });
  }

  void removetoCart(Rx<SingleCharachterModel> characterById) {
    SingleCharachterModel charachter = characterById.value;
    if (mapByID.containsKey(charachter.id)) {
      mapByID[charachter.id]!.remove(charachter);
    }

    characterListOfCart.remove(charachter);
    print(mapByID);

    mapByID.forEach((key, value) {
      print("Length of the list for key '$key': ${value.length}");
    });
  }

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  void navigateToProfile() {
    Get.toNamed(AppRoutes.profileScreen);
  }

  void navigateToCheckout() {
    Get.toNamed(AppRoutes.checkoutScreen);
  }
}
