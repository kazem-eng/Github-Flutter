import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_issues_viewer/core/domain/base/base.dart';
import 'package:flutter_issues_viewer/modules/domain/entities/issue/issue.dart';
import 'package:flutter_issues_viewer/modules/views/issues/issues_view.dart';
import 'package:flutter_issues_viewer/modules/views/issues/issues_viewmodel.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_components_export.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme_export.dart';

import '../../../mocks/services_mocks.dart';
import 'issue_view_test.mocks.dart';

void main() {
  setUpAll(() {
    // Register mocked services
    getAndRegisterIssuesNetworkService();
    getAndRegisterNavigationService();
    getAndRegisterILocalStorageService();

    // Register the IssuesViewmodel
    locator.registerFactory(() => MockIssuesViewmodel());
    locator.registerFactory(() => IssuesViewmodel());
  });

  group('IssuesView Widget Tests', () {
    Widget createTestableWidget(Widget child) {
      return ThemeComponentsProvider(
        builder: (_, theme) => MaterialApp(
          theme: theme,
          home: child,
        ),
      );
    }

    testWidgets(
        'Given loading state, '
        'When widget is built, '
        'Then show loading indicator', (tester) async {
      // Arrange & Act
      getAndRegisterIssuesNetworkService(
        issuesStub: const BaseNetResponse.success([]),
      );
      final mockViewModel = locator<MockIssuesViewmodel>();
      when(mockViewModel.state).thenReturn(
        const BaseState.loading(),
      );

      await tester.pumpWidget(
        createTestableWidget(const IssuesView()),
      );

      // Assert
      expect(find.byType(MMLoader), findsOneWidget);
    });

    testWidgets(
        'Given success state, '
        'When widget is built, '
        'Then display the list of issues', (tester) async {
      // Arrange & Act
      getAndRegisterIssuesNetworkService(
        issuesStub: const BaseNetResponse.success([
          Issue(id: 1, title: 'Issue 1'),
          Issue(id: 2, title: 'Issue 2'),
        ]),
      );

      await tester.pumpWidget(
        createTestableWidget(const IssuesView()),
      );
      await tester.pump();

      // Assert
      expect(find.text('Issue 1'), findsOneWidget);
      expect(find.text('Issue 2'), findsOneWidget);
    });
  });
}
