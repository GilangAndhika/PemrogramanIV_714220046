import 'package:flutter/material.dart';
import 'package:p4_1_714220046/detail_screen.dart';
import 'package:p4_1_714220046/model/tourism_place.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Tempat Wisata Bandung'),
      ),

      body: ListView.builder(
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(place: place);
              }));
            },

            child: Card(
              child: Row(
            
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
            
                  Expanded(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 4/3,
                      child: Image.asset(place.imageAsset, fit: BoxFit.cover),
                      ),
                  ),
            
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
            
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
            
                          Text(
                            place.name,
                            style: const TextStyle(fontSize: 16),
                          ),
            
                          const SizedBox(height: 10),
            
                          Text(place.location),
                        ],
            
                      ),
                    ),
                  )
            
                ],
              ),
            ),
          );

        },
      itemCount: tourismPlaceList.length
      ),

    );
  }
}