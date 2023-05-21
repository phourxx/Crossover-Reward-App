import 'dart:math';
import 'package:flutter/material.dart';

class AppSliverSeparatedChildBuilderDelegate extends SliverChildBuilderDelegate {
  AppSliverSeparatedChildBuilderDelegate(
      IndexedWidgetBuilder builder, {
        required IndexedWidgetBuilder separatorBuilder,
        int? childCount,
        super.addAutomaticKeepAlives,
        super.addRepaintBoundaries,
        super.addSemanticIndexes,
        super.semanticIndexOffset,
        super.findChildIndexCallback,
      }) : super(
        (c, i) => i.isEven ? builder(c, (i / 2).floor()) : separatorBuilder(c, (i / 2).floor()),
    childCount: childCount != null ? max(0, (2 * childCount - 1)) : null,
  );
}
