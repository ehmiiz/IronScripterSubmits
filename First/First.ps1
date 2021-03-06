<#
    Iron Scripter 
    "A Challenge from the Dark Faction"
    https://ironscripter.us/a-challenge-from-the-dark-faction/
    
    By Ehmiiz


    TODO: 
        1. Does not handle A and Z very well currently

    ----------

Caesar Cipher. This is nothing more than a simple character substitution encoding.
The original characters have been adjusted by some constant value up or down.
Your challenge is to decode their message with PowerShell.
You will first need to retrieve the text message from http://bit.ly/DarkFactionMessage.
You will also need to take blank lines into account in your decoding.
#>

Import-Module ./Invoke-CaesarCipherCracker.ps1 -Force

$EncodedTextURI = 'https://ironscripter.us/wp-content/uploads/2019/04/cypher.txt'
$EncodedText = Invoke-WebRequest $EncodedTextURI

Invoke-CaesarCipherCracker -Value $EncodedText.Content -IntFlip -5