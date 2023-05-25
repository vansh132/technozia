import 'package:flutter/material.dart';
import 'package:technozia/models/team_member.dart';

class TeamMemberProvider extends ChangeNotifier {
  TeamMember _teamMember = TeamMember(
    id: "",
    leader: "",
    fullName: "",
    college: "",
    phoneNo: 0,
    email: "",
  );

  TeamMember get teamMember => _teamMember;

  void setTeamMember(String teamMember) {
    _teamMember = TeamMember.fromJson(teamMember);
    notifyListeners();
  }
}
