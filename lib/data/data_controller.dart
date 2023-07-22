// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

abstract class ContentControllerFunctions {
  Future<List<dynamic>> GetCategories();
  Future<List<dynamic>> getTrending();
  Future<List<dynamic>> getUpComming();
  Future<List<dynamic>> getPopularMovies();
  Future<List<dynamic>> getTvShows();
}

class MovieAuth {
  static const apiKey = "7ecdfea4b70057158e29312eabf15480";
  static const readAccessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZWNkZmVhNGI3MDA1NzE1OGUyOTMxMmVhYmYxNTQ4MCIsInN1YiI6IjYyMWYxMGNhNzcxOWQ3MDA2ZGExMTRiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hs2jPJpumtgIMbQF9zSFbiOl1HTDWyyewQAHR39RKzg";
}

class ContentController {
  ContentController._internal();

  static ContentController instance = ContentController._internal();

  factory ContentController() {
    return instance;
  }
  String homePoster =
      "https://m.media-amazon.com/images/M/MV5BZjgwOGI3ZWEtNjBiMy00ZjM3LWFkNWYtNmU1MzY1ZGZkMDU2XkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg";

  ValueNotifier<List<dynamic>> trendingNotifier = ValueNotifier([]);

  ValueNotifier<List<dynamic>> tvNotifier = ValueNotifier([]);

  ValueNotifier<List<dynamic>> topMoviesNotifier = ValueNotifier([]);

  ValueNotifier<List<dynamic>> popularNotifier = ValueNotifier([]);

  ValueNotifier<List<dynamic>> upcomingNotifier = ValueNotifier([]);

  ValueNotifier<bool> isLoading = ValueNotifier(false);

  //List topMovies = [];

  TMDB? tmdbData;

  refresh() {
    getContent();
    GetCategories();
    getTrending();
    getUpComming();
    getPopularMovies();
    getTvShows();
    getTopRatedMovies();
  }

  Future<TMDB> getContent() async {
    // print("111 getContent");
    tmdbData = TMDB(
      ApiKeys(MovieAuth.apiKey, MovieAuth.readAccessToken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    // print(tmdbData);
    return tmdbData!;
  }

  Future<List<dynamic>> GetCategories() async {
    final map1 = await tmdbData!.v3.genres.getTvlist();
    final list = map1["genres"];
    return list;
  }

  Future<List<dynamic>> getTrending() async {
    Map trendingResult = await tmdbData!.v3.trending.getTrending();
    List trending = [];
    trending = trendingResult["results"];
    trendingNotifier.value.clear();
    trendingNotifier.value.addAll(trending);
    trendingNotifier.notifyListeners();
    // print(trendingNotifier.value);
    return trending;
  }

  Future<List<dynamic>> getPopularMovies() async {
    Map popularMoviesResult = await tmdbData!.v3.movies.getPopular();
    List popularMovies = [];
    isLoading.value = true;
    isLoading.notifyListeners();
    popularMovies = popularMoviesResult["results"];
    popularNotifier.value.clear();
    List<dynamic> tList = [];
    for (int i = 0; i < popularMovies.length; i++) {
      tList.add(popularMovies);
    }
    popularNotifier.value.addAll(tList);
    isLoading.value = false;
    isLoading.notifyListeners();
    popularNotifier.notifyListeners();
    // print(
    //     "popular moveis is working and the popular movies is ${popularMovies}");
    return popularMovies;
  }

  Future<List<dynamic>> getTopRatedMovies() async {
    Map topMoviesResult = await tmdbData!.v3.movies.getTopRated();
    List topMovies = [];
    topMovies = topMoviesResult["results"];
    topMoviesNotifier.value.clear();
    topMoviesNotifier.value.addAll(topMovies);
    topMoviesNotifier.notifyListeners();

    // print("popular moveis is working and the popular movies is ${topMovies}");
    return topMovies;
  }

  Future<List<dynamic>> getTvShows() async {
    Map tvShowsResult = await tmdbData!.v3.tv.getPopular();
    List tvShows = [];
    tvShows = tvShowsResult["results"];
    tvNotifier.value.clear();
    tvNotifier.value.addAll(tvShows);
    tvNotifier.notifyListeners();
    //print('----------${tvNotifier.value}');
    return tvShows;
  }

  Future<List<dynamic>> getUpComming() async {
    Map upCommingResult = await tmdbData!.v3.movies.getUpcoming();
    List<dynamic> upComming;
    upComming = upCommingResult["results"];
    upcomingNotifier.value.clear();
    upcomingNotifier.value.addAll(upComming);
    upcomingNotifier.notifyListeners();
    // print(upComming);
    return upComming;
  }
}
