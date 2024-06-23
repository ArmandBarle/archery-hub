import 'package:flutter/material.dart';
import 'package:frontend/core/services/result_service.dart';
import 'package:frontend/core/services/user_service.dart';
import 'package:frontend/data/models/results_model.dart';
import 'package:frontend/presentation/screens/results/add_result_screen.dart';
import 'package:frontend/presentation/screens/results/result_detail_screen.dart';

class ResultsScreen extends StatefulWidget {
  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late Future<List<Result>> _futureResults;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  Future<void> _loadResults() async {
    final userId = await UserService().getTokenId();
    setState(() {
      _futureResults = ResultService().getResultsById(userId);
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _initialized
       ? Column(
            children: [
              Expanded(
                child: FutureBuilder<List<Result>>(
                  future: _futureResults,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("Result ${snapshot.data![index].resultId}"), // Assuming resultId is the unique identifier
                            trailing: Text("Event ${snapshot.data![index].eventId}"), // Assuming eventId is the event identifier
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultDetailScreen(result: snapshot.data![index]),
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              ElevatedButton(
                child: Text("Add Result"),
                onPressed: () {
                  // Navigate to the AddResult screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddResultScreen(),
                    ),
                  );
                },
              ),
            ],
          )
        : Center(child: CircularProgressIndicator()),
    );
  }
}