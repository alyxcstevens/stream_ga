view: googleanalytics_test_1_adwordscampaign {
  sql_table_name: "GOOGLE_ANALYTICS"."GOOGLEANALYTICS_TEST_1_ADWORDSCAMPAIGN"
    ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}."_FIVETRAN_ID" ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."_FIVETRAN_SYNCED" AS TIMESTAMP_NTZ) ;;
  }

  dimension: ad_clicks {
    type: number
    sql: ${TABLE}."AD_CLICKS" ;;
  }

  dimension: ad_cost {
    type: number
    sql: ${TABLE}."AD_COST" ;;
  }

  dimension: adwords_campaign_id {
    type: string
    sql: ${TABLE}."ADWORDS_CAMPAIGN_ID" ;;
  }

  dimension: bounce_rate {
    type: number
    sql: ${TABLE}."BOUNCE_RATE" ;;
  }

  dimension: cpc {
    type: number
    sql: ${TABLE}."CPC" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: goal_completions_all {
    type: number
    sql: ${TABLE}."GOAL_COMPLETIONS_ALL" ;;
  }

  dimension: goal_conversion_rate_all {
    type: number
    sql: ${TABLE}."GOAL_CONVERSION_RATE_ALL" ;;
  }

  dimension: goal_value_all {
    type: number
    sql: ${TABLE}."GOAL_VALUE_ALL" ;;
  }

  dimension: profile {
    type: string
    sql: ${TABLE}."PROFILE" ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}."SESSIONS" ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}."USERS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
