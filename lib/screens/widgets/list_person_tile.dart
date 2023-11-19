import 'package:flutter/material.dart';

class ListPersonTile extends StatelessWidget {
  final int index;

  const ListPersonTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onCardTapped(context),
      child: Card(
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text('Title $index'),
          subtitle: Text('Subtitle $index'),
        ),
      ),
    );
  }

  void _onCardTapped(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return const FractionallySizedBox(
            heightFactor: 0.3,
            widthFactor: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Text('View Profile'),
                  Text('Friends'),
                  Text('Reports'),
                ],
              ),
            ),
          );
        });
  }
}
