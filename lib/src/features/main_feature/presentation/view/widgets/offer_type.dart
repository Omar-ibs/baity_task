import 'package:flutter/material.dart';

class OfferType extends StatefulWidget {
  const OfferType({super.key});

  @override
  State<OfferType> createState() => _OfferTypeState();
}

class _OfferTypeState extends State<OfferType> {
  bool isPressed = false;
  bool isPressed1 = true;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        padding: const EdgeInsets.all(5),
        width: 300,
        // width: MediaQuery.sizeOf(context).width * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: const Color.fromRGBO(48, 48, 48, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (isPressed == true) {
                  return;
                } else {
                  isPressed = !isPressed;
                  isPressed1 = !isPressed1;
                  setState(() {});
                }
              },
              child: Container(
                height: 40,
                width: 145,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5),
                  ),
                  color:
                      isPressed ? Colors.brown[100] : const Color(0xfff5f5fa),
                ),
                child: Center(
                  child: Text(
                    'Sale',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight:
                            isPressed ? FontWeight.w600 : FontWeight.normal,
                        fontSize: 20,
                        color: isPressed ? Colors.grey[400] : Colors.black),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (isPressed1 == true) {
                  return;
                } else {
                  isPressed = !isPressed;
                  isPressed1 = !isPressed1;
                  setState(() {});
                }
              },
              child: Container(
                height: 40,
                width: 145,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  color:
                      isPressed1 ? Colors.brown[100] : const Color(0xfff5f5fa),
                ),
                child: Center(
                  child: Text(
                    'Rent',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        fontWeight:
                            isPressed1 ? FontWeight.w600 : FontWeight.normal,
                        color: isPressed1 ? Colors.grey[400] : Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
