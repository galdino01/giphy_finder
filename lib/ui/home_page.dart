import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

final _apiKey = dotenv.get('GIPHY_API_KEY', fallback: null);
const String _giphyUrl = 'https://api.giphy.com/v1/gifs';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _search;
  final int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null) {
      final String uriTrending =
          '$_giphyUrl/trending?api_key=$_apiKey&limit=25&rating=g';

      response = await http.get(Uri.parse(uriTrending));
    } else {
      final String uriSearch =
          '$_giphyUrl/search?api_key=$_apiKey&q=$_search&limit=25&offset=$_offset&rating=g&lang=en';

      response = await http.get(Uri.parse(uriSearch));
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
