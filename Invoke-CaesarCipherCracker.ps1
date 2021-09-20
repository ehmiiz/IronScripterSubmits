function Invoke-CaesarCipherCracker {
    param (
        $Value,
        $IntFlip
    )

    # ASCI Int Mapping Table
    $IntMappingTable = @()
    $IntMappingTable = 1..128 | ForEach-Object { "$_ $([char]$_)" }

    if ($Value.Length -gt 1) {
        $Value = $Value.ToCharArray()
    }

    $FinalResult = @()

    foreach ($v in $Value) {
        # Get int of v
        foreach ($int in $IntMappingTable) {
            if ($v -eq "?") {
                # to fix
            }
            elseif ($int -clike "*$v") {

                # "match: $int"
                if ($v -eq " ") {
                    # Will not split " " with " "
                }
                else {
                    $a = $int.split(" ")
                    $ReturnValue = [int]$a[0] + $IntFlip
                    
                    $IntMapSelector = $ReturnValue - 1
                    if ($IntMapSelector -gt 0) {
                        $FinalResult += $IntMappingTable[$IntMapSelector].split(" ")  | Select-Object -Last 1
                    }
                }
            }
        }
    }
    # This part is funny.
    $FinalResult = $FinalResult -join " "
    $FinalResult = $FinalResult.Replace("  ", "SPACE")
    $FinalResult = $FinalResult.Replace(" ", "")
    $FinalResult = $FinalResult.Replace("SPACE", " ")
    return $FinalResult
}