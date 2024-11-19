// views/PostView.dart

import 'liga_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../bottom_nav.dart';  // Import bottom nav
import '../../database/db_helper.dart';  // Import database helper

class AnimeView extends StatelessWidget {
  final AnimeController animeController = Get.put(AnimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime List'),
        automaticallyImplyLeading: false, // Hilangkan tombol back
      ),
      body: Obx(() {
        if (animeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (animeController.postList.isEmpty) {
          return Center(child: Text('No Data Available'));
        }
        return ListView.builder(
          itemCount: animeController.postList.length,
          itemBuilder: (context, index) {
            final post = animeController.postList[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: ListTile(
                leading: Image.network(
                  post.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(post.title), 
                subtitle: Text(post.type),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () async {
                        try {
                          // Cek apakah anime sudah ada di favorit
                          bool exists = await DatabaseHelper.instance.checkFavorite(post.id);
                          
                          if (!exists) {
                            // Jika belum ada, tambahkan ke favorit
                            await DatabaseHelper.instance.addFavorite(post);
                            Get.snackbar(
                              'Success',
                              '${post.title} added to favorites',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                              duration: Duration(seconds: 2),
                            );
                          } else {
                            // Jika sudah ada, tampilkan pesan
                            Get.snackbar(
                              'Info',
                              '${post.title} is already in favorites',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.blue,
                              colorText: Colors.white,
                              duration: Duration(seconds: 2),
                            );
                          }
                        } catch (e) {
                          Get.snackbar(
                            'Error',
                            'Failed to add to favorites',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            duration: Duration(seconds: 2),
                          );
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.navigate_next),
                      onPressed: () {
                        Get.toNamed('/favorite');
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: BottomNavBar(), // Tambahkan bottom navigation bar
    );
  }
}