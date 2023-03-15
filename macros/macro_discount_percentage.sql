{% macro discount(column_name) %}
 ({{column_name}} * 100)   
{% endmacro %}
