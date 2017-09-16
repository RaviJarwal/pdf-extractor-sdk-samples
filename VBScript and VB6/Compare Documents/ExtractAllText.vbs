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


' Load first document
Set document1 = CreateObject("Bytescout.PDFExtractor.TextExtractor")
document1.RegistrationName = "demo"
document1.RegistrationKey = "demo"
document1.LoadDocumentFromFile("..\..\comparison1.pdf")

' Load second  document
Set document2 = CreateObject("Bytescout.PDFExtractor.TextExtractor")
document2.RegistrationName = "demo"
document2.RegistrationKey = "demo"
document2.LoadDocumentFromFile("..\..\comparison2.pdf")

' Compare documents
Set comparer = CreateObject("Bytescout.PDFExtractor.TextComparer")
comparer.RegistrationName = "demo"
comparer.RegistrationKey = "demo"
comparer.Compare document1, document2

' Generate report
comparer.GenerateHtmlReport "report.html" 

' Open output file in default associated application
Set shell = CreateObject("WScript.Shell")
shell.Run "report.html", 1, false

