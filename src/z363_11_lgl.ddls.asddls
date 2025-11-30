@EndUserText.label: 'Custom Entity'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_363_QUERY_LGL' //Class to be used for the query
define custom entity z363_11_lgl

{
  key travel_id   : /dmo/travel_id;
      agency_id   : /dmo/agency_id;
      customer_id : /dmo/customer_id;

}

//Custom entity (Complex Logic Model)
//Class hold the logic to fetch the data for the entity
//Used to be exposed as OData service 
