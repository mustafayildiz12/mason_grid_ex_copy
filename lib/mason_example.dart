

import 'package:flutter/material.dart';
import 'package:mason_grid/common.dart';
import 'package:mason_grid/pages/aligned.dart';
import 'package:mason_grid/pages/mason.dart';
import 'package:mason_grid/pages/quilted.dart';
import 'package:mason_grid/pages/staggered.dart';
import 'package:mason_grid/pages/staired.dart';
import 'package:mason_grid/pages/woven.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Staggered Grid View Demo',
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        children: const [
          MenuEntry(
            title: 'Staggered',
            imageName: 'staggered',
            destination: StaggeredPage(),
          ),
          MenuEntry(
            title: 'Masonry',
            imageName: 'masonry',
            destination: MasonryPage(),
          ),
          MenuEntry(
            title: 'Quilted',
            imageName: 'quilted',
            destination: QuiltedPage(),
          ),
          MenuEntry(
            title: 'Woven',
            imageName: 'woven',
            destination: WovenPage(),
          ),
          MenuEntry(
            title: 'Staired',
            imageName: 'staired',
            destination: StairedPage(),
          ),
          MenuEntry(
            title: 'Aligned',
            imageName: 'aligned',
            destination: AlignedPage(),
          ),
        ],
      ),
    );
  }
}

class MenuEntry extends StatelessWidget {
  const MenuEntry({
    super.key,
    required this.title,
    required this.imageName,
    required this.destination,
  });

  final String title;
  final Widget destination;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => destination,
            ),
          );
        },
        child: Stack(
          children: [
            Image.asset(
              'assets/$imageName.png',
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: FractionallySizedBox(
                heightFactor: 0.25,
                alignment: Alignment.bottomCenter,
                child: ColoredBox(
                  color: Colors.black.withOpacity(0.75),
                  child: Center(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}