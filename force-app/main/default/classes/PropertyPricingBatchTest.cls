/**
 * Author: Iqra Masood
 * Description: Test class
 */
@IsTest
private class PropertyPricingBatchTest {

    @IsTest
    static void testBatchPricing() {

        List<Property__c> props = new List<Property__c>();

        for (Integer i = 0; i < 10; i++) {
            props.add(new Property__c(
                Name = 'Test Property ' + i,
                City__c = 'Dubai',
                Address__c = 'Business Bay'
            ));
        }

        insert props;

        Test.startTest();
        Database.executeBatch(new PropertyPricingBatch(), 5);
        Test.stopTest();

        List<Property__c> updated =
            [SELECT Avg_Desk_Price__c
             FROM Property__c
             WHERE Avg_Desk_Price__c != NULL];

        System.assertEquals(10, updated.size());
    }
}
