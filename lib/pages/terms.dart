import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset('assets/icons/Arrow-Left.png'),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('Terms and conditions',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                    ''' These terms and conditions ("Terms") govern your use of the Recipe App ("App") created by Jassim pt ("Developer"). By downloading, installing, or using the App, you agree to comply with these Terms. If you do not agree with these Terms, please do not use the App.
        
        1. App Usage
        
        1.1. The App is provided for informational and entertainment purposes only. It offers recipes, cooking tips, and related content.
        
        1.2. You are responsible for ensuring the accuracy and safety of any recipes or cooking instructions provided in the App.
        
        2. User Accounts
        
        2.1. You may be required to create a user account to access certain features of the App. You agree to provide accurate and complete information when registering and to keep your login credentials confidential.
        
        2.2. You are solely responsible for any activity that occurs under your user account.
        
        3. Privacy
        
        3.1. Your use of the App is subject to our Privacy Policy, which is incorporated by reference into these Terms. Please review the Privacy Policy to understand how we collect, use, and disclose your personal information.
        
        4. Intellectual Property
        
        4.1. The App, including all content, text, graphics, images, and other materials, is protected by intellectual property laws and is owned or licensed by the Developer.
        
        4.2. You may not modify, reproduce, distribute, create derivative works, or reverse engineer the App without the Developer's prior written consent.
        
        5. User Content
        
        5.1. You may have the option to submit content, such as recipes, comments, or reviews, through the App. By submitting content, you grant the Developer a non-exclusive, royalty-free, worldwide, perpetual license to use, display, and distribute your content within the App.
        
        6. Termination
        
        6.1. The Developer reserves the right to terminate or suspend your access to the App at any time and for any reason without notice.
        
        7. Disclaimers
        
        7.1. The App is provided "as is" without warranties of any kind, either expressed or implied, including but not limited to the accuracy, reliability, or availability of the App.
        
        8. Limitation of Liability
        
        8.1. To the fullest extent permitted by applicable law, the Developer shall not be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in any way connected with the use or inability to use the App.
        
        9. Changes to Terms
        
        9.1. The Developer may modify these Terms at any time. You are responsible for regularly reviewing these Terms for updates.
        
        10. Governing Law
        
        10.1. These Terms shall be governed by and construed in accordance with the laws of [Your Jurisdiction].
        
        11. Contact Information
        
        11.1. If you have any questions or concerns about these Terms, please contact us at [Contact Email Address].
        
        By using the Recipe App, you agree to abide by these Terms and Conditions. If you do not agree with any part of these Terms, please discontinue your use of the App. ''')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
