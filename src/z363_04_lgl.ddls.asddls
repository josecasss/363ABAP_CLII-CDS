@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z363_04_lgl
  as select from /dmo/travel
{
  key travel_id                  as TravelId,
      cast('' as abap.numc( 4 )) as BookingId    // Dummy field to match union
}

union select distinct from /dmo/booking  // Distinct No duplicates, just keep one record

{
  key travel_id  as TravelId,
      booking_id as BookingId
}


// Same fields names, same types, same number of fields, same KEYS
