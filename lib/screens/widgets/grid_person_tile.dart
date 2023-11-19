import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class GridPersonTile extends StatelessWidget {
  final int index;

  const GridPersonTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: InkWell(
        onTap: () => showPopover(
          context: context,
          bodyBuilder: (context) => const Column(
            children: [
              Text('View Profile'),
              Text('Friends'),
              Text('Reports'),
            ],
          ),
          direction: PopoverDirection.bottom,
          width: 200,
          height: 200,
          arrowHeight: 15,
          arrowWidth: 30,
        ),
        child: Card(
          child: Column(
            children: [
              const CircleAvatar(child: Icon(Icons.person)),
              Text('Title $index'),
              Text('Subtitle $index')
            ],
          ),
        ),
      ),
    );
  }
}
