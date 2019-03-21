# fiskaltrust interface documentation

Welcome to the open source documentation of fiskaltrust interface. Please review this README file to understand how you can assist in contributing to the fiskaltrust interface documentation.

## Repository structure

All documentation files are stored within the `/doc` folder in this repository (markdown, images, other static content).

- One sub-directory and one or more markdown file(s) per chapter should be created (e.g. `general/general.md`.)
- Each chapter markdown file must be included into the table of contents in `/doc/toc.md`. DocFx will scan this file to compose the PDF documentation.
  - The order from the toc file is used to define the chapter order in the PDF file.
  - You may also use multiple files per chapter, but keep in mind that a page-break is created by DocFx after every markdown file.
- Images must be stored within a folder called `images`. Multiple image folders in different sub-directories are supported, DocFx just scans for the directory name.

## Tools

### DocFx

[DocFx](https://dotnet.github.io/docfx) is a documentation generation tool that creates HTML and PDF documentation from markdown files. It's e.g. be used by Microsoft to generate docs.microsoft.com.

Use either chocolatey or nuget.exe to install DocFx, as described [here](https://github.com/docascode/docfx-seed/blob/master/README.md).

### wkhtmltopdf

[wkhtmltopdf](https://wkhtmltopdf.org/) is used internally by DocFx to convert HTML files to PDF. Download and install it from the website linked above.
> Please note that wkhtmltopdf 0.12.5 has a bug that prevents the creation of TOCs. Use either the previous (0.12.4) or any newer version.

### PlantUML

- This documentation supports the PlantUML notation, which will be converted to SVG images and embedded into the PDF during the build.
- Please add the `skinparam shadowing false` to your diagram. wkhtmltopdf has currently some issues with the transparency caused by the shading.
- The notation for a PlantUML section in the markdown files changed with the new tooling.  

- Example

````text
```plantUml
skinparam shadowing false
Diagram
```
````
