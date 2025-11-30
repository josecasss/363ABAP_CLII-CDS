class zcl_363_query_lgl definition
  public
  final
  create public .

  public section.
    interfaces if_rap_query_provider. " Implement the query provider interface

  protected section.
  private section.
ENDCLASS.



CLASS ZCL_363_QUERY_LGL IMPLEMENTATION.


  method if_rap_query_provider~select.

    data lt_results type table of z363_11_lgl.

    try.

        if io_request->is_data_requested(  ).

          data(lv_top) = io_request->get_paging(  )->get_page_size(  ).
          data(lv_skip) = io_request->get_paging(  )->get_offset(  ).

* Logic for fetching data from the database table (Could be more complex in real scenarios)
          select from /dmo/travel
                 fields travel_id, agency_id, customer_id
                 order by travel_id ascending
                 into table @lt_results
                 offset @lv_skip
                 up to @lv_top rows.

          if sy-subrc eq 0.

            io_response->set_total_number_of_records( lines( lt_results ) ).
            io_response->set_data( lt_results ).

          endif.

        endif.

      catch cx_rap_query_response_set_twic into data(lx_exc).

    endtry.

  endmethod.
ENDCLASS.
