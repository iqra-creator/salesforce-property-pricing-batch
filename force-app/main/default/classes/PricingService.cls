/**
 * Author: Iqra Masood
 * Description: Service layer for pricing calculations
 */
public with sharing class PricingService {

    public static Map<Id, Decimal> calculatePrices(
        List<Property__c> properties
    ) {
        Map<Id, Decimal> results = new Map<Id, Decimal>();

        for (Property__c prop : properties) {
            Decimal price =
                PricingCalculator.calculate(
                    prop.City__c,
                    prop.Address__c
                );

            if (price != null) {
                results.put(prop.Id, price);
            }
        }
        return results;
    }
}
