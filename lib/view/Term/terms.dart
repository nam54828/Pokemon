import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri phoneNumber = Uri.parse('tel: +84-123-456-789');
    final Uri emailUri = Uri.parse('mailto: dnam37035@gmail.com');
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("TERMS", style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(CupertinoIcons.left_chevron, color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildSectionTitle('1. Acceptance of Terms'),
            buildSectionText('By placing an order on our Pokémon Shop app, you agree to abide by these terms and conditions.'),
            buildSectionTitle('2. Age Limit'),
            buildSectionText('You must be at least 18 years old or have adult supervision when making a purchase.'),
            buildSectionTitle('3. Payment and Transactions'),
            buildSectionText('Payment must be made in full through the payment methods accepted by the app. Prices and availability of products are subject to change without notice.'),
            buildSectionTitle('4. Cancellation and Refunds'),
            buildSectionText('Orders can only be canceled or modified within 24 hours of placement. Refunds are only considered in cases of defective or damaged products.'),
            buildSectionTitle('5. Privacy and Security'),
            buildSectionText('Your personal information will be kept confidential and used only for order processing purposes.'),
            buildSectionTitle('6. Buyer\'s Responsibility'),
            buildSectionText('You are responsible for ensuring that the order information is accurate and complete.'),
            buildSectionTitle('7. Copyright Compliance'),
            buildSectionText('All content and products related to Pokémon are the property of their respective copyright owners.'),
            buildSectionTitle('8. Changes to Terms'),
            buildSectionText('We reserve the right to modify these purchase terms at any time without prior notice.'),
            buildSectionTitle('9. Contact and Support'),
            buildSectionText('For any inquiries or support requests related to orders, please contact us via:'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.phone, color: Colors.blue),
                    onPressed: () async {
                      if (await canLaunchUrl(phoneNumber)) {
                        await launchUrl(phoneNumber);
                      }else{
                        throw Exception("Error Phone Number");
                      }
                    },
                  ),
                  SizedBox(width: 10), // Space between icons
                  IconButton(
                    icon: Icon(Icons.email, color: Colors.red),
                    onPressed: () async {
                      if (await canLaunchUrl(emailUri)) {
                        await launchUrl(emailUri);
                      } else{
                        throw Exception("Error Email Uri");
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),),
      ),
    ));
  }
}
Widget buildSectionTitle(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  );
}

Widget buildSectionText(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: Text(text , style: TextStyle(fontSize: 16)),
  );
}
