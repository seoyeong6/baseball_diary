import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: Colors.black,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isSelected ? 1 : 0.6,
            child: Column(
              children: [
                FaIcon(icon, color: Colors.white),
                const SizedBox(height: 5),
                Text(
                  text,
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
