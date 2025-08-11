SELECT
    ID as host_id
    , NAME as host_name
    , IS_SUPERHOST
    , CREATED_AT
    , UPDATED_AT
FROM {{source('AIRBNB', 'RAW_HOSTS')}} src