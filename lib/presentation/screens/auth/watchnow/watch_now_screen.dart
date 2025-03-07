import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_app/presentation/controller/auth/home/home_screen_controller.dart';

class WatchNowScreen extends StatefulWidget {
  const WatchNowScreen({super.key});

  @override
  State<WatchNowScreen> createState() => _WatchNowScreenState();
}

final HomeScreenController controller = Get.find();

class _WatchNowScreenState extends State<WatchNowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(controller.characterById.value.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 8,
                shadowColor: Colors.black,
                color: Colors.black.withOpacity(0.5),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.singleEpisodeByLink.value.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black,
                              offset: Offset(3.0, 3.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'ID: ${controller.singleEpisodeByLink.value.id}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Characters: ${controller.singleEpisodeByLink.value.characters.length}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'URL: ${controller.singleEpisodeByLink.value.url}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Created: ${controller.singleEpisodeByLink.value.created.timeZoneName}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Air Date: ${controller.singleEpisodeByLink.value.airDate}',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.star,
                          color: Colors.yellowAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
