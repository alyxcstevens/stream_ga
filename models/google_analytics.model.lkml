connection: "stream_snowflake"

# include all the views
include: "/views/**/*.view"

datagroup: google_analytics_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: google_analytics_default_datagroup

explore: fivetran_audit {}

explore: googleanalytics_test_1_adwordscampaign {}

explore: googleanalytics_test_1_channeltraffic {}
