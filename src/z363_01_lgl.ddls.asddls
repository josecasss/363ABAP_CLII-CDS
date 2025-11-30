@AbapCatalog.viewEnhancementCategory: [#NONE]     
@AccessControl.authorizationCheck: #NOT_REQUIRED   // Control of access 
@EndUserText.label: 'Case'                         // Description of the CDS view
@Metadata.ignorePropagatedAnnotations: true        // Ignore propagated annotations
@ObjectModel.usageType:{
    serviceQuality: #C,                            // Type of CDS
    sizeCategory: #S,                              // Size of the result set
    dataClass: #MIXED                              // Type of data
}
define view entity z363_01_lgl
  as select from /dmo/customer
{
  key customer_id as CustomerId,
      first_name  as FirstName,
      last_name   as LastName,
      title       as Title,
      street      as Street,

      case country_code // Case statement for country_code modifying the output based in the when conditions
        when 'US' then concat( 'United States of America -  ', concat( first_name, last_name ) ) //Concat function just 2 parameters
        when 'DE' then concat( 'Germany -  ', first_name )
        when 'ES' then case title
                         when 'Mr.' then concat( 'Spain -  Mr. ', first_name )
                         when 'Mrs.' then concat( 'Spain -  Mrs. ', first_name )
                         else 'ES - Different Title'
                       end
        else 'Another Country Code' 
      end         as ElementCase // New name of the field(country_code) 
}
