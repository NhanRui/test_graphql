import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'fetchmore/main.dart';
import 'graphql_bloc/main.dart';
import 'graphql_widget/main.dart';
import 'local.dart';

void main() {
  final httpLink = HttpLink('https://api.github.com/graphql');

  final authLink = AuthLink(
    // ignore: undefined_identifier
    getToken: () => 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN',
  );

  final link = authLink.concat(httpLink);

  final client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    ),
  );

  runApp(
    GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
