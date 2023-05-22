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
        Container(
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    teamMember.fullName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    teamMember.phoneNo.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                teamMember.email,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
