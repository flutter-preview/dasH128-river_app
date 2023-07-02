import 'package:random_name_generator/random_name_generator.dart';

class RandomGenerator {
  static String getRandomName() {
    RandomNames randomName = RandomNames(Zone.spain);

    return randomName.fullName();
  }

  static Stream<String> randomNamesStream() {
    return Stream.periodic(const Duration(seconds: 2), (i) {
      return getRandomName();
    });
  }
}
