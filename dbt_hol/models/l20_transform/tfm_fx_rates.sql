{{ config(
    materialized = 'table',
    tags = ['Reference Data']
) }}

SELECT
    src.*
FROM
    {{ ref('base_knoema_fx_rates') }}
    src
WHERE
    frequency = 'D'
    AND DATE > '2016-01-01'
