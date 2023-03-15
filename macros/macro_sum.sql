{% macro sum(column_name) %}
    (sum({{(column_name)}}))
{% endmacro %}
