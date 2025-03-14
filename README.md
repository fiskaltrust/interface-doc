# fiskaltrust Interface Documentation
_Welcome to the open-source documentation of the fiskaltrust interface!_

This repository provides a comprehensive technical specification of the fiskaltrust data interface used by POS-Systems to interact with the fiskaltrust.Middleware. Our goal is to enable PosCreators to integrate the fiskaltrust.Middleware into their systems efficiently and independently.

## Quick Links
- [Getting Started Guide](doc/general/getting-started.md)
- [POS System API](doc/general/pos-system-api.md)
- [API Reference](doc/general/api-reference.md)
- [Troubleshooting Guide](doc/general/troubleshooting.md)
- [Style Guide](doc/templates/style-guide.md)

## Documentation Structure

### General Documentation
- Installation and Setup
- Configuration Options
- Security Guidelines
- Performance Optimization
- Testing and Certification

### API Documentation
- [POS System API](doc/general/pos-system-api.md)
  - Receipt Signing
  - Journal Operations
  - Configuration Management
  - Error Handling
- Integration Patterns
- Authentication
- Versioning

### Country-Specific Documentation
- [Austria (AT-RKSV)](doc/middleware-at-rksv/)
- [Germany (DE-KassenSichV)](doc/middleware-de-kassensichv/)
- [France (FR-BOI-TVA-DECL)](doc/middleware-fr-boi-tva-decl-30-10-30/)
- [Italy (IT-RT)](doc/middleware-it-registratore-telematico/)

### Technical Reference
- API Specifications
- Data Structures
- Integration Patterns
- Error Handling
- Compliance Requirements

## Contributing

We welcome contributions from the community! Please follow these steps:

1. Read our [Style Guide](doc/templates/style-guide.md)
2. Fork the repository
3. Create a feature branch
4. Make your changes
5. Submit a pull request

### Documentation Standards
- Use clear, concise language
- Include practical examples
- Provide complete code samples
- Keep content up-to-date
- Follow the style guide

## Building the Documentation

### Prerequisites
- Node.js 14+
- DocFX
- PowerShell 5.1+

### Build Steps
1. Clone the repository
   ```bash
   git clone https://github.com/fiskaltrust/interface-doc.git
   ```

2. Install dependencies
   ```bash
   npm install
   ```

3. Build the documentation
   ```bash
   npm run build
   ```

### Testing Links
```bash
npm run test:links
```

## Support and Community

- [GitHub Issues](https://github.com/fiskaltrust/interface-doc/issues)
- [Support Portal](https://portal.fiskaltrust.cloud)
- [Community Forum](https://forum.fiskaltrust.cloud)

## License

This documentation is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Version History

| Version | Release Date | Major Changes |
|---------|--------------|---------------|
| 1.3     | 2024-01-01  | Added new country support |
| 1.2     | 2023-06-01  | Enhanced API documentation |
| 1.1     | 2023-01-01  | Initial release |

## Contributions
By reviewing this README file in order to understand its structure and which tools are being used, you are contributing to improving this documentation.

### Repository structure
The repository is built using [docusaurus](https://docusaurus.io/).
All documentation files are stored within the `/doc` folder in this repository (markdown, images, other static content).

You need to add a `slug` and `title` in the yaml fromtmatter of your files and possibly adapt the [`toc.js`](.toc.js) file.

#### References
A reference to a markdown file can be created like this: `[Reference Text](./path-to-file/filename.md)`.
> Note that reference paths should be relative.

If you want to reference something specific inside a markdown file, you need to create an anchor to which you want your reference to point.
Anchors can be created like this: `<span id="anchor-name">Referenced Item</span>`.

### Tools

#### markdown-link-check
With [markdown-link-ckeck](https://www.npmjs.com/package/markdown-link-check) you can check a markdown file for incorrect links.
usage:
```
markdown-link-check ./general/general.md
```
> Please note that this tool does not find dead references inside a file. Only dead references to nonexisting files / unreachable URLs.

## Further public fiskaltrust repositories

The following list shows further fiskaltrust repositories that are important for our customers. 

| **Github repo**                                                                                   | **Goal/Purpose**                                                                                                                                                                                                                            | **Content**                                                                                                                                                                                                                                                                                                                                                                                                             |
|---------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [fiskaltrust/productdescription-de-doc](https://github.com/fiskaltrust/productdescription-de-doc) | Goal of this repository is to help our customers to get familiar with our products and services for the german market. It should also help our customers apply the products and services described here.                                    | The repository contains descriptions of the offered products and services by fiskaltrust for the german market. It also contains accompanying materials such as how-to guides, price lists, concepts, and presentations that help our customers integrate the offered products and services into their products and services.                                                                                           |
| [fiskaltrust/faq](https://github.com/fiskaltrust/faq)                                             | The purpose of this repository is to provide information on our customers' frequent questions or concerns.                                                                                                                                  | The repo contains unsorted but tagged question and answer sets. If the answer's content already exists in another public fiskaltrust repository, that content is linked in the solution. The content of this repo is also rendered and presented in the [docs.fiskaltrust](https://docs.fiskaltrust.cloud/doc/faq/qna/market-de.html) portal.                                                                           |
