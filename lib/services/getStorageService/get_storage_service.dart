import 'package:get_storage/get_storage.dart';

class GetStorageService {
  static final GetStorageService _inheretence = GetStorageService._init();

  static GetStorageService get inherentce => _inheretence;

  GetStorageService._init();

  GetStorage box = GetStorage();
}
