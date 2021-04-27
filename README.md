# fiskaltrust interface documentation
_Welcome to the open-source documentation of the fiskaltrust interface!_

This repository aims to provide a detailed technical specification of the fiskaltrust data interface used by POS-Systems to interact with the fiskaltrust.Middleware, so that PosCreators can integrate the fiskaltrust.Middleware into their systems without further support in most cases.

The technical specification of the data interface described in this document provides information regarding the following areas:
1. Access to the fiskaltrust.Middleware
2. Integration into the receipt based cash register workflow
3. The data structure
4. Function structure of the interface
5. Types of communication with fiskaltrust.Middleware
6. Operating categories
Interface specification is provided by fiskaltrust.Interface NuGet package, which can be found at https://www.nuget.org/packages/fiskaltrust.interface

Official PDF documents that are built from the source in this repository can be found on the [Releases page](https://github.com/fiskaltrust/interface-doc/releases).

## Contributions
By reviewing this README file in order to understand its structure and which tools are being used, you are contributing to improving this documentation.

### Repository structure
All documentation files are stored within the `/doc` folder in this repository (markdown, images, other static content).

- You should create one sub-directory and one or more markdown file(s) per chapter (e.g. `general/general.md`.)
  - 1st and 2nd level headings should be split into separate files.
- You must include each chapter markdown file in the table of contents in `/doc/toc.md`. DocFx will scan this file to compose the PDF documentation.
  - The order from the toc file is used to define the chapter order in the PDF file.
  - You may also use multiple files per chapter, but keep in mind that DocFx creates a page-break after every markdown file.
- You must store images within a folder called `images`. Multiple image folders in different sub-directories are supported, DocFx scans for the directory name.

#### References
A reference to a markdown file can be created like this: `[Reference Text](./path-to-file/filename.md)`.
> Note that reference paths should be relative.

If you want to reference something specific inside a markdown file, you need to create an anchor to which you want your reference to point.
Anchors can be created like this: `<span id="anchor-name">Referenced Item</span>`.

The anchor id should adhere to the following convention: `<prefix>-<name>-<linenumber>`

The `<prefix>` shows what is referenced (`c` for a chapter, `t` for a table, `i` for an illustration and `l` for a code listing).
The `<name>` is the name of the referenced item in lowercase letters with `-` instead of whitespaces.
The `<linenumber>` is the line number of the anchor at the time of writing. This serves the prevention of duplicate names in a markdown file.

An anchor could look like this:
````

```
some code
```
<span id="l-example-for-an-anchor-on-a-codelisting-43">Example for an anchor on a codelisting</span>
````

You can referencte an anchored item like this: `[Reference Text](#anchor-name)`.

You can also reference anchors in other files like this:
```
[This](./path-to-file/filename.md#l-example-for-an-anchor-on-a-codelisting-43) is an example for a reference to the codelisting from the previous example.
```

### Tools

#### DocFx
[DocFx](https://dotnet.github.io/docfx) is a documentation generation tool that creates HTML and PDF documentation from markdown files. It's e.g. be used by Microsoft to generate docs.microsoft.com.

Use either chocolatey or nuget.exe to install DocFx, as described [here](https://github.com/docascode/docfx-seed/blob/master/README.md).

DocFx will produce warnings for incorrect markdown (including incorrect references).

#### wkhtmltopdf
[wkhtmltopdf](https://wkhtmltopdf.org/) is used internally by DocFx to convert HTML files to PDF. Download and install it from the website linked above.
> Please note that wkhtmltopdf 0.12.5 has a bug that prevents the creation of TOCs. Use either the previous (0.12.4) or any newer version.

#### markdown-link-check
With [markdown-link-ckeck](https://www.npmjs.com/package/markdown-link-check) you can check a markdown file for incorrect links.
usage:
```
markdown-link-check ./general/general.md
```
> Please note that this tool does not find dead references inside a file. Only dead references to nonexisting files / unreachable URLs.

#### PlantUML
- This documentation supports the PlantUML notation, which will be converted to SVG images and embedded into the PDF during the build.
- Please add the `skinparam shadowing false` to your diagram. wkhtmltopdf has currently some issues with the transparency caused by the shading.
- The notation for a PlantUML section in the markdown files changed with the new tooling.  

- Example

````text
​```plantUml
skinparam shadowing false
Diagram
```
````

### Release
To create a release, clone the repository locally and run the following commands:

​```
git tag [version]
git push origin --tags
​```

## Further public fiskaltrust repositories

The following list shows further fiskaltrust repositories that are important for our customers. 

| **Github repo**| **Goal/Purpose** | **Content** |
|-------------------|----------|------------|
|[fiskaltrust/portal-manual-doc](https://github.com/fiskaltrust/portal-manual-doc)| Goal of this repository is to list and describe the available functionality of the fiskaltrust.Portal so that the usability and understanding of the portal can be increased by the here offered explanations and descriptions. | The available functionalities of the fiskaltrust.Portal, including the meaning of menu items, buttons, input fields, dropdown & checkbox values, are described here. Here you can also find different insights and tips on how the portal helps to configure or run different fiskaltrust processes here. The description of fiskaltrust processes and products themselves are not part of this repository. |
|[fiskaltrust/productdescription-de-doc](https://github.com/fiskaltrust/productdescription-de-doc)|Goal of this repository is to help our customers to get familiar with our products and services for the german market. It should also help our customers apply the products and services described here.| The repository contains descriptions of the offered products and services by fiskaltrust for the german market. It also contains accompanying materials such as how-to guides, price lists, concepts, and presentations that help our customers integrate the offered products and services into their products and services. |
|[fiskaltrust/faq](https://github.com/fiskaltrust/faq)| The purpose of this repository is to provide information on our customers' frequent questions or concerns. | The repo contains unsorted but tagged question and answer sets. If the answer's content already exists in another public fiskaltrust repository, that content is linked in the solution. The content of this repo is also rendered and presented in the [docs.fiskaltrust](https://docs.fiskaltrust.cloud/doc/faq/qna/market-de.html) portal. |
