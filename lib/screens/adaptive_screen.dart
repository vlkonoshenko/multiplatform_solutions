import 'package:flutter/material.dart';
import 'package:multiplatform_solution/screens/widgets/grid_person_tile.dart';
import 'package:multiplatform_solution/screens/widgets/list_person_tile.dart';

class AdaptiveScreen extends StatefulWidget {
  const AdaptiveScreen({super.key});

  @override
  State<AdaptiveScreen> createState() => _AdaptiveScreenState();
}

class _AdaptiveScreenState extends State<AdaptiveScreen> {
  final _title = 'Adaptive Title';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 720) {
        return Scaffold(
          appBar: AppBar(
            title: Text(_title),
          ),
          body: ListView(
            children: generateItems(120)
                .map((index) => ListPersonTile(index: index))
                .toList(),
          ),
        );
      } else {
        return Scaffold(
          body: Row(
            children: [
              SizedBox(
                width: 160,
                child: Column(children: [
                  Row(
                    children: [const BackButton(), Text(_title)],
                  )
                ]),
              ),
              Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1, crossAxisCount: 3),
                  children: generateItems(120)
                      .map((index) => GridPersonTile(index: index))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}

Iterable<int> generateItems<T>(int count) sync* {
  for (int index = 0; index < count; index++) {
    yield index;
  }
}
