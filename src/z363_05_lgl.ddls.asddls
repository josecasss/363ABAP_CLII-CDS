@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aggregations'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z363_05_lgl
  as select from z363_06_lgl
{
  key travel_id,
      agency_id,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      min( total_price ) as MinTotalPrice,                     // Minimum value of total_price 
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      max( total_price ) as MaxTotalPrice,                     // Maximum value of total_price
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum( total_price ) as SumTotalPrice,                     // Sum of total_price
      
      count( distinct total_price ) as CountDistTotalPrice,    // Count of distinct values of total_price
      
      count( * ) as CountAllTotalPrice,                        // Count of all entries
         
      @Semantics.amount.currencyCode: 'CurrencyCode'
      avg( total_price as abap.dec(16,2) ) as AvgTotalPrice,   // Average value of total_price
      
      currency_code      as CurrencyCode
}
group by
  travel_id,
  agency_id,
  currency_code;
