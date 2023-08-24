import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class BusSkeleton extends StatelessWidget {
  const BusSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonLine(
      style: SkeletonLineStyle(
          height: 60, borderRadius: BorderRadius.circular(10)),
    );
  }
}
