import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> dropdownOptions = ['Date modified', 'Date created'];

  late String dropdownValue = dropdownOptions.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
        actions: [
          IconButton(
              onPressed: () {}, icon: FaIcon(FontAwesomeIcons.rightFromBracket))
        ], //icon button
      ), //AppBar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Search notes...',
                prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.arrowDown),
                ),
                DropdownButton(
                    value: dropdownValue,
                    items: dropdownOptions
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    }),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.bars),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemBuilder: (context, int index) {
                    return Container(
                      child: Column(
                        children: [
                          Text('This is going to ba a title'),
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  'First Chip',
                                ),
                              ),
                            ],
                          ),
                          Text('Some content'),
                          Row(
                            children: [
                              Text('02 Nov, 2024'),
                              FaIcon(FontAwesomeIcons.trash),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
