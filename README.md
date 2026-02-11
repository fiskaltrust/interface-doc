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
The repository is built using [docusaurus](https://docusaurus.io/).
All documentation files are stored within the `/doc` folder in this repository (markdown, images, other static content).

You need to add a `slug` and `title` in the yaml fromtmatter of your files and possibly adapt the [`toc.js`](./toc.js) file.

#### References
A reference to a markdown file can be created like this: `[Reference Text](./path-to-file/filename.md)`.
> Note that reference paths should be relative.

If you want to reference something specific inside a markdown file, you need to create an anchor to which you want your reference to point.
Anchors can be created like this: `<span id="anchor-name">Referenced Item</span>`.

### Tools

#### lychee
With [lychee](https://github.com/lycheeverse/lychee) you can check markdown files for broken links.
usage:
```
lychee ./general/general.md
```

## Further public fiskaltrust repositories

The following list shows further fiskaltrust repositories that are important for our customers. 

| **Github repo**                                                                                   | **Goal/Purpose**                                                                                                                                                                                         | **Content**                                                                                                                                                                                                                                                                                                                   |
|---------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [fiskaltrust/productdescription-de-doc](https://github.com/fiskaltrust/productdescription-de-doc) | Goal of this repository is to help our customers to get familiar with our products and services for the german market. It should also help our customers apply the products and services described here. | The repository contains descriptions of the offered products and services by fiskaltrust for the german market. It also contains accompanying materials such as how-to guides, price lists, concepts, and presentations that help our customers integrate the offered products and services into their products and services. |
| [fiskaltrust/faq](https://github.com/fiskaltrust/faq)                                             | The purpose of this repository is to provide information on our customers' frequent questions or concerns.                                                                                               | The repo contains unsorted but tagged question and answer sets. If the answer's content already exists in another public fiskaltrust repository, that content is linked in the solution. The content of this repo is also rendered and presented in the [docs.fiskaltrust](https://docs.fiskaltrust.cloud) portal.            |
