tableextension 50032 CurrExchangeRateExt extends "Currency Exchange Rate"
{
    fields
    {
        field(50002; "Ending Date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF "Ending Date" < "Starting Date" THEN
                    ERROR(' End date cannot be less or equal than start date.');

            end;
        }
    }

    var
        myInt: Integer;
}