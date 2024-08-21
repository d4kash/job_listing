import 'package:flutter/material.dart';
import 'package:job_portal_app/data/models/company_model.dart';

class JobDetailsDialog extends StatelessWidget {
  final CompanyModel job;
  final VoidCallback onApplied;
  const JobDetailsDialog({super.key, required this.job, required this.onApplied});

@override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allows the logo to overflow the top
      children: [
        // Bottom Sheet Content with curved top
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
            // height: 550,
            color: Colors.white,
            padding: const EdgeInsets.only(
              top: 60, // Adjust padding to make space for the logo
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40), // Space for the logo
                Text(
                  "Google LLC",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  "Silicon Valley, CA",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Tech based company and product",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Role',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Senior UI/UX Designer',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Applicants must have upto',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '10 years of design experience and',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(Navigator.of(context).context).showSnackBar( SnackBar(
        content: Text("Job Applied Successfully")
    ));
    onApplied();
    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
                    
                  ),
                  child: const Text('APPLY NOW', style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
              ],
            ),
          ),
        ),
        // Positioned logo at the top center
        Positioned(
          top: -40, // Adjust this value to position the logo correctly
          left: -185,
          right: 0,
          child: CircleAvatar(
            radius: 40, // Adjust the size of the logo
            backgroundColor: Colors.grey[100],
            child: Image.network(
              job.thumbnailUrl, // Replace with the company logo URL
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
