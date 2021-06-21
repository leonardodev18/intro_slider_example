import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() => new IntroScreenState();
}

// ------------------ Custom config ------------------
class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Olá, este é o primeiro slide",
        maxLineTitle: 2,
        styleTitle: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: """
          Obrigado por ver meu Slide. 
          Obrigado por ver meu Slide.
          Obrigado por ver meu Slide.
          Obrigado por ver meu Slide.
          Obrigado por ver meu Slide.
          Obrigado por ver meu Slide. """,
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: Text("Texto:", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.redAccent,
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      new Slide(
        title: "Segundo Slide",
        styleTitle: TextStyle(
            color: Color(0xff7FFFD4),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: """
          Obrigado por ver meu Slide. 
          Obrigado por ver meu Slide.
          Obrigado por ver meu Slide.
          Obrigado por ver meu Slide.
          Obrigado por ver meu Slide.
          Obrigado por ver meu Slide. """,
        styleDescription: TextStyle(
            color: Color(0xff7FFFD4),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        backgroundColor: Colors.amber,
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        title: "Terceiro Slide",
        styleTitle: TextStyle(
            color: Color(0xffFFDAB9),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: """
          Obrigado por ver meu Slide. 
          Obrigado por ver meu Slide.
          Obrigado por ver meu Slide.
          Obrigado por ver meu Slide.
          Obrigado por ver meu Slide.
          Obrigado por ver meu Slide. """,
        styleDescription: TextStyle(
            color: Color(0xffFFDAB9),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        backgroundColor: Colors.blue,
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
        maxLineTextDescription: 3,
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffF3B4BA),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffF3B4BA),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffF3B4BA),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0x33F3B4BA)),
      overlayColor: MaterialStateProperty.all<Color>(Color(0x33FFA8B0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: this.renderNextBtn(),
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator
      colorDot: Color(0x33FFA8B0),
      colorActiveDot: Color(0xffFFA8B0),
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.grey,

      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}

// ------------------ Custom your own tabs ------------------
// class IntroScreenState extends State<IntroScreen> {
//   List<Slide> slides = [];
//
//   Function goToTab;
//
//   @override
//   void initState() {
//     super.initState();
//
//     slides.add(
//       new Slide(
//         title: "SCHOOL",
//         styleTitle: TextStyle(
//           color: Color(0xff3da4ab),
//           fontSize: 30.0,
//           fontWeight: FontWeight.bold,
//           fontFamily: 'RobotoMono',
//         ),
//         description:
//             "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
//         styleDescription:
//             TextStyle(color: Color(0xfffe9c8f), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
//         pathImage: "images/photo_school.png",
//       ),
//     );
//     slides.add(
//       new Slide(
//         title: "MUSEUM",
//         styleTitle:
//             TextStyle(color: Color(0xff3da4ab), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
//         description: "Ye indulgence unreserved connection alteration appearance",
//         styleDescription:
//             TextStyle(color: Color(0xfffe9c8f), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
//         pathImage: "images/photo_museum.png",
//       ),
//     );
//     slides.add(
//       new Slide(
//         title: "COFFEE SHOP",
//         styleTitle:
//             TextStyle(color: Color(0xff3da4ab), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
//         description:
//             "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
//         styleDescription:
//             TextStyle(color: Color(0xfffe9c8f), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
//         pathImage: "images/photo_coffee_shop.png",
//       ),
//     );
//   }
//
//   void onDonePress() {
//     // Back to the first tab
//     this.goToTab(0);
//   }
//
//   void onTabChangeCompleted(index) {
//     // Index of current tab is focused
//     print(index);
//   }
//
//   Widget renderNextBtn() {
//     return Icon(
//       Icons.navigate_next,
//       color: Color(0xffffcc5c),
//       size: 35.0,
//     );
//   }
//
//   Widget renderDoneBtn() {
//     return Icon(
//       Icons.done,
//       color: Color(0xffffcc5c),
//     );
//   }
//
//   Widget renderSkipBtn() {
//     return Icon(
//       Icons.skip_next,
//       color: Color(0xffffcc5c),
//     );
//   }
//
//   ButtonStyle myButtonStyle() {
//     return ButtonStyle(
//       shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
//       backgroundColor: MaterialStateProperty.all<Color>(Color(0x33ffcc5c)),
//       overlayColor: MaterialStateProperty.all<Color>(Color(0x33ffcc5c)),
//     );
//   }
//
//   List<Widget> renderListCustomTabs() {
//     List<Widget> tabs = [];
//     for (int i = 0; i < slides.length; i++) {
//       Slide currentSlide = slides[i];
//       tabs.add(Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Container(
//           margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
//           child: ListView(
//             children: <Widget>[
//               GestureDetector(
//                   child: Image.asset(
//                 currentSlide.pathImage,
//                 width: 200.0,
//                 height: 200.0,
//                 fit: BoxFit.contain,
//               )),
//               Container(
//                 child: Text(
//                   currentSlide.title,
//                   style: currentSlide.styleTitle,
//                   textAlign: TextAlign.center,
//                 ),
//                 margin: EdgeInsets.only(top: 20.0),
//               ),
//               Container(
//                 child: Text(
//                   currentSlide.description,
//                   style: currentSlide.styleDescription,
//                   textAlign: TextAlign.center,
//                   maxLines: 5,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 margin: EdgeInsets.only(top: 20.0),
//               ),
//             ],
//           ),
//         ),
//       ));
//     }
//     return tabs;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new IntroSlider(
//       // Skip button
//       renderSkipBtn: this.renderSkipBtn(),
//       skipButtonStyle: myButtonStyle(),
//
//       // Next button
//       renderNextBtn: this.renderNextBtn(),
//       nextButtonStyle: myButtonStyle(),
//
//       // Done button
//       renderDoneBtn: this.renderDoneBtn(),
//       onDonePress: this.onDonePress,
//       doneButtonStyle: myButtonStyle(),
//
//       // Dot indicator
//       colorDot: Color(0xffffcc5c),
//       sizeDot: 13.0,
//       typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
//
//       // Tabs
//       listCustomTabs: this.renderListCustomTabs(),
//       backgroundColorAllSlides: Colors.white,
//       refFuncGoToTab: (refFunc) {
//         this.goToTab = refFunc;
//       },
//
//       // Behavior
//       scrollPhysics: BouncingScrollPhysics(),
//
//       // Show or hide status bar
//       hideStatusBar: true,
//
//       // On tab change completed
//       onTabChangeCompleted: this.onTabChangeCompleted,
//     );
//   }
// }

// ------------------ Default config ------------------
// class IntroScreenState extends State<IntroScreen> {
//   List<Slide> slides = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//     slides.add(
//       new Slide(
//         title: "ERASER",
//         description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
//         pathImage: "images/photo_eraser.png",
//         backgroundColor: Color(0xfff5a623),
//       ),
//     );
//     slides.add(
//       new Slide(
//         title: "PENCIL",
//         description: "Ye indulgence unreserved connection alteration appearance",
//         pathImage: "images/photo_pencil.png",
//         backgroundColor: Color(0xff203152),
//       ),
//     );
//     slides.add(
//       new Slide(
//         title: "RULER",
//         description:
//             "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
//         pathImage: "images/photo_ruler.png",
//         backgroundColor: Color(0xff9932CC),
//       ),
//     );
//   }
//
//   void onDonePress() {
//     // Do what you want
//     print("End of slides");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new IntroSlider(
//       slides: this.slides,
//       onDonePress: this.onDonePress,
//     );
//   }
// }
