import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../models/home/comment.dart';
import '../../../../models/home/post.dart';

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
        pImage: 'http://192.168.0.100:8000/image/post.jpeg',
        profilePic: 'http://192.168.0.100:8000/image/post.jpeg',
        userFullName: 'Jenny Wilson',
        avatar:
            'assets/images/man working on laptop and talking on the phone.png',
        pCaption:
            'Life is like a mirror, we get the best results when we smile.',
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
        pImage: 'http://192.168.0.100:8000/image/post1.jpeg',
        profilePic: 'http://192.168.0.100:8000/image/post1.jpeg',
        userFullName: 'Emmily Griffin',
        avatar: 'assets/images/girl with a book.png',
        pCaption:
            'Life is like a mirror, we get the best results when we smile.',
        comments: [],
        bgColor: const Color.fromRGBO(24, 45, 53, 1),
      ),
      Post(
        pId: 'postId3',
        pImage: 'http://192.168.0.100:8000/image/post2.jpeg',
        profilePic: 'http://192.168.0.100:8000/image/post2.jpeg',
        userFullName: 'Emmily Griffin',
        avatar: 'assets/images/girl with a book.png',
        pCaption:
            'Life is like a mirror, we get the best results when we smile.',
        comments: [],
        bgColor: const Color.fromRGBO(5, 9, 15, 1),
      ),
      Post(
        pId: 'postId4',
        pImage: 'http://192.168.0.100:8000/image/post3.jpeg',
        profilePic: 'http://192.168.0.100:8000/image/post3.jpeg',
        userFullName: 'Emmily Griffin',
        avatar: 'assets/images/girl with a book.png',
        pCaption:
            'Life is like a mirror, we get the best results when we smile.',
        comments: [],
        bgColor: const Color.fromRGBO(49, 52, 66, 1),
      ),
      Post(
        pId: 'postId5',
        pImage: 'http://192.168.0.100:8000/image/post4.jpeg',
        profilePic: 'http://192.168.0.100:8000/image/post4.jpeg',
        userFullName: 'Emmily Griffin',
        avatar: 'assets/images/girl with a book.png',
        pCaption:
            'Life is like a mirror, we get the best results when we smile.',
        comments: [],
        bgColor: const Color.fromRGBO(207, 188, 151, 1),
      ),
      Post(
        pId: 'postId6',
        pImage: 'http://192.168.0.100:8000/image/post5.jpeg',
        profilePic: 'http://192.168.0.100:8000/image/post5.jpeg',
        userFullName: 'Emmily Griffin',
        avatar: 'assets/images/girl with a book.png',
        pCaption:
            'Life is like a mirror, we get the best results when we smile.',
        comments: [],
        bgColor: const Color.fromRGBO(71, 63, 48, 1),
      ),
      Post(
        pId: 'postId7',
        pImage: 'http://192.168.0.100:8000/image/post6.jpeg',
        profilePic: 'http://192.168.0.100:8000/image/post6.jpeg',
        userFullName: 'Emmily Griffin',
        avatar: 'assets/images/girl with a book.png',
        pCaption:
            'Life is like a mirror, we get the best results when we smile.',
        comments: [],
        bgColor: const Color.fromRGBO(58, 67, 37, 1),
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
