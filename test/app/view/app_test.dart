import 'package:flutter_test/flutter_test.dart';
import 'package:recipes_book/app/app.dart';
import 'package:recipes_book/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
