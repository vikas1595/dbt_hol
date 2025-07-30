SELECT base_currency_id        currency
     , quote_currency_id   currency_unit
     , frequency       frequency
     , date            date
     , value           value
     , data_source_name data_source_name
  FROM {{source('dbt_hol_dev','fx_rates')}}  src 