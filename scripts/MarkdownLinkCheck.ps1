if (!(Get-Command "node" -errorAction SilentlyContinue) -And !(Get-Command "markdown-link-check" -errorAction SilentlyContinue))
{ throw "This script requires node.js and the package markdown-link-check!"}

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Set-Location ..\doc

$files = Get-ChildItem -Path *.md -Recurse
$errors = @()

foreach ($file in $files)
{   
   ($res = markdown-link-check -v $file) 2> $null
   $text = [system.String]::Join("`n", $res)
   $text
   if($text.Contains("✖"))
   {
    for ($i=0; $i -le $res.Count-1; $i++) 
     {
        if($res[$i].Contains("✖"))
        {
         # check if HTML Status beginns with 2 (success)
         $matches = $res[$i] -match '(→ Status: ).';
         if($matches[0][$matches[0].Length-1] -eq '2')
         {
            continue;
         }
         # add error
         else
         {
            $errors += "$($res[1])`n$($res[$i])`n";
         }     
        }
    }
   }
}


if($errors.Count -ge 1)
{
    throw $errors;
}
