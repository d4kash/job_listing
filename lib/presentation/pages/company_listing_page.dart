import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal_app/data/models/company_model.dart';
import 'package:job_portal_app/presentation/controllers/jobListController.dart';
import 'package:job_portal_app/presentation/pages/job_application_page.dart';

class JobListScreen extends StatefulWidget {
  const JobListScreen({super.key});

  @override
  State<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  final JobListController controller = Get.put(JobListController());
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      controller.filterJobs(_searchController.text.toLowerCase());
    });
  }

  void _markJobAsApplied(CompanyModel job) {
    setState(() {
      job.isApplied = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/icons/hamburger.png'),
          onPressed: () {},
        ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find your Dream Job today",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search by job title or company",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.jobs.isEmpty) {
                  return Center(
                    child: Text("No jobs found."),
                  );
                }

                return ListView.builder(
                  itemCount: controller.jobs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _showJobDetails(context, controller.jobs[index]);
                      },
                      child: JobCard(job: controller.jobs[index]),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  void _showJobDetails(BuildContext context, CompanyModel job) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 1.0,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: JobDetailsDialog(job: job, onApplied: () {
                _markJobAsApplied(job);
              }),
            );
          },
        );
      },
    );
  }
}

class JobCard extends StatelessWidget {
  final CompanyModel job;

  JobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 1,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(job.thumbnailUrl),
          radius: 30,
          backgroundColor: job.isApplied ? Colors.green : Colors.purple, // Green if applied
        ),
        title: Text(
          job.title.substring(1,3),
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, height: 0.9),
        ),
        subtitle: Text(
          job.title,
          softWrap: true,
          overflow: TextOverflow.fade,
          maxLines: 1,
          style: TextStyle(color: Colors.grey[600], fontSize: 12, height: 1),
        ),
        trailing: Icon(
         job.isApplied ? Icons.done : Icons.timelapse,
          color: job.isApplied ? Colors.indigo : Colors.grey[600],
          size: 20,
        ),
      ),
    );
  }
}
