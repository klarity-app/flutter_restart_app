import 'package:flutter_restart_app/flutter_restart_app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  test('Can call rust function', () async {
    expect(await FlutterRestartApp.instance.restartAppSmokeTest(), true);
  });
}
