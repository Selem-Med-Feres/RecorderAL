tableextension 80100 "Document Attachment" extends "Document Attachment" //1173
{
    fields
    {
        field(80100; "Voice Record"; Boolean)
        {
            Caption = 'Voice Record';
            InitValue = false;
            Editable = false; 
        }
    }
}