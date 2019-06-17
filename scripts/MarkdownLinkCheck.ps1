$excludedUris = @(
    "https://signaturcloud.fiskaltrust.at", 
    "https://signaturcloud.fiskaltrust.fr", 
    "https://helipad.fiskaltrust.cloud",
    "https://packages.fiskaltrust.cloud"
);

function ContainsExcludedUri($line) {
    return $null -ne ($excludedUris | Where-Object { $line -match $_ });
}

function AddError($res, $i) {    
    $global:errors += ,"$($res[1])`n$($res[$i])`n";
}

function CheckFile($file) {
    # get string array [0]is empty [1]Filename [2+]Links + Status
    ($res = markdown-link-check -v $file) 2> $null

    for ($i = 2; $i -le $res.Count - 1; $i++) {
        if (ContainsExcludedUri $res[$i]) {
            $res[$i] + " is an excluded url."
        }
        else{
            # check if HTML Status beginns with 2 (success)
            # `u{2192} = → https://www.fileformat.info/info/unicode/char/2192/index.htm
            ($res[$i] -match "\u2192 Status: .") > $null
            if($Matches.Length -gt 0){
                if ($Matches[0][$matches[0].Length - 1] -ne "2")
                {
                    AddError $res $i
                }              
            }
        }       
    }   
}


if (!(Get-Command "node" -errorAction SilentlyContinue) -And !(Get-Command "markdown-link-check" -errorAction SilentlyContinue)) { 
    throw "This script requires node.js and the package markdown-link-check!"
}

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$files = Get-ChildItem -Path *.md -Recurse
$global:errors = @()

foreach ($file in $files) {   
    CheckFile($file);
}

if ($errors.Count -ge 1) {
    throw $errors;
}

