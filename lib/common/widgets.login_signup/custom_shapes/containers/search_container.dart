import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

// La clase TSearchContainer se mantiene pública
class TSearchContainer extends StatefulWidget {
  const TSearchContainer({
    super.key,
    this.text = 'Buscar',
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
    this.width = 300, // Ancho fijo por defecto
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;
  final double width; // Ancho configurable

  @override
  TSearchContainerState createState() => TSearchContainerState();
}

class TSearchContainerState extends State<TSearchContainer> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        if (!_isEditing) {
          setState(() {
            _isEditing = true;
          });
          FocusScope.of(context).requestFocus(_focusNode);
        }
      },
      child: Container(
        width: widget.width, // Usar el ancho configurado
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: widget.showBackground
              ? dark
                  ? TColors.dark
                  : TColors.light
              : Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: widget.showBorder ? Border.all(color: TColors.grey) : null,
        ),
        child: _isEditing
            ? TextField(
                controller: _controller,
                focusNode: _focusNode,
                autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.text,
                  prefixIcon: Icon(widget.icon, color: TColors.darkerGrey),
                ),
                onSubmitted: (value) {
                  setState(() {
                    _isEditing = false;
                  });
                },
              )
            : Row(
                children: [
                  Icon(widget.icon, color: TColors.darkerGrey),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Text(widget.text,
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
      ),
    );
  }
}
