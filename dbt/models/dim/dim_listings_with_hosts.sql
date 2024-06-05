WITH listings AS (
    SELECT
        *
    FROM
        {{ ref('dim_listings_cleaned') }}
),
hosts AS (
    SELECT
    *
    FROM {{ ref('dim_hosts_cleaned') }}
)
SELECT
    listings.listing_id,
    listings.listing_name,
    listings.minimum_nights,
    listings.price,
    listings.host_id,
    hosts.is_superhost AS host_is_superhost,
    listings.created_at,
    GREATEST(listings.updated_at, hosts.updated_at) as updated_at
FROM
    listings
LEFT JOIN hosts ON (listings.host_id = hosts.host_id)