import 'package:flutter/material.dart';
import 'package:technozia/constants/global_variables.dart';
import 'package:technozia/models/duoRegistration.dart';
import 'package:technozia/services/registration_services.dart';

class ViewRegistrations extends StatefulWidget {
  static const String routeName = '/view-registration-status';
  const ViewRegistrations({super.key});

  @override
  State<ViewRegistrations> createState() => _ViewRegistrationsState();
}

class _ViewRegistrationsState extends State<ViewRegistrations> {
  @override
  void initState() {
    super.initState();
    getRegistrations();
    _tableRows = _generateRows();
    _filterController = TextEditingController();
  }

  List<DuoRegistration>? duoRegistrationsList;
  List<DuoRegistration>? data;
  RegistrationServices registrationServices = RegistrationServices();
  List<DataRow> _tableRows = [];
  TextEditingController _filterController = TextEditingController();

  Future<List<DuoRegistration>?> getRegistrations() async {
    duoRegistrationsList =
        await registrationServices.fetchAllRegistrationsAdmin(context);
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
                DataCell(Text(item['Event'].toString())),
                DataCell(Text(item['Event'].toString())),
                DataCell(Text(item['Event'].toString())),
              ],
            );
          }).toList()
        : duoRegistrationsList!.map((item) {
            return DataRow(
              cells: [
                DataCell(Text(item.participantOne)),
                DataCell(Text(item.participantTwo)),
                DataCell(Text(item.email)),
                DataCell(Text(item.phoneNo.toString())),
                DataCell(Text(item.eventName)),
                DataCell(Text(item.paymentMode.substring(12))),
                DataCell(Text(item.paymentId == '' ? " - " : item.paymentId)),
                DataCell(Text(item.date.substring(0, 10))),
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
          'Registrations',
          style: TextStyle(color: GlobalVariables.appBarContentColor),
        ),
        centerTitle: true,
        backgroundColor: GlobalVariables.appBarColor,
      ),
      body: Column(
        children: [
          duoRegistrationsList == null
              ? const CircularProgressIndicator()
              : duoRegistrationsList!.isEmpty
                  ? Center(
                      child: Text(
                        "No Registerations yet !!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: GlobalVariables.richBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        "Total Registrations: ${duoRegistrationsList!.length}",
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
                  DataColumn(label: Text('Participant 1')),
                  DataColumn(label: Text('Participant 2')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Phone No')),
                  DataColumn(label: Text('Event')),
                  DataColumn(label: Text('Payment Mode')),
                  DataColumn(label: Text('Payment ID')),
                  DataColumn(label: Text('Date')),
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
