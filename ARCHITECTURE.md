```mermaid
flowchart TD
    A[Batch Apex Job] --> B[PricingService]
    B --> C[PricingCalculator]
    C --> D[Calculated Prices]
    D --> E[Property__c Update]
