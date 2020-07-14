import 'package:flutter/material.dart';

class  BezierWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Stack(
         
        children: <Widget>[
         backgroundCurve(context)
        ],
     
    );
  }
}


 ClipPath backgroundCurve(BuildContext context) {
    return ClipPath(
          clipper: ClipHome(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.2,
            decoration: BoxDecoration(color: Color(0xffffca73)),
          ),
        );
  }


class ClipHome extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

   var path = new Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 3.5, size.height-200);
    var firstEndPoint = Offset(size.width / 1.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset((size.width-40), size.height);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
     return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
        return oldClipper !=this;
  }

}

