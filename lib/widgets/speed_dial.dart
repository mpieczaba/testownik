import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart' as sd;
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class SpeedDial extends StatelessWidget {
  const SpeedDial({super.key});

  final snackBar = const SnackBar(content: Text('Not implemented!'));

  @override
  Widget build(BuildContext context) {
    return sd.SpeedDial(
      spacing: 16,
      childMargin: EdgeInsets.zero,
      childPadding: const EdgeInsets.all(8.0),
      icon: TablerIcons.plus,
      activeIcon: TablerIcons.x,
      overlayColor: const Color(0xFF1A1E22),
      overlayOpacity: 0.95,
      children: [
        sd.SpeedDialChild(
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(snackBar),
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
    );
  }
}
