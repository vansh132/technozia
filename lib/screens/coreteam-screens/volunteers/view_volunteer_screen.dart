import 'package:flutter/material.dart';
import 'package:technozia/constants/global_variables.dart';
import 'package:technozia/models/volunteer.dart';
import 'package:technozia/screens/coreteam-screens/volunteers/edit_delete_volunteer_screen.dart';
import 'package:technozia/services/volunteer_services.dart';

class ViewVolunteerListScreen extends StatefulWidget {
  static const String routeName = '/view-volunteer-list-screen';
  const ViewVolunteerListScreen({super.key});

  @override
  State<ViewVolunteerListScreen> createState() =>
      _ViewVolunteerListScreenState();
}

class _ViewVolunteerListScreenState extends State<ViewVolunteerListScreen> {
  @override
  void initState() {
    super.initState();
    getRegistrations();
    _tableRows = _generateRows();
    _filterController = TextEditingController();
  }

  List<Volunteer>? duoRegistrationsList;
  List<Volunteer>? data;
  VolunteerServices volunteerServices = VolunteerServices();
  List<DataRow> _tableRows = [];
  TextEditingController _filterController = TextEditingController();

  Future<List<Volunteer>?> getRegistrations() async {
    duoRegistrationsList = await volunteerServices.fetchAllTeamMembers(context);
    setState(() {});
    return duoRegistrationsList;
  }

  List<DataRow> _generateRows() {
    List<Map<String, dynamic>> data = [
      {
        'Name': 'loading...',
        'Event': "loading...",
        'Event2': "loading...",
        'Event3': "loading..."
      },
      {
        'Name': 'loading...',
        'Event': "loading...",
        'Event2': "loading...",
        'Event3': "loading..."
      },
      {
        'Name': 'loading...',
        'Event': "loading...",
        'Event2': "loading...",
        'Event3': "loading..."
      },
    ];
    return duoRegistrationsList == null
        ? data.map((item) {
            return DataRow(
              cells: [
                DataCell(Text(item['Name'])),
                DataCell(Text(item['Event'].toString())),
                DataCell(Text(item['Event'].toString())),
                DataCell(Text(item['Event'].toString())),
                DataCell(Text(item['Event'].toString())),
              ],
            );
          }).toList()
        : duoRegistrationsList!.map((item) {
            return DataRow(
              cells: [
                DataCell(Text(item.name)),
                DataCell(Text(item.event)),
                DataCell(Text(item.phoneNo.toString())),
                DataCell(Text(item.addedBy)),
                DataCell(TextButton(
                  style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
                    backgroundColor: WidgetStatePropertyAll(
                      GlobalVariables.appBarColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, EditDeleteVolunteerScreen.routeName,
                        arguments: item);
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(
                      color: GlobalVariables.secondaryTextColor,
                    ),
                  ),
                )),
              ],
            );
          }).toList();
  }

  void _filterTable(String query) {
    setState(() {
      if (query.isNotEmpty) {
        _tableRows = _tableRows.where((row) {
          return row.cells.any((cell) =>
              cell.child is Text &&
              (cell.child as Text)
                  .data!
                  .toLowerCase()
                  .contains(query.toLowerCase()));
        }).toList();
      } else {
        _tableRows = _generateRows();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.secondaryTextColor,
      appBar: AppBar(
        title: Text(
          'Volunteers List',
          style: TextStyle(color: GlobalVariables.appBarContentColor),
        ),
        centerTitle: true,
        backgroundColor: GlobalVariables.appBarColor,
        actions: [
          IconButton(
              onPressed: () {
                getRegistrations();
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Column(
        children: [
          duoRegistrationsList == null
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Total Volunteers: ${duoRegistrationsList!.length}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _filterController,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                labelText: 'Filter',
                labelStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: GlobalVariables.appBarColor),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 16.0),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _filterController.clear();
                    _filterTable('');
                  },
                ),
              ),
              onChanged: (value) => _filterTable(value),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
                dataTextStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                columnSpacing: 24,
                columns: const [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Event')),
                  DataColumn(label: Text('Phone No')),
                  DataColumn(label: Text('Added By')),
                  DataColumn(label: Text('Modify')),
                ],
                rows: _tableRows,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
