import 'package:third_app/data/model/single_charachter_model.dart';

class CheckoutModel {
  final int id;
  final List<SingleCharachterModel> characterGroups;

  CheckoutModel({
    required this.id,
    required this.characterGroups,
  });

  static List<CheckoutModel> demo(List<dynamic> data) {
    List<CheckoutModel> result = [];

    for (var item in data) {
      item.forEach((key, value) {
        int groupId = key;
        List<SingleCharachterModel> characters =
            List<SingleCharachterModel>.from(value);

        result.add(CheckoutModel(
          id: groupId,
          characterGroups: characters,
        ));
      });
    }

    return result;
  }
}
