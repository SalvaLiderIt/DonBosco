report 50101 PropioReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    // PON ESTO PARA QUE TE LOS GENERE CON ctrl + shift + b
    // Tipo de Layout
    DefaultLayout = RDLC;
    RDLCLayout = 'src/report/layout/PropioReport.rdl';

    dataset
    {

        dataitem(DataSet_Result; "Sales Invoice Header")
        {

            column(Picture; CompanyInformation.Picture)
            {

            }
            column(No; "No.")
            {

            }



            trigger OnAfterGetRecord()
            begin
                CompanyInformation.Get();
            end;
        }
        dataitem(SalesLine; "Sales Invoice Line")
        {
            column(NoLinea; "Line No.")
            {

            }
            column(Description; "Description")
            {

            }

            trigger OnAfterGetRecord()
            begin

                CompanyInformation.Get();
            end;

            trigger OnPreDataItem()
            begin
                CompanyInformation.Get();

            end;
        }

    }
    labels
    {
        NFact = 'Nº Factura';
    }

    var
        CompanyInformation: Record "Company Information";



}