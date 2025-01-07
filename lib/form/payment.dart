import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:sspkm/common_widget/Comman_TeextFiled.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sspkm/screen/home.dart';
import 'package:sspkm/rout/routing_page.dart';

import '../common_widget/comman_button.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  late Razorpay razorpay;

  @override
  void initState() {
    super.initState();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': 45000 * 100,
      'name': 'sspkm',
      'description': 'Payment ',
      'prefill': {'contact': '**********', 'email': '**@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Routingpage.pushreplase(context: context, navigateto: home_screen());
    FirebaseFirestore.instance
        .collection("sspkmid")
        .doc("sspkmlastid")
        .get()
        .then((document) {
      int lastregId = document.exists ? document.data()!["lastid"] : 0;
      String newsspkmId = "SP2023/0${lastregId + 1}";
      FirebaseFirestore.instance.collection("admission_form").doc(
          FirebaseAuth.instance.currentUser!.uid).update({
        "Payment_status": "Done",
        "Id": newsspkmId
      }).then((value) =>
          Fluttertoast.showToast(
            msg: "Fees Paid Successfully!!!",
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            fontSize: 13.sp,
          )).then((value) => FirebaseFirestore.instance
          .collection("sspkmid")
          .doc("sspkmlastid")
          .update({"lastid": lastregId + 1}));
    }
      );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: Payment Not Done ", toastLength: Toast.LENGTH_SHORT);
    // loading=false;
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  TextEditingController reg_controler = TextEditingController();
  TextEditingController mobile_controler = TextEditingController();
  String countryCode = "91";
  String countryFlage = "";
  final gloablekey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _handlePaymentSuccess;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text("Payment",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),),)
      ),
      body: Form(
        key: gloablekey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/payment.png",
                    height: height * 0.30,
                    width: width * 0.65,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.app_registration_outlined,
                      color: Colors.black,
                    ),
                    hintText: "Registration No",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(color: Colors.red),),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Colors.red)),
                  ),
                  controller: reg_controler,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Registration Number";
                    }
                  },
                  onChanged: (value) {
                    gloablekey.currentState!.validate();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Comman_TexxtFiled(
                  onChanged: (value) {
                    gloablekey.currentState!.validate();
                  },
                  prefixicon: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 0, right: 10),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                            flagSize: 25,
                            backgroundColor: Colors.white,
                            textStyle:
                            TextStyle(fontSize: 16, color: Colors.blueGrey),
                            bottomSheetHeight: 500,
                            // Optional. Country list modal height
                            //Optional. Sets the border radius for the bottomsheet.
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            //Optional. Styles the search field.
                            inputDecoration: InputDecoration(
                              labelText: 'Search',
                              hintText: 'Start typing to search',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0xFF8C98A8).withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            setState(() {
                              countryCode = country.phoneCode;
                              countryFlage = country.flagEmoji;
                            });
                          },
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("+${countryCode}"),
                          Text(countryFlage.isEmpty ? "" : countryFlage),
                        ],
                      ),
                    ),
                  ),
                  sufficicon: mobile_controler.text.length == 10
                      ? Icon(
                    Icons.check_circle,
                    color: Colors.black,
                  )
                      : SizedBox(),
                  controller: mobile_controler,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Number";
                    }
                  },
                  hinttext: "Enter Your No",
                  fillcolor: Colors.white,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(color: Colors.black)),
                  focouseborder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(color: Colors.blue)),
                  FocusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.red),),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(color: Colors.red)),
                ),
                SizedBox(height: 40,),
                comman_button(
                  text: "Payment",
                  ontap: () {
                    if (gloablekey.currentState!.validate()) {
                      openCheckout();
                    }
                  },
                  color: Colors.blue,
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
