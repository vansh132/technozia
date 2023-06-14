import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technozia/models/post.dart';
import 'package:technozia/providers/user_provider.dart';
import 'package:technozia/services/auth_services.dart';

class ViewPostScreen extends StatefulWidget {
  static const String routeName = '/view-post-screen';
  const ViewPostScreen({super.key});

  @override
  State<ViewPostScreen> createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends State<ViewPostScreen> {
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

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
        ),
        body: post == null
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  Container(
                    child: Text("data"),
                  ),
                  Container(
                    color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Text(
                              post![index].title,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                              // height: 100,
                              // child: Image.network(achievements![index].images[0]),
                            ),
                            Text(
                              post![index].description,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                              // height: 100,
                              // child: Image.network(achievements![index].images[0]),
                            ),
                            Text(
                              post![index].type,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: post?.length,
                    ),
                  ),
                ],
              ));
  }

  Widget PostItem(Post post) {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }
}

/*



 */
