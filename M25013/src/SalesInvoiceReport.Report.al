report 50100 "Sales Invoice Report"
{
    Caption = 'Informe de Factura de Venta';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'layout/SalesInvoiceReport.rdlc'; // Lo crearemos más adelante
    Permissions = tabledata "Sales Invoice Header" = R,
                  tabledata "Sales Invoice Line" = R;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = sorting("No.") order(ascending);

            column("InvoiceNo"; "No.") { }
            column("PostingDate"; "Posting Date") { }

            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");

                column("Description"; "Description") { }
                column("Quantity"; "Quantity") { }
                column("UnitPrice"; "Unit Price") { }
                column("LineAmount"; "Line Amount") { }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Group)
                {
                    Caption = 'Filters';
                    field(InvoiceNoFilter; InvoiceNoFilterVar)
                    {
                        ApplicationArea = All;
                        Caption = 'Invoice No. Filter';
                        ToolTip = 'Specifies Filter by Invoice No.';

                        trigger OnValidate()
                        begin
                        end;
                    }
                }
            }
        }

        actions
        {
            area(Processing)
            {
            }
        }

        trigger OnOpenPage()
        begin
        end;
    }

    var
        InvoiceNoFilterVar: Text;
}
