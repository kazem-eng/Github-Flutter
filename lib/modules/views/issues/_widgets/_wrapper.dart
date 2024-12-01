part of '../issues_view.dart';

class _Wrapper extends StatelessWidget {
  const _Wrapper({
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final theme = MMTheme.of(context);
    final themeColor = MMTheme.of(context).color;
    final isDark = theme.theme == AppTheme.dark;
    final vm = context.watch<IssuesViewmodel>();

    Widget themeSwitcherIcon() {
      return IconButton(
        icon: Icon(
          isDark ? Icons.light_mode : Icons.dark_mode,
          color: themeColor.primary,
        ),
        onPressed: () {
          theme.switchTheme(
            isDark ? AppTheme.light : AppTheme.dark,
          );
        },
      );
    }

    Widget menu() {
      return MMContextMenu(
        icon: Icon(Icons.more_vert, color: themeColor.primary),
        textColor: themeColor.text,
        items: [
          ContextMenuItem(
            title: 'sort',
            onTap: vm.sort,
          ),
          ContextMenuItem(
            title: 'Filter',
            onTap: vm.filter,
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor.appbar,
        elevation: 0,
        title: const MMText.title('Flutter issues'),
        actions: [themeSwitcherIcon(), menu()],
      ),
      body: child,
    );
  }
}