<#
    Iron Scripter 
    "A Challenge from the Dark Faction"
    https://ironscripter.us/a-challenge-from-the-dark-faction/
    
    By Ehmiiz




    ----------

Caesar Cipher. This is nothing more than a simple character substitution encoding.
The original characters have been adjusted by some constant value up or down.
Your challenge is to decode their message with PowerShell.
You will first need to retrieve the text message from http://bit.ly/DarkFactionMessage.
You will also need to take blank lines into account in your decoding.
#>

Import-Module ./Invoke-CypherCracker.ps1

$EncodedTextURI = 'https://ironscripter.us/wp-content/uploads/2019/04/cypher.txt'
$EncodedText = Invoke-WebRequest $EncodedTextURI

Invoke-CypherCracker -Value $EncodedText.Content -IntFlip -5