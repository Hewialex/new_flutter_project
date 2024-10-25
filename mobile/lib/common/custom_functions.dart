import 'package:flutter/material.dart';
import 'package:qismati/common/colors.dart';

class CustomFunctions {
  static void showPopupMenu(
    BuildContext context,
    int index,
    Offset iconPosition,
    List<String> menuOptions,
    Function(int) onSelected,
  ) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        iconPosition & const Size(40, 40),
        Offset.zero & overlay.size,
      ),
      color: CustomColors.textFieldBackground,
      items: menuOptions.asMap().entries.map((e) {
        final options = e.value;
        final index = e.key;

        return PopupMenuItem<int>(
            value: index,
            child: Column(
              children: [
                Text(options),
                index < menuOptions.length - 1
                    ? const Divider(
                        color: Colors.white,
                      )
                    : Container()
              ],
            ));
      }).toList(),
    ).then((value) {
      if (value != null) {
        onSelected(value);
      }
    });
  }
}
