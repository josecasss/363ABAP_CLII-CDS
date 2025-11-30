@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Session Variables'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z363_02_lgl
  as select from /dmo/customer
{
  key customer_id              as CustomerID,  
      $session.client          as ClientField,            // Client  
      $session.system_date     as SystemDate,             // System Date
      $session.system_language as SystemLanguage,         // System Language
      $session.user            as UserField,              // User ID
      $session.user_date       as UserDate,               // User Date
      $session.user_timezone   as UserTz                  // User Time Zone

//              $session.bs_instance_id as BSInstanceID,
//              $session.bs_zone_id as BSZoneId

}

