import 'package:bookmyshow/models/movie_model.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieList with ChangeNotifier {
  List? trendingMovies = [];
  List? tv = [];
  List? topRatedMovies = [];

  List<Movie> movieList = [];

  final String apikey = '4d787d53b25af3a115347b6db2063faa';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZDc4N2Q1M2IyNWFmM2ExMTUzNDdiNmRiMjA2M2ZhYSIsInN1YiI6IjYzMjA1ODQ4Y2U5ZTkxMDA3Zjc1ZWRlYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-SzjQqBNJ2trYEMfcKXP0tH0VB8HRY2kVAhP9fGIZ4Q';
  int i = 0;
  MovieList() {
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readAccessToken),
      logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
    );

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getAiringToday();

    trendingMovies = trendingResult['results'];
    topRatedMovies = topRatedResults['results'];
    tv = tvresult['results'];
    //print(trendingMovies![1]);
    notifyListeners();
    for (int i = 0; i < trendingMovies!.length; i++) {
      //print((trendingMovies![i] as Map<String, dynamic>)['original_title']);
      movieList
          .add((Movie.fromJson(trendingMovies![i] as Map<String, dynamic>)));
    }
  }

  List? get trendingMoviesList {
    return [...trendingMovies!];
  }

  List? get topRatedMoviesList {
    return [...topRatedMovies!];
  }

  List? get tvShowsList {
    return [...tv!];
  }

  int activeIndex = 0;
  void activeIndexFunction(int i) {
    activeIndex = i;
    notifyListeners();
  }
}
