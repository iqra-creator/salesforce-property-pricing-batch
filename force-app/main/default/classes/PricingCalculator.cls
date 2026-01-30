/**
 * Author: Iqra Masood
 * Description: Pricing rules engine
 */
public with sharing class PricingCalculator {

    public static Decimal calculate(String city, String address) {

        if (String.isBlank(city)) {
            return null;
        }

        Map<String, Decimal> cityBaseRates = new Map<String, Decimal>{
            'Dubai' => 1200,
            'London' => 1500,
            'New York' => 1800,
            'Berlin' => 900
        };

        Decimal basePrice = cityBaseRates.get(city);

        if (basePrice == null) {
            basePrice = 1000;
        }

        return basePrice;
    }
}
