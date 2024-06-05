with  raw_reviews AS (
    SELECT
    *
    FROM {{ source('airbnb', 'reviews') }}
)
SELECT
listing_id,
date AS review_date,
reviewer_name,
comments As review_comments,
sentiment As review_sentiment
from raw_reviews