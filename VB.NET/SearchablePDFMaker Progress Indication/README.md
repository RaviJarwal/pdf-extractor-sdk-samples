## searchablepdfmaker progress indication in VB.NET and ByteScout PDF Extractor SDK

### Write code in VB.NET to make searchablepdfmaker progress indication with this How-To tutorial

Here you may find thousands pre-made source code pieces for easy implementation in your own programming VB.NET projects. Searchablepdfmaker progress indication in VB.NET can be implemented with ByteScout PDF Extractor SDK. ByteScout PDF Extractor SDK is the Software Development Kit (SDK) that is designed to help developers with data extraction from unstructured documents like pdf, tiff, scans, images, scanned and electronic forms. The library is powered by OCR, computer vision and AI to provide unique functionality like table detection, automatic table structure extraction, data restoration, data restructuring and reconstruction. Supports PDF, TIFF, PNG, JPG images as input and can output CSV, XML, JSON formatted data. Includes full set of utilities like pdf splitter, pdf merger, searchable pdf maker.

VB.NET, code samples for VB.NET, developers help to speed up the application development and writing a code when using ByteScout PDF Extractor SDK. This VB.NET sample code should be copied and pasted into your application’s code editor. Then just compile and run it to see how it works. Test VB.NET sample code examples whether they respond your needs and requirements for the project.

Trial version can be downloaded from our website. Source code samples for VB.NET and documentation are included.

## REQUEST FREE TECH SUPPORT

