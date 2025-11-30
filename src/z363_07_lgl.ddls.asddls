@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Amount Conversion'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z363_07_lgl
  with parameters
    pFromCurrency : abap.cuky,  // Parameter for source currency
    pToCurrency   : abap.cuky   // Parameter for target currency

  as select from /dmo/travel
{
  key travel_id                                                  as TravelId,

      @Semantics.amount.currencyCode: 'OriginalCurrency'
      total_price                                                as OriginalPrice,
      currency_code                                              as OriginalCurrency,

      @Semantics.amount.currencyCode: 'ConvertedCurrency'
      currency_conversion( amount             => total_price, //column from data source   //Funtion to convert currency
                           source_currency    => $parameters.pFromCurrency,
                           target_currency    => $parameters.pToCurrency,
                           exchange_rate_date => begin_date, //column from data source    (El funcional tambien juega rol aca par a determinar la fecha del tipo de cambio) *Funcionales deben configurar las tasas
                           error_handling     => 'SET_TO_NULL' ) as ConvertedPrice,       //Error handling if conversion fails
      $parameters.pToCurrency                                    as ConvertedCurrency

}
where
  currency_code = $parameters.pFromCurrency;

 // This view entity performs currency conversion on travel expenses, converting the total price from the original currency to a specified target currency using the provided parameters.
