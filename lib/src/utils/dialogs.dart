import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Dialogs {
  /// general dialog
  static Future<void> showGeneralDialog(
    BuildContext context, {
    String title = "",
    @required String text,
    Widget buttons,

    /// Navigator pop twice
    bool doublePop = false,
  }) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  // key: key,
                  title: Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                  children: <Widget>[
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Text(
                                  text,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              buttons ??
                                  // if buttons not provided, show exit [OK] button
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();

                                      if (doublePop) {
                                        Navigator.of(context).pop();
                                      }
                                    },
                                    textColor: Theme.of(context).accentColor,
                                    child: Text("OK"),
                                  ),
                            ]),
                      ),
                    )
                  ]));
        });
  }

  /// Loading
  static Future<void> showLoadingDialog(
    BuildContext context, {
    String message = "Please Wait....",
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return new WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(children: <Widget>[
            Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(children: [
                  SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator()),
                  SizedBox(width: 15),
                  Text(message)
                ]),
              ),
            )
          ]),
        );
      },
    );
  }

  static void closeLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  /// message shown after successfull registration
  static Future<void> showSuccessFullRegistrationDialog(
      BuildContext context, String email) async {
    return showGeneralDialog(
      context,
      title: "Thanks for registering",
      text:
          "Please check the inbox of $email for a confirmation email allowing you to finish the process.",
      doublePop: true,
    );
  }

  ///
  static Future<bool> showConfirmActionDialog(
    BuildContext context, {
    @required String title,
    @required String text,
    Function onConfirm,
    Widget child = const SizedBox.shrink(),
  }) async {
    return await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  // key: key,
                  title: Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                  children: <Widget>[
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              // margin: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                "$text",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            child,
                            SizedBox(height: 10),
                            //---
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },
                                  child: Text(
                                    "NO",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context, true);
                                    onConfirm();
                                  },
                                  child: Text(
                                    "YES",
                                    style: TextStyle(
                                        //color: kLightAccent,
                                        ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ]));
        });
  }
}
