import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart' as sd;
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;
import 'package:testownik/providers/home_provider.dart';

class SpeedDial extends StatelessWidget {
  const SpeedDial({super.key});

  final snackBar = const SnackBar(content: Text('Not implemented!'));

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: context.watch<HomeProvider>().isReorderable
          ? null
          : sd.SpeedDial(
              spacing: 16,
              childMargin: EdgeInsets.zero,
              childPadding: const EdgeInsets.all(8.0),
              icon: TablerIcons.plus,
              activeIcon: TablerIcons.x,
              overlayColor: Colors.black54,
              overlayOpacity: 0.5,
              animationDuration: const Duration(milliseconds: 200),
              children: [
                sd.SpeedDialChild(
                  onTap: () {
                    FilePicker.platform.getDirectoryPath().then((directory) {
                      if (directory != null) {
                        context.read<HomeProvider>().addQuiz(
                            path.basename(directory), path.absolute(directory));
                      }
                    });
                  },
                  label: 'Wybierz folder',
                  labelStyle: const TextStyle(color: Colors.white),
                  labelBackgroundColor: Colors.transparent,
                  labelShadow: List.empty(),
                  backgroundColor: const Color(0xFFF2F2F2),
                  foregroundColor: Colors.black,
                  shape: const CircleBorder(),
                  child: const Icon(TablerIcons.folder_plus),
                ),
              ],
            ),
    );
  }
}
