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

function CypherCracker {
    param (
        $Value,
        $IntFlip
    )

    # ASCI Int Mapping Table
    $IntMappingTable = @()
    $IntMappingTable = 1..128 | ForEach-Object { "$_ $([char]$_)" }

    $Value = $Value.ToCharArray()

    $FinalResult = @()

    foreach ($v in $Value) {
        # Get int of v
        foreach ($int in $IntMappingTable) {
            if ($v -eq "?") {
                # to fix
            }
            elseif ($int -cmatch $v) {
                if ($v -eq "a") {
                    $IntFlip + 26
                }
                elseif ($v -eq "z") {
                    $IntFlip - 26
                }
                
                # "match: $int"
                $a = $int.split(" ")
                $ReturnValue = [int]$a[0] + $IntFlip
                
                $IntMapSelector = $ReturnValue - 1
                if ($IntMapSelector -gt 0) {
                    $FinalResult += $IntMappingTable[$IntMapSelector].split(" ")  | Select-Object -Last 1
                }
                
                # 

            }
        }
    }
    return $FinalResult -join " "
}

$EncodedTextURI = 'https://ironscripter.us/wp-content/uploads/2019/04/cypher.txt'
$EncodedText = Invoke-WebRequest $EncodedTextURI

$EncodedText.Content

CypherCracker -Value $EncodedText.Content -IntFlip -5




