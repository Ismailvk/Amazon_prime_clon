// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';

import '../models/movies.dart';
import 'package:http/http.dart' as http;



class MovieApi {
  static Future<List<Movies>> fetchMovies(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final results = json['results'] as List<dynamic>;
      final movies = results.map(
        (e) {
          return Movies.fromMap(e);
        },
      ).toList();
      return movies;
    } else {
      print('Error Occured');
      return [];
    }
  }

  static Future<List<Movies>> search(value) async {
    if (value == null) {
      return [];
    }
    final url =
        'https://api.themoviedb.org/3/search/movie?query=$value&include_adult=false&language=en-US&api_key=da3ecddae0f310d299f1940f310606da';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final result = json['results'] as List<dynamic>;
      final movies = result.map((e) {
        return Movies.fromMap(e);
      }).toList();
      return movies;
    } else {
      return [];
    }
  }

  static Future<List<Movies>> recentlyAdded() async {
    const url =
        'https://api.themoviedb.org/3/trending/movie/day?api_key=da3ecddae0f310d299f1940f310606da';
    return fetchMovies(url);
  }

  static Future<List<Movies>> continueMovies() async {
    const url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=da3ecddae0f310d299f1940f310606da';
    return fetchMovies(url);
  }

  static Future<List<Movies>> exclusiveMovies() async {
    const url =
        'https://api.themoviedb.org/3/movie/popular?api_key=da3ecddae0f310d299f1940f310606da';
    return fetchMovies(url);
  }

  static Future<List<Movies>> recomemdedMovies() async {
    const url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=da3ecddae0f310d299f1940f310606da';
    return fetchMovies(url);
  }

  static Future<List<Movies>> recentlyAddedTvShows() async {
    const url =
        'https://api.themoviedb.org/3/discover/tv?api_key=da3ecddae0f310d299f1940f310606da';
    return fetchMovies(url);
  }

  static Future<List<Movies>> recommendedTvShows() async {
    const url =
        'https://api.themoviedb.org/3/tv/airing_today?api_key=da3ecddae0f310d299f1940f310606da';
    return fetchMovies(url);
  }

  static Future<List<Movies>> amazonOriginals() async {
    const url =
        'https://api.themoviedb.org/3/tv/on_the_air?api_key=da3ecddae0f310d299f1940f310606da';
    return fetchMovies(url);
  }

  static Future<List<Movies>> latestShows() async {
    const url =
        'https://api.themoviedb.org/3/tv/popular?api_key=da3ecddae0f310d299f1940f310606da';
    return fetchMovies(url);
  }

  static Future<List<Movies>> topTvShows() async {
    const url =
        'https://api.themoviedb.org/3/tv/top_rated?api_key=da3ecddae0f310d299f1940f310606da';
    return fetchMovies(url);
  }
}
