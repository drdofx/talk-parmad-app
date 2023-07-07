import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_parmad/controllers/search_controller.dart';
import 'package:talk_parmad/services/search_service.dart';

class SearchResult extends StatefulWidget {
  final dynamic query;

  const SearchResult({Key? key, required this.query}) : super(key: key);

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResult> {
  late SearchForumController searchForumController;

  @override
  void initState() {
    super.initState();
    searchForumController = SearchForumController(
      searchForumService:
          SearchForumService(baseUrl: 'http://localhost:8080/api/v1'),
    );
    searchForumController.searchForums(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: searchForumController,
      child: Consumer<SearchForumController>(
        builder: (context, searchForumController, _) {
          final forum = searchForumController.searchForum;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFCBE0FF),
              title: const Text(
                'Talk Parmad',
                style: TextStyle(color: Colors.black),
              ),
              elevation: 0.0,
            ),
            body: RefreshIndicator(
              onRefresh: () => searchForumController.refreshData(widget.query),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 8,
                      bottom: 12,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Search result...",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: forum.length,
                    itemBuilder: (BuildContext context, int index) {
                      final forumItem = forum[index];
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                forumItem.forumImage,
                                width: 200,
                                height: 200,
                              ),
                              const SizedBox(height: 16.0),
                              Text(
                                forumItem.forumName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
