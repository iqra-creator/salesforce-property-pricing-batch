# Property Pricing Batch Apex Framework

Automated, bulk-safe pricing engine to populate missing coworking desk prices
using Salesforce Batch Apex.

## Features
- Governor-safe Batch Apex
- Service-based architecture
- Isolated pricing logic
- Fully test-covered

## How to Run
```apex
Database.executeBatch(new PropertyPricingBatch(), 200);

## Author
Iqra Masood
Salesforce Administrator & Developer
