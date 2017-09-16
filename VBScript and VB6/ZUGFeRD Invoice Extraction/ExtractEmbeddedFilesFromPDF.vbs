'****************************************************************************'
'                                                                            '
' Download evaluation version: https://bytescout.com/download/web-installer  '
'                                                                            '
' Signup Cloud API free trial: https://secure.bytescout.com/users/sign_up    '
'                                                                            '
' Copyright © 2017 ByteScout Inc. All rights reserved.                       '
' http://www.bytescout.com                                                   '
'                                                                            '
'****************************************************************************'


' Create Bytescout.PDFExtractor.AttachmentExtractor object
Set AttachmentExtractor = CreateObject("Bytescout.PDFExtractor.AttachmentExtractor")
AttachmentExtractor.RegistrationName = "demo"
AttachmentExtractor.RegistrationKey = "demo"


' Load sample PDF document with embedded attachments
AttachmentExtractor.LoadDocumentFromFile("..\..\Beispielrechnung_ZUGFeRD_RC_COMFORT_neu.pdf")


' walk through attachments and save them
For I = 0 To AttachmentExtractor.Count-1

 AttachmentExtractor.Save i, AttachmentExtractor.GetFileName (I) ' save in the current folder with original filename

Next

MsgBox "Done! Click OK to open the XML invoice"

Set extractor = Nothing

' Open ZUGFeRD invoice XML
Set shell = CreateObject("WScript.Shell")
shell.Run "ZUGFeRD-invoice.xml", 1, false
Set shell = Nothing


