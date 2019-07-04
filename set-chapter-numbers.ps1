# Get chapter numbering tool from GitHub
New-Item -Name "tools" -ItemType Directory -Force
Invoke-WebRequest -Uri https://github.com/TSchmiedlechner/DocFxChapterNumbers/releases/download/v1.0.2/DocFxChapterNumbers-v1.0.2.zip -OutFile "./tools/DocFxChapterNumbers.zip"
Expand-Archive "./tools/DocFxChapterNumbers.zip" -DestinationPath "./tools/DocFxChapterNumbers" -Force

Rename-Item ./doc ./doc_prev
./tools/DocFxChapterNumbers/DocFxChapterNumbers.exe ./doc_prev/toc.md ./doc --force