[Click here to get in touch](https://bytescout.zendesk.com/hc/en-us/requests/new?subject=ByteScout%20PDF%20Extractor%20SDK%20Question)

or just send email to [support@bytescout.com](mailto:support@bytescout.com?subject=ByteScout%20PDF%20Extractor%20SDK%20Question) 

## ON-PREMISE OFFLINE SDK 

[Get Your 60 Day Free Trial](https://bytescout.com/download/web-installer?utm_source=github-readme)
[Explore SDK Docs](https://bytescout.com/documentation/index.html?utm_source=github-readme)
[Sign Up For Online Training](https://academy.bytescout.com/)


## ON-DEMAND REST WEB API

[Get your API key](https://pdf.co/documentation/api?utm_source=github-readme)
[Explore Web API Documentation](https://pdf.co/documentation/api?utm_source=github-readme)
[Explore Web API Samples](https://github.com/bytescout/ByteScout-SDK-SourceCode/tree/master/PDF.co%20Web%20API)

## VIDEO REVIEW

[https://www.youtube.com/watch?v=s28W3_KMraU](https://www.youtube.com/watch?v=s28W3_KMraU)




<!-- code block begin -->

##### ****Program.vb:**
    
```
Imports Bytescout.PDFExtractor

Module Program

    Sub Main()

        Try

            Using searchablePDFMaker = New SearchablePDFMaker("demo", "demo")

                ' Load input file
                searchablePDFMaker.LoadDocumentFromFile("sample_ocr.pdf")

                ' Add Progress change event...
                Console.WriteLine("Searchable PDF making in progress: " & vbLf)
                AddHandler searchablePDFMaker.ProgressChanged, AddressOf SearchablePDF_ProgressChanged

                ' Set the location of OCR language data files 
                searchablePDFMaker.OCRLanguageDataFolder = "c:\Program Files\Bytescout PDF Extractor SDK\ocrdata_best\"

                ' Set OCR language
                searchablePDFMaker.OCRLanguage = "eng"

                ' Set PDF document rendering resolution
                searchablePDFMaker.OCRResolution = 300

                ' Save extracted text to file
                searchablePDFMaker.MakePDFSearchable("output.pdf")

                ' Open output file in default associated application
                System.Diagnostics.Process.Start("output.pdf")
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message)
        End Try

        Console.WriteLine(vbLf & vbLf & " Press enter key to exit...")
        Console.ReadLine()
    End Sub


    ''' <summary>
    ''' Handle progress change event
    ''' </summary>
    Private Sub SearchablePDF_ProgressChanged(ByVal sender As Object, ByVal ongoingOperation As OngoingOperation, ByVal progress As Double, ByRef cancel As Boolean)
        drawTextProgressBar(Convert.ToInt32(progress), 100)
    End Sub

    ''' <summary>
    ''' Display progress bar
    ''' </summary>
    Private Sub drawTextProgressBar(ByVal progress As Integer, ByVal total As Integer)
        'draw empty progress bar
        Console.CursorLeft = 0
        Console.Write("[") ' start
        Console.CursorLeft = 32
        Console.Write("]") ' end
        Console.CursorLeft = 1
        Dim onechunk As Single = 30.0F / total
        Dim position As Integer = 1

        ' draw filled part
        For i As Integer = 0 To onechunk * progress - 1
            Console.BackgroundColor = ConsoleColor.Green
            Console.CursorLeft = Math.Min(System.Threading.Interlocked.Increment(position), position - 1)
            Console.Write(" ")
        Next

        ' draw unfilled part
        For i As Integer = position To 31
            Console.BackgroundColor = ConsoleColor.Gray
            Console.CursorLeft = Math.Min(System.Threading.Interlocked.Increment(position), position - 1)
            Console.Write(" ")
        Next

        ' draw totals
        Console.CursorLeft = 35
        Console.BackgroundColor = ConsoleColor.Black
        Console.Write(progress.ToString() & " of " & total.ToString() & "    ") ' blanks at the end remove any excess
    End Sub

End Module

```

<!-- code block end -->    

<!-- code block begin -->

##### ****SearchablePDFMakerProgressChangedEvent.vbproj:**
    
```
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="15.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <Import Project="$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.props" Condition="Exists('$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.props')" />
  <PropertyGroup>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
    <ProjectGuid>{80667702-F68F-42E8-AF48-A3F9D8C879CF}</ProjectGuid>
    <OutputType>Exe</OutputType>
    <StartupObject>SearchablePDFMakerProgressChangedEvent.Program</StartupObject>
    <RootNamespace>SearchablePDFMakerProgressChangedEvent</RootNamespace>
    <AssemblyName>SearchablePDFMakerProgressChangedEvent</AssemblyName>
    <FileAlignment>512</FileAlignment>
    <MyType>Console</MyType>
    <TargetFrameworkVersion>v2.0</TargetFrameworkVersion>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' ">
    <PlatformTarget>AnyCPU</PlatformTarget>
    <DebugSymbols>true</DebugSymbols>
    <DebugType>full</DebugType>
    <DefineDebug>true</DefineDebug>
    <DefineTrace>true</DefineTrace>
    <OutputPath>bin\Debug\</OutputPath>
    <DocumentationFile>SearchablePDFMakerProgressChangedEvent.xml</DocumentationFile>
    <NoWarn>42016,41999,42017,42018,42019,42032,42036,42020,42021,42022</NoWarn>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|AnyCPU' ">
    <PlatformTarget>AnyCPU</PlatformTarget>
    <DebugType>pdbonly</DebugType>
    <DefineDebug>false</DefineDebug>
    <DefineTrace>true</DefineTrace>
    <Optimize>true</Optimize>
    <OutputPath>bin\Release\</OutputPath>
    <DocumentationFile>SearchablePDFMakerProgressChangedEvent.xml</DocumentationFile>
    <NoWarn>42016,41999,42017,42018,42019,42032,42036,42020,42021,42022</NoWarn>
  </PropertyGroup>
  <PropertyGroup>
    <OptionExplicit>On</OptionExplicit>
  </PropertyGroup>
  <PropertyGroup>
    <OptionCompare>Binary</OptionCompare>
  </PropertyGroup>
  <PropertyGroup>
    <OptionStrict>Off</OptionStrict>
  </PropertyGroup>
  <PropertyGroup>
    <OptionInfer>On</OptionInfer>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="Bytescout.PDFExtractor, Version=9.1.0.3170, Culture=neutral, PublicKeyToken=f7dd1bd9d40a50eb, processorArchitecture=MSIL">
      <SpecificVersion>False</SpecificVersion>
      <HintPath>c:\Program Files\Bytescout PDF Extractor SDK\net2.00\Bytescout.PDFExtractor.dll</HintPath>
    </Reference>
    <Reference Include="System" />
    <Reference Include="System.Data" />
    <Reference Include="System.Deployment" />
    <Reference Include="System.Xml" />
  </ItemGroup>
  <ItemGroup>
    <Import Include="Microsoft.VisualBasic" />
    <Import Include="System" />
    <Import Include="System.Collections" />
    <Import Include="System.Collections.Generic" />
    <Import Include="System.Data" />
    <Import Include="System.Diagnostics" />
  </ItemGroup>
  <ItemGroup>
    <Compile Include="Program.vb" />
   </ItemGroup>  
  <ItemGroup>
    <None Include="sample_ocr.pdf">
      <CopyToOutputDirectory>Always</CopyToOutputDirectory>
    </None>
  </ItemGroup>
  <Import Project="$(MSBuildToolsPath)\Microsoft.VisualBasic.targets" />
</Project>
```

<!-- code block end -->