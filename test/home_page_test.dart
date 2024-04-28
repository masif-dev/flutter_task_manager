import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_app/presentation/pages/create_task.dart';

import '../lib/presentation/pages/tasks.dart';

void main() {
  testWidgets('HomePage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TaskManager()));

    expect(find.text('Task Manager'), findsOneWidget);
    expect(find.byType(Padding), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets("add a task", (WidgetTester tester) async {
    //find all widgets needed
    final addField = find.byKey(const ValueKey("Title"));
    final descriptionField = find.byKey(const ValueKey("Description"));
    final addButton = find.byKey(const ValueKey("Save"));

    //execute the actual test
    await tester.pumpWidget(MaterialApp(home: CreateTaskScreen()));
    await tester.enterText(addField, "title");
    await tester.enterText(descriptionField, "description");
    await tester.tap(addButton);
    await tester.pump(); //rebuilds your widget

    //check outputs
    expect(find.byWidget(Card()), findsOneWidget);
  });
}
