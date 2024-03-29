package rbac.authz

# user-role assignments
user_roles := {
  "design_group_kpi_editor": ["kpi_editor_design", "viewer_limit_ds"],
  "system_group_kpi_editor": ["kpi_editor_system", "viewer_limit_ds"],
  "manufacture_group_kpi_editor": ["kpi_editor_manufacture", "viewer"],
  "project_leader": ["viewer_limit_ds", "viewer_limit_m"]
}

# role-permissions assignments
role_permissions := {
  "admin": [
    {"action": "view_all",  "object": "design"},
    {"action": "edit",  "object": "design"},
    {"action": "view_all",  "object": "system"},
    {"action": "edit",  "object": "system"},
    {"action": "view_all",  "object": "manufacture"},
    {"action": "edit",  "object": "manufacture"},
  ],
  "quality_head_design":[
    {"action": "view_all",  "object": "design"},
    {"action": "edit",  "object": "design"},
    {"action": "view_all",  "object": "system"},
    {"action": "view_all",  "object": "manufacture"},
  ],
  "quality_head_system":[
    {"action": "view_all",  "object": "design"},
    {"action": "view_all",  "object": "system"},
    {"action": "edit",  "object": "system"},
    {"action": "view_all",  "object": "manufacture"},
  ],
  "quality_head_manufacture":[
    {"action": "view_all",  "object": "design"},
    {"action": "view_all",  "object": "system"},
    {"action": "view_all",  "object": "manufacture"},
    {"action": "edit",  "object": "manufacture"},
  ],

  "kpi_editor_design":[
    {"action": "view_all",  "object": "design"},
    {"action": "edit",  "object": "design"},
  ],
  "kpi_editor_system":[
    {"action": "view_all",  "object": "system"},
    {"action": "edit",  "object": "system"},
  ],
  "kpi_editor_manufacture":[
    {"action": "view_all",  "object": "manufacture"},
    {"action": "edit",  "object": "manufacture"},
  ],

  "viewer":[
    {"action": "view_all",  "object": "design"},
    {"action": "view_all",  "object": "system"},
    {"action": "view_all",  "object": "manufacture"},
  ],

  "viewer_limit_ds":[
    {"action": "view_all",  "object": "design"},
    {"action": "view_all",  "object": "system"},
  ],

  "viewer_limit_m":[
    {"action": "view_l3_project",  "object": "manufacture"},
  ],
}

# logic that implements RBAC.
default allow = false
allow {
  # lookup the list of roles for the user
  roles := user_roles[input.user[_]]
  # for each role in that list
  r := roles[_]
  # lookup the permissions list for role r
  permissions := role_permissions[r]
  # for each permission
  p := permissions[_]
  # check if the permission granted to r matches the user's request
  p == {"action": input.action, "object": input.object}
}