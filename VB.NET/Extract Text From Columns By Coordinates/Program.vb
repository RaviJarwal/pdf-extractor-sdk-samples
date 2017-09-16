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


Imports Bytescout.PDFExtractor
Imports Sysem.Drawing

Class Program
	Friend Shared Sub Main(args As String())

		' Create Bytescout.PDFExtractor.TextExtractor instance
		Dim extractor As New TextExtractor()
		extractor.RegistrationName = "demo"
		extractor.RegistrationKey = "demo"

		' Load sample PDF document
		extractor.LoadDocumentFromFile("columns.pdf")


		' read width of the very first page (zero index)
		Dim pageWidth As Single = extractor.GetPageRect_Width (0)
		Dim pageHeight As Single = extractor.GetPageRect_Height (0)

		' now we are extracting content assuming we have 3 columns 
		' equally distributed on pages

		' first calculate the width of the one column by dividing page width by number of columns (3)
		Dim columnWidth As Single = pageWidth / 3

		' iterate through 3 columns
		For i As Integer=0 to 2

		 ' set the extraction area to the #i column 
		 extractor.SetExtractionArea (i * columnWidth, 0, columnWidth , pageHeight)

		 ' save column to file
   		 Dim outFileName As String = "columns-column" + i + ".txt"
 		 extractor.SavePageTextToFile (0, outFileName)

		 ' Open generated file in default text viewer
		 System.Diagnostics.Process.Start(outFileName )

		Next 



	End Sub
End Class
