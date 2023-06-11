import 'package:flutter/material.dart';
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
  RegistrationServices registrationServices = RegistrationServices();
  List<DataRow> _tableRows = [];
  TextEditingController _filterController = TextEditingController();

  Future<List<DuoRegistration>?> getRegistrations() async {
    duoRegistrationsList =
        await registrationServices.fetchAllRegistrations_admin(context);
    setState(() {});
    return duoRegistrationsList;
  }

  List<DataRow> _generateRows() {
    // Replace with your own data source or fetch data from an API
    List<Map<String, dynamic>> data = [
      {'Name': 'loading...', 'Event': "'loading...'"},
      {'Name': 'loading...', 'Event': "'loading...'"},
      {'Name': 'loading...', 'Event': "'loading...'"},
    ];

    return duoRegistrationsList == null
        ? data.map((item) {
            return DataRow(
              cells: [
                DataCell(Text(item['Name'])),
                DataCell(Text(item['Event'].toString())),
              ],
            );
          }).toList()
        : duoRegistrationsList!.map((item) {
            return DataRow(
              cells: [
                DataCell(Text(item.participantOne)),
                DataCell(Text(item.eventName)),
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
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text('Table with Filter'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh_rounded))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _filterController,
              decoration: InputDecoration(
                labelText: 'Filter',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
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
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Event')),
                ],
                rows: _tableRows,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
