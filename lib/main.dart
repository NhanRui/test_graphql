import 'package:flutter/material.dart';

import 'fetchmore/main.dart';
import 'graphql_bloc/main.dart';
import 'graphql_widget/main.dart';

void main() => runApp(
      MaterialApp(
        title: 'GraphQL Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(
          builder: (BuildContext context) => Scaffold(
            appBar: AppBar(
              title: const Text('GraphQL Demo App'),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<FetchMoreWidgetScreen>(
                          builder: (BuildContext context) =>
                              const FetchMoreWidgetScreen(),
                        ),
                      );
                    },
                    child: const Text('Fetchmore (Pagination) Example'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<GraphQLWidgetScreen>(
                          builder: (BuildContext context) =>
                              const GraphQLWidgetScreen(),
                        ),
                      );
                    },
                    child: const Text('GraphQL Widget'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<GraphQLBlocPatternScreen>(
                          builder: (BuildContext context) =>
                              GraphQLBlocPatternScreen(),
                        ),
                      );
                    },
                    child: const Text('GraphQL BloC pattern'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
