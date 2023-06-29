import 'package:flutter/material.dart';
import 'package:technozia/models/post.dart';
import 'package:technozia/screens/admin-screens/posts/edit_post_screen.dart';
import 'package:technozia/services/auth_services.dart';

class ViewEditPostScreen extends StatefulWidget {
  static const String routeName = '/view-edit-post-screen';
  const ViewEditPostScreen({super.key});

  @override
  State<ViewEditPostScreen> createState() => _ViewEditPostScreenState();
}

class _ViewEditPostScreenState extends State<ViewEditPostScreen> {
  AuthServices authServices = AuthServices();
  List<Post>? post;
  @override
  void initState() {
    super.initState();
    getAllPost();
  }

  void getAllPost() async {
    post = await authServices.fetchAllPost(context);
    setState(() {});
  }

  void deletePost(Post post) async {
    authServices.deletePost(
      context: context,
      post: post,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
          centerTitle: true,
        ),
        body: post == null
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return postItem(post![index]);
                  },
                  itemCount: post?.length,
                ),
              ));
  }

  Widget postItem(Post post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: const Color(0xffedf6f9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/profile_icon.jpg",
                          ),
                          backgroundColor: Colors.blueGrey,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.username,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              "@${post.type}",
                              style: const TextStyle(
                                color: Colors.black,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    post.date.substring(0, 10),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          const Divider(
            color: Colors.black45,
            indent: 20,
          ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              post.title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            post.description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, EditPostScreen.routeName,
                        arguments: post);
                  },
                  child: Text("Edit")),
              ElevatedButton(
                  onPressed: () {
                    deletePost(post);
                  },
                  child: Text("Delete")),
            ],
          )
        ],
      ),
    );
  }
}
