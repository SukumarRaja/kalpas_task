import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonAssetImageCard extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final BoxFit fit;
  final Color color;

  const CommonAssetImageCard(this.image,
      {Key? key,
        this.height = 0,
        this.width = 0,
        this.fit = BoxFit.cover,
        this.color = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSvg = image.contains('.svg', image.length - '.svg'.length);

    return isSvg
        ? SvgPicture.asset(
      image,
      width: height,
      height: width,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      fit: fit,
    )
        : Image.asset(image,
        fit: fit, width: width, height: height, color: color);
  }
}