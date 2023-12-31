import 'package:flutter/material.dart';
import 'package:trilhaapp/model/comment_model.dart';
import 'package:trilhaapp/repositories/http/comment_repository.dart';

class CommentsPage extends StatefulWidget {
  final int postId;
  const CommentsPage({super.key, required this.postId});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  var commentsRepository = CommentRepository();
  var comments = <CommentModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    comments = await commentsRepository.retornaComentarios(widget.postId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Comentários do post: ${widget.postId}")),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: comments.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (_, index) {
                    var comment = comments[index];
                    return Card(
                        child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(comment.name.substring(0, 6)),
                              Text(comment.email),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(comment.body),
                        ],
                      ),
                    ));
                  })),
    ));
  }
}
