import 'package:compare_image/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';

/// Reusable appBar
class CustomAppBar extends AppBar {

  ///
  final Widget newTitle;

  @override
  Size get preferredSize => const Size.fromHeight(52);

  ///Pass title to constructor
  CustomAppBar({required this.newTitle});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    const double _elevation = 5;

    return AppBar(
      elevation: _elevation,
      title: widget.newTitle,
      backgroundColor: AppColors.white,
      centerTitle: true,
    );
  }
}
