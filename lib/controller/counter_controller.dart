import 'package:get/get.dart';
import '../modal/storage_services.dart';

class CounterController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();

  // Reactive variables
  final _userName = ''.obs;
  final _count = 0.obs;

  // New reactive variable for name input validation
  final _nameInput = ''.obs;
  final _isNameInputValid = false.obs;

  // Getters
  String get userName => _userName.value;
  int get count => _count.value;
  bool get hasUserName => _userName.value.isNotEmpty;
  bool get isNameInputValid => _isNameInputValid.value;

  @override
  void onInit() {
    super.onInit();
    // Load initial data from storage
    _userName.value = _storageService.getUserName();
    _count.value = _storageService.getCount();
  }

  // Update name input and validate
  void updateNameInput(String value) {
    _nameInput.value = value.trim();
    _isNameInputValid.value = _nameInput.value.isNotEmpty;
  }

  // Update Username
  Future<void> updateUserName(String name) async {
    _userName.value = name.trim();
    await _storageService.saveUserName(_userName.value);
    // Reset name input validation
    _nameInput.value = '';
    _isNameInputValid.value = false;
  }

  // Increment Counter
  Future<void> increment() async {
    _count.value++;
    await _storageService.saveCount(_count.value);
  }

  // Decrement Counter
  Future<void> decrement() async {
    if (_count.value > 0) {
      _count.value--;
      await _storageService.saveCount(_count.value);
    }
  }

  // Reset Username
  Future<void> clearUserName() async {
    _userName.value = '';
    await _storageService.saveUserName('');
  }
}

//done