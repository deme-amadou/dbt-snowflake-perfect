{% macro learn_variables() %}

{% set my_name="Bababytes" %}

{{ log("My name is : " ~ my_name, info=True) }}

{{ log("Hello dbt user: "~ var("username","NO USERNAME IS SET"), info=True)}}
  
{% endmacro %}

--dbt run-operation learn_variables --vars "{'username':'diafuser'}"