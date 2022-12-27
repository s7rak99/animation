import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikesButton extends StatefulWidget {
  const LikesButton({Key? key}) : super(key: key);

  @override
  State<LikesButton> createState() => _LikesButtonState();
}

class _LikesButtonState extends State<LikesButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: LikeButton(
            size: 60.0,
            likeCount: 0,
            onTap: onLikeButton,
            bubblesColor: const BubblesColor(
              dotPrimaryColor: Colors.yellow,
              dotSecondaryColor: Colors.red,
            ),
            likeBuilder: (bool isLiked) {
              return Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                size: 60.0,
                color: isLiked ? Colors.red : Colors.grey,
              );
            },
            circleColor: const CircleColor(
              start: Colors.black,
              end: Colors.white,
            ),
          ),
        ));
  }

  Future<bool> onLikeButton(isLike) async => !isLike;
}

//
// class LikesButton extends StatefulWidget {
//   const LikesButton({Key? key}) : super(key: key);
//
//   @override
//   State<LikesButton> createState() => _LikesButtonState();
// }
//
// class _LikesButtonState extends State<LikesButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Center(
//           child: LikeButton(
//             size: 50.0,
//             circleColor: const CircleColor(
//                 start: Color(0xff00ddff), end: Color(0xff0099cc)),
//             bubblesColor: const BubblesColor(
//               dotPrimaryColor: Color(0xff33b5e5),
//               dotSecondaryColor: Color(0xff0099cc),
//             ),
//             likeBuilder: (bool isLiked) {
//               return Icon(
//                 Icons.favorite,
//                 color: isLiked ? Colors.red : Colors.grey,
//                 size: 50.0,
//               );
//             },
//             likeCount: 665,
//             countBuilder: (count, isLiked, text) {
//               var color = isLiked ? Colors.red : Colors.grey;
//               Widget result;
//               if (count == 0) {
//                 result = Text(
//                   "love",
//                   style: TextStyle(color: color),
//                 );
//               } else {
//                 result = Text(
//                   text,
//                   style: TextStyle(color: color),
//                 );
//               }
//               return result;
//             },
//
//           ),
//         ));
//   }
// }
