import 'package:flutter/material.dart';
import 'package:technozia/models/team_member.dart';

class TeamMemberItem extends StatelessWidget {
  TeamMember teamMember;
  TeamMemberItem({super.key, required this.teamMember});

/* 
fullname, email, phone
 */

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            teamMember.fullName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          tileColor: Colors.black26,
          subtitle: Text(
            teamMember.phoneNo.toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          trailing: Text(
            teamMember.email,
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
