import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:third_app/data/model/single_charachter_model.dart';

class DisplayPageController extends GetxController {
  var characterbyIdList = <SingleCharachterModel>{}.obs;
  var isLoading = true.obs;
  var error = ''.obs;

  final Dio _dio = Dio();

  int characterId;

  DisplayPageController({required this.characterId});

  @override
  void onInit() {
    super.onInit();
    fetchCharacterbyId(characterId);
  }

  Future<void> fetchCharacterbyId(int id) async {
    try {
      isLoading.value = true;
      final singleResponse =
          await _dio.get('https://rickandmortyapi.com/api/character/$id');
      if (singleResponse.statusCode == 200) {
        SingleCharachterModel characterDataById =
            SingleCharachterModel.fromJson(singleResponse.data);
        characterbyIdList.add(characterDataById);
        print(characterDataById);
      }
    } catch (e) {
      error.value = 'Error fetching character: $e';
      print('Error fetching character: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
