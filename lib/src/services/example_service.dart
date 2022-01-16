import 'package:scoremaster/src/models/example/example_model.dart';

///
/// Singleton Service is a common pattern in the flutter eco-system
///
class ExampleService {
  ExampleService._();

  static final ExampleService _instance = ExampleService._();

  static ExampleService get instance => _instance;

  Future<ExampleModel> findOne(String uid) async {
    await Future.delayed(const Duration(milliseconds: 200));

    return const ExampleModel(
      uid: 'example',
      example: 'example',
    );
  }
}
