import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final entries = <String>['Bulbasaur', 'b', 'c', 'd', 'e', 'f', 'a', 'b', 'c', 'd', 'e', 'f'];

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Text(
                  'Pokedex',
                  style: theme.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              const SizedBox(height: 20.0),
              GridView.builder(
                itemCount: entries.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Image.network(
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
                            width: double.infinity,
                            height: 150.0
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            entries[index],
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold
                            )
                          )
                        ]
                      )
                    )
                  );
                }
              )
            ]
          )
        )
      )
    );
  }
}