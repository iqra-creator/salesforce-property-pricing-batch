# Property Pricing Batch Apex Framework

Automated, bulk-safe pricing engine to populate missing coworking desk prices
using Salesforce Batch Apex.

## Features
- Governor-safe Batch Apex
- Service-based architecture
- Isolated pricing logic
- Fully test-covered

## Author
Iqra Masood - Salesforce Administrator & Developer

## How to Run
```apex
Database.executeBatch(new PropertyPricingBatch(), 200)
