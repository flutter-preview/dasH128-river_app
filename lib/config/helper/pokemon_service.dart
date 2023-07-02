import 'package:dio/dio.dart';

class PokemonService {
  static Future<String> getPokemonName(int pokemonId) async {
    var dio = Dio();
    // await Future.delayed(const Duration(seconds: 2));

    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');
      return response.data['name'] ?? 'Name not found';
    } catch (e) {
      throw Exception('Name not found');
    }
  }
}
