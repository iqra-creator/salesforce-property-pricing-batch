/**
 * Author: Iqra Masood
 * Description: Batch job to populate missing average desk prices
 */
public with sharing class PropertyPricingBatch
    implements Database.Batchable<SObject>, Database.Stateful {

    public Database.QueryLocator start(Database.BatchableContext context) {
        return Database.getQueryLocator(
            'SELECT Id, City__c, Address__c, Avg_Desk_Price__c ' +
            'FROM Property__c ' +
            'WHERE Avg_Desk_Price__c = NULL ' +
            'AND City__c != NULL'
        );
    }

    public void execute(Database.BatchableContext context, List<Property__c> scope) {

        Map<Id, Decimal> calculatedPrices =
            PricingService.calculatePrices(scope);

        List<Property__c> updates = new List<Property__c>();

        for (Property__c prop : scope) {
            if (calculatedPrices.containsKey(prop.Id)) {
                prop.Avg_Desk_Price__c = calculatedPrices.get(prop.Id);
                prop.Pricing_Source__c = 'System Calculated';
                updates.add(prop);
            }
        }

        if (!updates.isEmpty()) {
            update updates;
        }
    }

    public void finish(Database.BatchableContext context) {
        System.debug('Property Pricing Batch Completed');
    }
}
