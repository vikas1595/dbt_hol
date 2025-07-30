WITH cst AS (
    SELECT
        company_ticker,
        company_name,
        stock_exchange_name,
        indicator_name,
        DATE,
        VALUE,
        data_source_name
    FROM
        {{ ref('base_knoema_stock_history') }}
        src
    WHERE
        indicator_name IN (
            'Close',
            'Open',
            'High',
            'Low',
            'Volume',
            'Change %'
        )
)
SELECT
    *
FROM
    cst pivot(SUM(VALUE) for indicator_name IN ('Close', 'Open', 'High', 'Low', 'Volume', 'Change %')) AS p(
        company_ticker,
        company_name,
        stock_exchange_name,
        DATE,
        data_source_name,
        CLOSE,
        OPEN,
        high,
        low,
        volume,
        change
    )
