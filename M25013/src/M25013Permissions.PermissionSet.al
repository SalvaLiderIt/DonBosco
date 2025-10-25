permissionset 50100 "M25013Permissions"
{
    Caption = 'M25013ExtPermissions', MaxLength = 30;
    Assignable = true;

    Permissions =
        report "PropioReport" = X,
        tabledata "Sales Invoice Header" = R,
        tabledata "Sales Invoice Line" = R;
}