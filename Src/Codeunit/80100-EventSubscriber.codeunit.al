codeunit 80100 "Event Subscriber"
{
    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", OnBeforeOnAfterGetCurrRecord, '', false, false)]
    local procedure OnBeforeOnAfterGetCurrRecord(var DocumentAttachment: Record "Document Attachment"; var AttachmentCount: Integer; var IsHandled: Boolean);
    var
        CurrentFilterGroup: Integer;
    begin
        IsHandled := true;
        AttachmentCount := 0;

        CurrentFilterGroup := DocumentAttachment.FilterGroup;
        DocumentAttachment.FilterGroup := 4;

        if DocumentAttachment.GetFilters() <> '' then begin
            DocumentAttachment.SetRange("Voice Record", false);
            if Evaluate(DocumentAttachment."VAT Report Config. Code", DocumentAttachment.GetFilter("VAT Report Config. Code")) then;
            AttachmentCount := DocumentAttachment.Count;
        end;

        DocumentAttachment.FilterGroup := CurrentFilterGroup;
    end;
}