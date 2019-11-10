$TS = Get-CMTaskSequence

ForEach ($TaskSequence in $TS) {
    Export-CMTaskSequence -TaskSequencePackageID $TaskSequence.packageID -ExportFilePath "C:\TaskSequenceBackup\$($TaskSequence.name).zip" -Verbose
}