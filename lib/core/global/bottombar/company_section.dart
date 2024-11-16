// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

// class CompanySection extends StatelessWidget {
//   const CompanySection({super.key});

//   Future<void> _launchURL(Uri url) async {
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 20,
//             spreadRadius: 0,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // Company Information Section
//           Container(
//             padding: const EdgeInsets.all(24),
//             child: Column(
//               children: [
//                 // Company Logo
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.blue.shade50,
//                   ),
//                   child: Image.asset(
//                     'assets/images/zoc.png',
//                     width: 100,
//                     height: 100,
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 const Text(
//                   'Developed by',
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 8),

//                 const Text(
//                   'Zero One Creation',
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 8),

//                 const Text(
//                   'Innovative Solutions for a Digital Future',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Social Media Section
//           Container(
//             padding: const EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: Colors.grey.shade50,
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(24),
//                 bottomRight: Radius.circular(24),
//               ),
//             ),
//             child: Column(
//               children: [
//                 const Text(
//                   'Connect With Us',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _buildEnhancedSocialButton(
//                       icon: FontAwesomeIcons.facebook,
//                       color: const Color(0xFF1877F2),
//                       label: 'Facebook',
//                       url: Uri.parse('https://www.facebook.com/profile.php?id=61565936520622'),
//                     ),
//                     _buildEnhancedSocialButton(
//                       icon: FontAwesomeIcons.twitter,
//                       color: const Color(0xFF1DA1F2),
//                       label: 'Twitter',
//                       url: Uri.parse('https://x.com/ZeroOneCreation'),
//                     ),
//                     _buildEnhancedSocialButton(
//                       icon: FontAwesomeIcons.linkedin,
//                       color: const Color(0xFF0A66C2),
//                       label: 'LinkedIn',
//                       url: Uri.parse('https://www.linkedin.com/company/zero-one-creation/'),
//                     ),
//                     _buildEnhancedSocialButton(
//                       icon: FontAwesomeIcons.instagram,
//                       color: const Color(0xFFE4405F),
//                       label: 'Instagram',
//                       url: Uri.parse('https://www.instagram.com/zeroonecreation/'),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 24),

//                 // Website Button
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     _launchURL(Uri.parse('https://www.zeroonecreation.com/'));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 24,
//                       vertical: 12,
//                     ),
//                     backgroundColor: Colors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   icon: const Icon(Icons.language, color: Colors.redAccent),
//                   label: const Text(
//                     'Visit Our Website',
//                     style: TextStyle(color: Colors.redAccent),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEnhancedSocialButton({
//     required IconData icon,
//     required Color color,
//     required String label,
//     required Uri url, // URL to launch when the button is tapped
//   }) {
//     return Tooltip(
//       message: label,
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 8),
//         child: Material(
//           color: Colors.transparent,
//           child: InkWell(
//             onTap: () {
//               _launchURL(url);  // Launch the corresponding URL
//             },
//             borderRadius: BorderRadius.circular(12),
//             child: Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(
//                 icon,
//                 color: color,
//                 size: 20,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }