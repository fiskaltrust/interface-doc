---
slug: /style-guide
title: Documentation Style Guide
---

# Documentation Style Guide

## General Principles
- Use clear, concise language
- Write in present tense
- Use active voice
- Be consistent with terminology
- Include examples for complex concepts

## Document Structure
### Headers
- Use Title Case for Main Headers
- Use Sentence case for subheaders
- Maximum of 4 heading levels (h1-h4)

### Content Organization
- Start with an overview
- Include a table of contents for long documents
- Use consistent section ordering
- End with related links or next steps

## Formatting
### Code Blocks
```markdown
Use language-specific syntax highlighting:
```csharp
public void Example() {
    // C# code
}
```
```

### Lists
- Use bullet points for unordered lists
- Use numbers for sequential steps
- Maintain consistent capitalization
- End each list item with appropriate punctuation

### Tables
| Use | Tables | Sparingly |
|-----|---------|-----------|
| For | structured | data |

### Links
- Use relative paths for internal links
- Use descriptive link text
- Include link title attributes
- Check links regularly for validity

## Version Control
### Branch Naming
- feature/doc-{feature-name}
- fix/doc-{issue-number}
- update/doc-{section-name}

### Commit Messages
- Start with a verb (Add, Update, Fix, Remove)
- Keep under 72 characters
- Include issue reference if applicable

## Images and Diagrams
### File Format
- Use SVG for diagrams
- Use PNG for screenshots
- Optimize image sizes
- Include alt text

### Naming Convention
- Use lowercase
- Separate words with hyphens
- Include meaningful descriptors
- Example: api-authentication-flow.svg

## API Documentation
### Endpoint Documentation
```markdown
### Endpoint Name
`POST /api/v1/endpoint`

**Description:**
Brief description of the endpoint.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id   | string| Yes     | Resource ID |

**Request Example:**
```json
{
    "key": "value"
}
```

**Response Example:**
```json
{
    "status": "success"
}
```
```

### Error Handling
- Document all possible error codes
- Include error messages
- Provide troubleshooting steps

## Terminology
### Glossary
- Maintain a central glossary
- Use consistent terms
- Include industry-specific terms
- Link to official references

### Abbreviations
- Define on first use
- Include in glossary
- Use consistently

## Localization
### Text
- Use neutral language
- Avoid idioms
- Consider cultural differences
- Support right-to-left languages

### Date and Time
- Use ISO 8601 format
- Include timezone information
- Consider 12/24 hour formats

## Accessibility
### Content
- Use descriptive headings
- Provide alt text for images
- Use sufficient color contrast
- Support screen readers

### Navigation
- Provide keyboard navigation
- Include skip links
- Use ARIA labels where needed 