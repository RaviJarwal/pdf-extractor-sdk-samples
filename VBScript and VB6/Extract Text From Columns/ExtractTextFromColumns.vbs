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


' Create Bytescout.PDFExtractor.TextExtractor object
Set extractor = CreateObject("Bytescout.PDFExtractor.TextExtractor")
extractor.RegistrationName = "demo"
extractor.RegistrationKey = "demo"

' Load sample PDF document
extractor.LoadDocumentFromFile("..\..\columns.pdf")

' set to extract text column by column
extractor.ExtractColumnByColumn = true

' Save extracted text to file
extractor.SaveTextToFile("output.txt")

' Open output file in default associated application
Set shell = CreateObject("WScript.Shell")
shell.Run "output.txt", 1, false
Set shell = Nothing

Set extractor = Nothing

