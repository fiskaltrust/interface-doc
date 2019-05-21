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
    if(!$global:errors.Contains("$($res[1])`n$($res[$i])`n")){
        $global:errors += ,"$($res[1])`n$($res[$i])`n";
    }
}

function CheckFile($file, [int]$tries) {
    # get string array [1]Filename [2+]Links + Status
    ($res = markdown-link-check -v $file) 2> $null
    
    $text = [string]$res
    if ($text.Contains("Error")) {
        for ($i = 0; $i -le $res.Count - 1; $i++) {
            if ($res[$i].Contains("Error") -and -not (ContainsExcludedUri $res[$i])) {
                # check if HTML Status beginns with 2 (success)
                # `u{2192} = → https://www.fileformat.info/info/unicode/char/2192/index.htm
                $res[$i] -match "\u2192 Status: .";
                if ($Matches[0][$matches[0].Length - 1] -eq "2") {
                    continue;
                }
                # Status 0 Error: read ECONNRESET -> Node Js socket failed with TCP connection 
                elseif ($Matches[0][$matches[0].Length - 1] -eq "0") {
                    #retry
                    if($tries -lt 3){ 
                        CheckFile $file ($tries + 1)
                    }
                    else{
                        AddError $res $i
                    }
                }
                else {
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
    CheckFile($file, 0);
}

if ($errors.Count -ge 1) {
    throw $errors;
}
