import 'package:flutter_test/flutter_test.dart';
import 'package:culture_closet/main.dart';
import 'package:provider/provider.dart';
import 'package:culture_closet/providers/app_provider.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => AppProvider(),
        child: const CultureClosetApp(),
      ),
    );
    expect(find.byType(CultureClosetApp), findsOneWidget);
  });
}
