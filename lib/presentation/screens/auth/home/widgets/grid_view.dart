import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:third_app/config/app_route.dart';
import 'package:third_app/data/model/charachter_model.dart';
import 'package:third_app/presentation/controller/auth/home/home_screen_controller.dart';

class CharacterGridView extends StatelessWidget {
  final int itemCount;
  final List<Result> characters;

  const CharacterGridView({
    super.key,
    required this.itemCount,
    required this.characters,
  });

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.find<HomeScreenController>();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MasonryGridView.count(
        itemCount: itemCount,
        crossAxisCount: 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
        itemBuilder: (BuildContext ctx, index) {
          final character = characters[index];

          return GestureDetector(
            onTap: () {
              controller.fetchCharacterbyId(character.id);

              Get.toNamed(
                AppRoutes.displayScreen,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        character.image,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          character.name,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            height: 1.1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: character.status.name == Status.ALIVE.name
                                  ? Colors.green
                                  : Colors.red,
                              size: 8,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${character.status.name} - ${character.species.name}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontSize: 10.0,
                                height: 16.0 / 10.0,
                                letterSpacing: 0.0,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              character.gender.name,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontSize: 10.0,
                                height: 16.0 / 10.0,
                                letterSpacing: 0.0,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              "Episode - ${character.episode.length.toString()}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontSize: 10.0,
                                height: 16.0 / 10.0,
                                letterSpacing: 0.0,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Location - ${character.location.name}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.0,
                                  height: 16.0 / 10.0,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
