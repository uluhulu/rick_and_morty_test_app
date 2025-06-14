import 'package:rick_and_morty_test_app/home/home.dart';

class MainCharacterRepository implements CharactersRepository {
  final HiveCharacterRepository hiveCharacterRepository;
  final NetworkCharacterRepository networkCharacterRepository;

  MainCharacterRepository({
    required this.hiveCharacterRepository,
    required this.networkCharacterRepository,
  });

  @override
  Future<List<CharacteModel>> getData(int page) async {
    final isConnected = await NetworkChecker.hasInternetConnection();

    if (isConnected) {
      try {
        final data = await networkCharacterRepository.getData(page);
        // Обновить локальный кэш
        await hiveCharacterRepository.saveData(data, page);

        return data;
      } catch (e) {
        return await hiveCharacterRepository.getData(page);
      }
    } else {
      return await hiveCharacterRepository.getData(page);
    }
  }
}
