# Version: 1.0
# Date: October 6, 2025

# Description:
# This script is designed to insert usage examples into the PWSS-FileQuarantine-JavaDocs project.
# It simplifies deployment by ensuring that the Java documentation remains up-to-date with current usage examples.

# Author: © PWSS Org

$sourceFilePath = "..\usage_example\usage_example_util.txt"
$destinationFilePath = "..\docs\org\pwss\quarantineManager_aes\class-use\FileQuarantineManager.html"

# Read the content of the destination file (if it exists) into a variable
if (Test-Path $destinationFilePath) {
    $content = Get-Content -Path $destinationFilePath -Raw
} else {
    Write-Host "The destination file does not exist."
    return   
}

# Read the replacement text from the source file
$replacementText = (Get-Content -Path $sourceFilePath -Raw)

# Replace the specified string with the content of the source file in the destination file's content
$newContent = $content -replace "No usage of org.pwss.quarantineManager_aes.FileQuarantineManager",$replacementText

# Write the updated content to the destination file
Set-Content -Path $destinationFilePath -Value $newContent

Write-Host "String replacement completed successfully and saved to $destinationFilePath."