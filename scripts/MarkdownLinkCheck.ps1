$excludedUris = @(
    "https://signaturcloud.fiskaltrust.at", 
    "https://signaturcloud.fiskaltrust.fr", 
    "https://helipad.fiskaltrust.cloud",
    "https://packages.fiskaltrust.cloud"
);

function ContainsExcludedUri($line) {
    return $null -ne ($excludedUris | Where-Object { $line -match $_ });
}

if (!(Get-Command "node" -errorAction SilentlyContinue) -And !(Get-Command "markdown-link-check" -errorAction SilentlyContinue)) { 
    throw "This script requires node.js and the package markdown-link-check!"
}

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$files = Get-ChildItem -Path *.md -Recurse
$errors = @()

foreach ($file in $files) {   
    ($res = markdown-link-check -v $file) 2> $null
    $text = [system.String]::Join("`n", $res)
    if ($text.Contains("✖")) {
        for ($i = 0; $i -le $res.Count - 1; $i++) {
            if ($res[$i].Contains("✖") -and -not (ContainsExcludedUri $res[$i])) {
                # check if HTML Status beginns with 2 (success)
                $res[$i] -match '→ Status: .';
                if ($Matches[0][$matches[0].Length - 1] -eq '2') {
                    continue;
                }
                else {
                    $errors += "$($res[1])`n$($res[$i])`n";
                }     
            }
        }
    }
}

if ($errors.Count -ge 1) {
    throw $errors;
}
