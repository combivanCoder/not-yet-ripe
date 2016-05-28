Attribute VB_Name = "mod_Comparisons"
Option Explicit

' Used for the various comparison functions
' Would have written a desktop app in .NET but that would require installers, support, education and other
' activities there isn't infrastructure for

' Intended for the "Check List" work sheet
' Important: Works through the list of hashes on the basis that they may not be in the same order as the new list
' This accounts for a very probable scenario despite affecting performance
Public Sub CompareExistingHashes()
    Dim shtTarget As Worksheet
    Set shtTarget = ActiveSheet
    Dim iNewItemCounter As Integer
    iNewItemCounter = 3
    Dim strIterator As String
    strIterator = shtTarget.Cells(iNewItemCounter, 2)
    
    While (strIterator <> "")
        If (searchHashList(strIterator)) Then
            ' put a note in column 3 to show that this is on the DNC list
            shtTarget.Cells(iNewItemCounter, 3) = "Yes - already blocked"
        End If
        
        ' next
        iNewItemCounter = iNewItemCounter + 1
        strIterator = shtTarget.Cells(iNewItemCounter, 2)
    Wend
End Sub

' Recursor to search the hash list for each new email list item supplied
Private Function searchHashList(strNewItemToCompare) As Boolean
    Dim iHashCounter As Integer
    iHashCounter = 3
    Dim shtTarget As Worksheet
    Set shtTarget = ActiveSheet
    Dim strIterator As String
    strIterator = shtTarget.Cells(iHashCounter, 1)
    Dim strHashedNeedle As String
    strHashedNeedle = SHA1HASH(strNewItemToCompare)
    
    While (strIterator <> "")
        If (strHashedNeedle = strIterator) Then
            searchHashList = True
            Exit Function
        End If
    
        iHashCounter = iHashCounter + 1
        strIterator = shtTarget.Cells(iHashCounter, 1)
    Wend
End Function

' Intended for the "Convert List" work sheet
' Converts plain text emails into a list of hashes
Public Sub GenerateHashedList()
    MsgBox 1
    Dim strIterator As String
    Dim iRowCounter As Integer
    Dim shtTarget  As Worksheet
    
    Set shtTarget = ThisWorkbook.Sheets("Convert List")
    MsgBox iRowCounter
    iRowCounter = 3
    strIterator = shtTarget.Cells(iRowCounter, 1)
    While (strIterator <> "")
        shtTarget.Cells(iRowCounter, 2) = SHA1HASH(strIterator)
    
        ' get next
        iRowCounter = iRowCounter + 1
        strIterator = shtTarget.Cells(iRowCounter, 1)
    Wend
    MsgBox "done"
End Sub

' Intended for the "Convert List" & "Exportable List" work sheets
' Takes list of hashes generated from GenerateHashedList and puts them in a single CSV in the same folder as
' this workbook
Public Sub ExportHashedList()
    Dim shtSource As Worksheet
    Dim shtTarget As Worksheet
    Dim iRows As Integer
    Dim iRowCounter As Integer
    Dim wbCurrent As Workbook
    Dim wbExport As Workbook
    
    ' capture refs
    Set shtSource = ThisWorkbook.Sheets("Convert List")
    Set shtTarget = ThisWorkbook.Sheets("Exportable List")
    ' iRows = shtSource.UsedRange.Rows ' couldn't get this to work in the 2013 TLB
    iRows = 3
    While (shtSource.Cells(iRows, 2) <> "")
        iRows = iRows + 1
    Wend
    
    ' find the extend of the data in the hashed list
    For iRowCounter = 1 To (iRows - 2)
        shtTarget.Cells(iRowCounter, 1) = shtSource.Cells(iRowCounter + 2, 2)
    Next iRowCounter
    
    ' once that's copied over to the hidden sheet select the hidden sheet as active and saveas
    shtTarget.Select
    Set wbCurrent = ActiveWorkbook
    Set wbExport = Workbooks.Add()
    
    wbCurrent.ActiveSheet.Copy wbExport.ActiveSheet
    wbExport.ActiveSheet.Activate
    Application.DisplayAlerts = False
    ' SaveCopyAs only allows a filename change, not a format / export as. That would be too easy of course
    wbExport.SaveAs ".\exportedHashList.csv", xlCSVWindows
    
    ' reset UI
    wbExport.Close
    wbCurrent.Activate
    shtSource.Select
    Application.DisplayAlerts = True
End Sub
