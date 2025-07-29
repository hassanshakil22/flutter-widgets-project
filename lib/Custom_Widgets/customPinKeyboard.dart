import 'package:flutter/material.dart';
import 'package:flutter_widgets/app_setup/themes/app_colors.dart';

class PinKeyboard extends StatefulWidget {
  const PinKeyboard({
    super.key,
    required this.onKeyboardTap,
    required this.onBackspace,
  });

  final ValueChanged<String> onKeyboardTap;
  final VoidCallback
  onBackspace;

  @override
  State<PinKeyboard> createState() => _PinKeyboardState();
}

class _PinKeyboardState extends State<PinKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [1, 2, 3].map((num) => _buildKey(num.toString())).toList(),
        ),
        SizedBox(height: 20),
        // Row 2
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [4, 5, 6].map((num) => _buildKey(num.toString())).toList(),
        ),
        SizedBox(height: 20),
        // Row 3
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [7, 8, 9].map((num) => _buildKey(num.toString())).toList(),
        ),
        SizedBox(height: 20),
        // Row 4
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_buildEmptySpace(), _buildKey('0'), _buildBackspaceKey()],
        ),
      ],
    );
  }

  Widget _buildKey(String text) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: () => widget.onKeyboardTap(text),
        child: Container(
          width: 80,
          height: 80,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 22,
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold, // Lighter weight looks more modern
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptySpace() {
    return Container(width: 80, height: 80);
  }

  Widget _buildBackspaceKey() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: widget.onBackspace, 
        child: Container(
          width: 80,
          height: 80,
          alignment: Alignment.center,
          child: Icon(Icons.backspace, size: 22, color: AppColors.blackColor),
        ),
      ),
    );
  }
}
