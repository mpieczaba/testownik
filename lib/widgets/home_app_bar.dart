import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:testownik/providers/home_provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  final _snackBar = const SnackBar(content: Text('Not implemented!'));

  void _showQuizRemoveAlertDialog(BuildContext context) async {
    final homeProvider = context.read<HomeProvider>();
    final checkedQuizzesLength =
        homeProvider.quizzes.where((quiz) => quiz.isChecked).length;

    showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          ScaleTransition(
              scale: Tween(begin: 0.9, end: 1.0).animate(animation),
              child: child),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return AlertDialog(
          title: Text(
            checkedQuizzesLength == 1
                ? 'Usuń testownik'
                : 'Usuń testowniki: $checkedQuizzesLength',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(checkedQuizzesLength == 1
              ? 'Czy na pewno chcesz usunąć ten testownik?'
              : 'Czy na pewno chcesz usunąć te testowniki?'),
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor:
                    MaterialStatePropertyAll(Colors.white.withAlpha(10)),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Anuluj',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStatePropertyAll(
                    const Color(0xFFF15151).withAlpha(10)),
              ),
              onPressed: () {
                homeProvider.removeQuizzes();
                homeProvider.switchReorderable(false);

                Navigator.pop(context);
              },
              child: const Text(
                'Usuń',
                style: TextStyle(
                    color: Color(0xFFF15151), fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(scale: animation, child: child),
        child: context.watch<HomeProvider>().isReorderable
            ? PopScope(
                canPop: false,
                onPopInvoked: (bool didPop) =>
                    context.read<HomeProvider>().switchReorderable(false),
                child: IconButton(
                  key: const ValueKey(1),
                  onPressed: () =>
                      context.read<HomeProvider>().switchReorderable(false),
                  icon: const Icon(TablerIcons.x),
                  tooltip: 'Zamknij',
                ),
              )
            : IconButton(
                key: const ValueKey(2),
                onPressed: () =>
                    ScaffoldMessenger.of(context).showSnackBar(_snackBar),
                icon: const Icon(TablerIcons.menu_2),
                tooltip: 'Menu',
              ),
      ),
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: context.watch<HomeProvider>().isReorderable
            ? null
            : const Text(
                'Testownik',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
      ),
      actions: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) =>
              ScaleTransition(scale: animation, child: child),
          child: context.watch<HomeProvider>().isReorderable
              ? IconButton(
                  key: const ValueKey(1),
                  onPressed: () => _showQuizRemoveAlertDialog(context),
                  // ScaffoldMessenger.of(context).showSnackBar(_snackBar),
                  icon: const Icon(TablerIcons.trash),
                  tooltip: 'Usuń',
                )
              : IconButton(
                  key: const ValueKey(2),
                  onPressed: () =>
                      ScaffoldMessenger.of(context).showSnackBar(_snackBar),
                  icon: const Icon(TablerIcons.search),
                  tooltip: 'Szukaj',
                ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) =>
              ScaleTransition(scale: animation, child: child),
          child: context.watch<HomeProvider>().isReorderable
              ? IconButton(
                  key: const ValueKey(1),
                  onPressed: () =>
                      ScaffoldMessenger.of(context).showSnackBar(_snackBar),
                  icon: const Icon(TablerIcons.dots_vertical),
                  tooltip: 'Więcej opcji',
                )
              : IconButton(
                  key: const ValueKey(2),
                  onPressed: () =>
                      ScaffoldMessenger.of(context).showSnackBar(_snackBar),
                  icon: const Icon(TablerIcons.settings),
                  tooltip: 'Ustawienia',
                ),
        ),
      ],
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
