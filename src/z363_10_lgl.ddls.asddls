@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z363_10_lgl

  as select from /dmo/travel as Travel

  association [1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerId // Example of a simple association
  association [1..1] to /dmo/agency   as _Agency   on _Agency.agency_id = $projection.AgencyId       // AssociationAlias - (AssociationAlias-FieldAssociation) - (%projection-AliasFieldtoProject)
{
  key travel_id   as TravelId,
      agency_id   as AgencyId,
      customer_id as CustomerId,
      _Customer,
      _Agency
}

//Association is left outer join by default
