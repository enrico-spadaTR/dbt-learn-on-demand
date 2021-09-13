Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices



### Jinja Examples:
{% ... %} --statement
{{ ... }} --expression
{# comments #}

### Jinja Dictionary
{% set person = {
    'name': 'me',
    'number': 3
} %}

{{person.name}}

### Jinja Arrays
{ % set self = ['me', 'myself'] %}

{{self[0]}} --> 'me'


### Jinja Array of dictionaries
{% set us = [
    {
        'name': 'me',
        'number': 3
    },
    {
        'name': 'you',
        'details': 'foo'
    }
]}

{{us[1]['details']}}


### Jinja if-statement
{% set temperature = 80 %}

On a day like this, I especially like

{% if temperature > 70 %}

a refreshing mango sorbet.

{% else %}

a decadent chocolate ice cream.

{% endif %}


### Jinja for-loops
{% set flavors = ['chocolate', 'vanilla', 'strawberry'] %}

{% for flavor in flavors %}

Today I want {{flavor}} ice cream!

{% endfor %}


### Jinja Macro
{% macro hoyquiero(flaor, dessert = 'ice cream') %}

Today I want {{flavor}} {{dessert}}!

{% endmacro %}

{{ hoyquiero(flavor = 'chocolate') }}

{{ hoyquiero('sorbet', 'mango')}}


### Jinja Example1
{% set flavors = ['chocolate', 'vanilla', 'strawberry'] %}

{% for flavor in flavors %}

select '{{flavor}}' f1 from dual {% if not loop.last %} union all {% endif %}

{% endfor %}
