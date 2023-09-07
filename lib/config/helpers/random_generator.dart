import 'package:random_name_generator/random_name_generator.dart';

class RandomGenerator {
  static String getRandomName() {
    final randomNames = RandomNames(Zone.canada);

    return randomNames.fullName();
  }

  static Stream<String> randomNameStream() {
    return Stream.periodic(
      const Duration(seconds: 2),
      (_) => getRandomName(),
    ).take(10);
  }
}
