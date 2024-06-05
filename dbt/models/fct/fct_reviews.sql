{{
  config(
    materialized = 'incremental',
    on_schema_change ='fail'
    )
}}

WITH src_reviews AS (
    SELECT 
    * 
    FROM {{ ref('src_reviews') }}
)
SELECT 
* 
FROM src_reviews WHERE review_comments IS NOT NULL
{% if is_incremental() %}
  AND review_date >= coalesce((select max(review_date) from {{ this }}), '1900-01-01')
{% endif %}