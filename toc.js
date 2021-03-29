module.exports = {
  middlewareDoc: [
    //AUTO-INSERT:GETTING-STARTED-CREATORS
    {
      type: 'category',
      collapsed: false,
      label: 'Middleware API documentation',
      items: [
        {
          type: 'category',
          label: 'General',
          items: [
            'middleware-doc/doc/general/general',
            'middleware-doc/doc/general/terminology/terminology',
            'middleware-doc/doc/general/cash-register-integration/cash-register-integration',
            'middleware-doc/doc/general/data-structures/data-structures',
            'middleware-doc/doc/general/function-structures/function-structures',
            'middleware-doc/doc/general/communication/communication',
            'middleware-doc/doc/general/operation-modes/operation-modes',
            'middleware-doc/doc/general/installation/installation',
            'middleware-doc/doc/general/receipt-case-definitions/receipt-case-definitions',
            'middleware-doc/doc/general/reference-tables/reference-tables',
          ]
        },
        {
          type: 'category',
          label: 'Austria (RKSV)',
          items: [
            'middleware-doc/doc/appendix-at-rksv/appendix-at-rksv',
            'middleware-doc/doc/appendix-at-rksv/terminology/terminology',
            'middleware-doc/doc/appendix-at-rksv/cash-register-integration/cash-register-integration',
            'middleware-doc/doc/appendix-at-rksv/data-structures/data-structures',
            'middleware-doc/doc/appendix-at-rksv/function-structures/function-structures',
            'middleware-doc/doc/appendix-at-rksv/communication/communication',
            'middleware-doc/doc/appendix-at-rksv/operation-modes/operation-modes',
            'middleware-doc/doc/appendix-at-rksv/installation/installation',
            'middleware-doc/doc/appendix-at-rksv/receipt-case-definitions/receipt-case-definitions',
            'middleware-doc/doc/appendix-at-rksv/reference-tables/reference-tables',
          ]
        },
        {
          type: 'category',
          label: 'Germany (KassenSichV)',
          items: [
            'middleware-doc/doc/appendix-de-kassensichv/appendix-de-kassensichv',
            'middleware-doc/doc/appendix-de-kassensichv/terminology/terminology',
            'middleware-doc/doc/appendix-de-kassensichv/cash-register-integration/cash-register-integration',
			 {
              type: 'category',
              label: 'Cash register integration',
              items: [
                'middleware-doc/doc/appendix-de-kassensichv/cash-register-integration/single-receipt-creation',
                'middleware-doc/doc/appendix-de-kassensichv/cash-register-integration/receipt-sequences-creation',
              ]
            },
            'middleware-doc/doc/appendix-de-kassensichv/data-structures/data-structures',
            {
              type: 'category',
              label: 'Reference Tables',
              items: [
                'middleware-doc/doc/appendix-de-kassensichv/reference-tables/reference-tables',
                'middleware-doc/doc/appendix-de-kassensichv/reference-tables/service-status-ftstate',
                'middleware-doc/doc/appendix-de-kassensichv/reference-tables/type-of-receipt-ftreceiptcase',
                'middleware-doc/doc/appendix-de-kassensichv/reference-tables/type-of-service-ftchargeitemcase',
                'middleware-doc/doc/appendix-de-kassensichv/reference-tables/type-of-payment-ftpayitemcase',
                'middleware-doc/doc/appendix-de-kassensichv/reference-tables/type-of-signature-ftsignaturetype',
                'middleware-doc/doc/appendix-de-kassensichv/reference-tables/type-of-journal-ftjournaltype',
              ]
            },
            'middleware-doc/doc/appendix-de-kassensichv/receipt-case-definitions/receipt-case-definitions',
            'middleware-doc/doc/appendix-de-kassensichv/procedural-documentation/dsfinv-k-generation',
          ]
        },
        {
          type: 'category',
          label: 'France (BOI-TVA-DECLA-30-10-30)',
          items: [
            'middleware-doc/doc/appendix-fr-boi-tva-decl-30-10-30/appendix-fr-boi-tva-decl-30-10-30',
            'middleware-doc/doc/appendix-fr-boi-tva-decl-30-10-30/terminology/terminology',
            'middleware-doc/doc/appendix-fr-boi-tva-decl-30-10-30/cash-register-integration/cash-register-integration',
            'middleware-doc/doc/appendix-fr-boi-tva-decl-30-10-30/data-structures/data-structures',
            'middleware-doc/doc/appendix-fr-boi-tva-decl-30-10-30/function-structures/function-structures',
            'middleware-doc/doc/appendix-fr-boi-tva-decl-30-10-30/communication/communication',
            'middleware-doc/doc/appendix-fr-boi-tva-decl-30-10-30/operation-modes/operation-modes',
            'middleware-doc/doc/appendix-fr-boi-tva-decl-30-10-30/installation/installation',
            'middleware-doc/doc/appendix-fr-boi-tva-decl-30-10-30/receipt-case-definitions/receipt-case-definitions',
            'middleware-doc/doc/appendix-fr-boi-tva-decl-30-10-30/reference-tables/reference-tables',
          ]
        },
        {
          type: 'link',
          label: 'Middleware API samples',
          href: 'https://middleware-samples.docs.fiskaltrust.cloud/'
        }
      ]
    }
  ]
}