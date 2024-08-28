import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'asset_image.dart';

class CommonCachedImageCard extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final BoxFit fit;
  final bool isNotification;
  final String placeholder;

  const CommonCachedImageCard({
    Key? key,
    required this.image,
    this.height = 0,
    this.width = 0,
    this.fit = BoxFit.cover,
    this.isNotification = false,
    this.placeholder = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final placeholderImage =
        placeholder.isNotEmpty ? placeholder : 'assets/images/placeholder.jpg';

    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) => CommonAssetImageCard(
        placeholderImage,
        height: height,
        width: width,
        fit: fit,
      ),
      errorWidget: (context, url, error) => CommonAssetImageCard(
        placeholderImage,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}
