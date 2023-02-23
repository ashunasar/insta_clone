import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../home/models/comment.dart';
import '../../../home/models/post.dart';

class PostListViewController extends GetxController {
  late List<Post> posts;
  final int initPage;
  ItemScrollController scrollController = ItemScrollController();

  PostListViewController(this.initPage);

  @override
  void onInit() {
    super.onInit();
    posts = [
      Post(
        pId: 'postId1',
        pImage: 'https://images-serve.onrender.com/image/posts/post.jpeg',
        profilePic: 'https://images-serve.onrender.com/image/posts/post.jpeg',
        userFullName: 'Jenny Wilson',
        avatar:
            'assets/images/man working on laptop and talking on the phone.png',
        pCaption:
            'Life is like a mirror, we get the best results when we smile.',
        postedDate: 'Yesterday',
        comments: [
          Comment(
            cId: 'CommentId1',
            avatar:
                'assets/images/man working on laptop and talking on the phone.png',
            comment: 'Just a random Comment Testing bro......🔥.',
            userFullName: 'Jenny Wilson',
          ),
          Comment(
            cId: 'CommentId2',
            avatar: 'assets/images/female metis t shirt pose  sunglasses.png',
            comment: 'Another random Comment Testing..........',
            userFullName: 'Emma Watson',
          ),
          Comment(
            cId: 'CommentId3',
            avatar: 'assets/images/girl with a book.png',
            comment: 'Another random Comment Testing..........',
            userFullName: 'Mia Melano',
          ),
          Comment(
            cId: 'CommentId4',
            avatar: 'assets/images/man sitting with smartphone.png',
            comment: 'Another random Comment Testing..........',
            userFullName: 'Eminem',
          ),
          Comment(
            cId: 'CommentId4',
            avatar: 'assets/images/man sitting with smartphone.png',
            comment: 'Another random Comment Testing..........',
            userFullName: 'Eminem',
          ),
        ],
        bgColor: const Color.fromRGBO(226, 215, 233, 1),
      ),
      Post(
        pId: 'postId2',
        pImage: 'https://images-serve.onrender.com/image/posts/post1.jpeg',
        profilePic: 'https://images-serve.onrender.com/image/posts/post1.jpeg',
        userFullName: 'Emmily Griffin',
        avatar: 'assets/images/girl with a book.png',
        pCaption:
            'Life is like a mirror, we get the best results when we smile.',
        comments: [],
        bgColor: const Color.fromRGBO(24, 45, 53, 1),
        postedDate: 'Yesterday',
      ),
      Post(
        pId: 'postId3',
        pImage: 'https://images-serve.onrender.com/image/posts/post2.jpeg',
        profilePic: 'https://images-serve.onrender.com/image/posts/post2.jpeg',
        userFullName: 'Emmily Griffin',
        avatar: 'assets/images/girl with a book.png',
        pCaption:
            'Life is like a mirror, we get the best results when we smile.',
        comments: [],
        bgColor: const Color.fromRGBO(5, 9, 15, 1),
        postedDate: 'Yesterday',
      ),
      Post(
        pId: 'postId4',
        pImage: 'https://images-serve.onrender.com/image/posts/post3.jpeg',
        profilePic: 'https://images-serve.onrender.com/image/posts/post3.jpeg',
        userFullName: 'Emmily Griffin',
        avatar: 'assets/images/girl with a book.png',
        pCaption:
            'Life is like a mirror, we get the best results when we smile.',
        comments: [],
        bgColor: const Color.fromRGBO(49, 52, 66, 1),
        postedDate: 'Yesterday',
      ),
      Post(
        pId: 'postId5',
        pImage: 'https://images-serve.onrender.com/image/posts/post4.jpeg',
        profilePic: 'https://images-serve.onrender.com/image/posts/post4.jpeg',
        userFullName: 'Emmily Griffin',
        avatar: 'assets/images/girl with a book.png',
        pCaption:
            'Life is like a mirror, we get the best results when we smile.',
        comments: [],
        bgColor: const Color.fromRGBO(207, 188, 151, 1),
        postedDate: 'Yesterday',
      ),
      Post(
        pId: 'postId6',
        pImage: 'https://images-serve.onrender.com/image/posts/post5.jpeg',
        profilePic: 'https://images-serve.onrender.com/image/posts/post5.jpeg',
        userFullName: 'Emmily Griffin',
        avatar: 'assets/images/girl with a book.png',
        pCaption:
            'Life is like a mirror, we get the best results when we smile.',
        comments: [],
        bgColor: const Color.fromRGBO(71, 63, 48, 1),
        postedDate: 'Yesterday',
      ),
      Post(
        pId: 'postId7',
        pImage: 'https://images-serve.onrender.com/image/posts/post6.jpeg',
        profilePic: 'https://images-serve.onrender.com/image/posts/post6.jpeg',
        userFullName: 'Emmily Griffin',
        avatar: 'assets/images/girl with a book.png',
        pCaption:
            'Life is like a mirror, we get the best results when we smile.',
        comments: [],
        bgColor: const Color.fromRGBO(58, 67, 37, 1),
        postedDate: 'Yesterday',
      )
    ];
    // scrollController = ScrollController();

    update();
  }

  @override
  void onReady() {
    super.onReady();
    scrollController.jumpTo(index: initPage);
  }
}
