import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:third_app/config/app_route.dart';

import 'package:third_app/data/model/charachter_model.dart';
import 'package:third_app/data/model/checkout_model.dart';
import 'package:third_app/data/model/single_charachter_model.dart';
import 'package:third_app/data/model/single_episode_model.dart';

class HomeScreenController extends GetxController {
  RxList<Result> characterList = <Result>[].obs;
  RxList<CheckoutModel> checkoutList = <CheckoutModel>[].obs;
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
  Rx<SingleEpisodeModel> singleEpisodeByLink = Rx<SingleEpisodeModel>(
      SingleEpisodeModel(
          id: 0,
          name: '',
          url: '',
          created: DateTime.now(),
          airDate: '',
          episode: '',
          characters: []));
  RxList<SingleCharachterModel> characterListOfCart =
      <SingleCharachterModel>[].obs;

  Map<int, String> allEpisodeMapByChrachterID = {};

  RxList<Map<int, List<SingleCharachterModel>>> listOffallItems =
      RxList<Map<int, List<SingleCharachterModel>>>();

  Map<int, List<SingleCharachterModel>> mapByID = {};
  RxBool isLoading = true.obs;
  RxBool isDetailLoading = true.obs;
  RxString error = ''.obs;

  final Dio _dio = Dio();

  //home page fetch all charachters
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

  // this is for  fectch the  charachter id  from homepage to pass to siplay page
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

    // for (var url in characterById.value.episode) {
    //   var id = int.parse(url.split('/').last);
    //   allEpisodeMapByChrachterID[id] = url;
    // }
    // allEpisodeMapByChrachterID.forEach((id, url) {
    //   print('Episode ID: $id, URL: $url');
    // });
  }

  Future<void> fetchEpisodeId(String id) async {
    try {
      // isDetailLoading.value = true;
      final singleResponse = await _dio.get(id);
      if (singleResponse.statusCode == 200) {
        SingleEpisodeModel singleEpisodeModeldata =
            SingleEpisodeModel.fromJson(singleResponse.data);
        singleEpisodeByLink.value = singleEpisodeModeldata;
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

  void addToList() {
    // if (characterById.value == null) {
    //   print("Error: Character not found.");
    //   return;
    // }
    SingleCharachterModel charchter = characterById.value;
    if (listOffallItems.isEmpty) {
      print("Error: listOffallItems is empty.");
    }
    bool keyFound = false;
    for (Map<int, List<SingleCharachterModel>> map in listOffallItems) {
      map.forEach((key, value) {
        if (key == charchter.id) {
          value.add(charchter);
          keyFound = true;
        }
      });
    }
    if (!keyFound) {
      listOffallItems.add({
        charchter.id: [charchter],
      });
    }
    checkoutList.value = CheckoutModel.demo(listOffallItems);
  }

  void removefromList() {
    if (characterById.value == null) {
      print("Error: Character not found.");
      return;
    }
    SingleCharachterModel charchter = characterById.value;
    if (listOffallItems.isEmpty) {
      print("Error: listOffallItems is empty.");
    }
    bool keyFound = false;
    List<int> keysToRemove = [];
    for (Map<int, List<SingleCharachterModel>> map in listOffallItems) {
      map.forEach((key, value) {
        if (key == charchter.id) {
          value.remove(charchter);
          keyFound = true;
          if (value.isEmpty) {
            keysToRemove.add(key);
          }
        }
      });
    }
    if (!keyFound) {
      listOffallItems.remove({
        charchter.id: [charchter],
      });
    }
    for (int key in keysToRemove) {
      for (Map<int, List<SingleCharachterModel>> map in listOffallItems) {
        map.remove(key);
      }
    }
    checkoutList.value = CheckoutModel.demo(listOffallItems);
  }

  RxList<SingleCharachterModel> getCharacterGroupById(int id) {
    var checkoutModel = checkoutList.firstWhere(
      (checkout) => checkout.id == id,
      orElse: () => CheckoutModel(id: 0, characterGroups: []),
    );

    return checkoutModel.characterGroups.obs;
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

  void navigateTOAllEpisode() {
    Get.toNamed(AppRoutes.allEpisodesScreen);
  }

  void navigateTOWatchNow() {
    Get.toNamed(AppRoutes.watchNowScreen);
  }
}
