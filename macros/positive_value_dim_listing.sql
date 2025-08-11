{% test positive_col_value(model,column_name) %}
SELECT
* FROM {{ model }}
WHERE
{{ column_name }} < 0
{% endtest %}