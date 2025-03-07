import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_app/presentation/controller/auth/home/home_screen_controller.dart';

import 'package:third_app/presentation/screens/auth/view%20all%20episodes/widgets/episode_cards.dart';

class AllEpisodeScreen extends StatefulWidget {
  const AllEpisodeScreen({super.key});

  @override
  State<AllEpisodeScreen> createState() => _AllEpisodeScreenState();
}

class _AllEpisodeScreenState extends State<AllEpisodeScreen> {
  final HomeScreenController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "All Episodes : ${controller.characterById.value.episode.length} ",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                ),
                itemCount: controller.characterById.value.episode.length,
                itemBuilder: (BuildContext context, int index) {
                  return EpisodeCards(
                      link: controller.characterById.value.episode[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
