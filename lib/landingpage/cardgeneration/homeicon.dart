import 'package:bookmyshow/landingpage/landingpage.dart';
import 'package:bookmyshow/landingpage/pagebuilder/seeallpage.dart';
import 'package:bookmyshow/landingpage/pagebuilder/trending.dart';
import 'package:bookmyshow/widgets/testing.dart';
import 'package:flutter/material.dart';

class HomeIcon {
  String? iconUrl;
  List? trendList;
  HomeIcon({this.iconUrl, this.trendList});
}

List<HomeIcon> iconList = [
  HomeIcon(
    iconUrl:
        'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/icd-movies-collection-202201201113.png',
  ),
  HomeIcon(
    iconUrl:
        'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/icd-stream-collection-202201201113.png',
  ),
  HomeIcon(
    iconUrl:
        'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/pro-kabaddi-league-collection-202209280447.png',
  ),
  HomeIcon(
    iconUrl:
        'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/icd-music-shows-collection-202201201113.png',
  ),
  HomeIcon(
    iconUrl:
        'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/icd-comedy-shows-collection-202201201113.png',
  ),
  HomeIcon(
    iconUrl:
        'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/icd-sports-collection-202201201113.png',
  ),
  HomeIcon(
    iconUrl:
        'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/icd-plays-collection-202201201113.png',
  ),
  HomeIcon(
    iconUrl:
        'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-800,h-800:w-300:q-80/icd-see-all-collection-202201201113.png',
  ),
];

class IconGenerator extends StatefulWidget {
  HomeIcon? icon;
  IconGenerator({this.icon});

  @override
  State<IconGenerator> createState() => _IconGeneratorState(icon: icon);
}

class _IconGeneratorState extends State<IconGenerator> {
  HomeIcon? icon;
  _IconGeneratorState({this.icon});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      key: const PageStorageKey<String>('page1'),
      itemCount: iconList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => InternetChecker()));
        },
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => SeeAllPage())),
        child: Container(
          height: 70,
          width: 70,
          child: Image(
            image: NetworkImage(iconList[index].iconUrl.toString()),
          ),
        ),
      ),
    );
  }
}
