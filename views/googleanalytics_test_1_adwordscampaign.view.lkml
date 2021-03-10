view: googleanalytics_test_1_adwordscampaign {
  sql_table_name: "GOOGLE_ANALYTICS"."GOOGLEANALYTICS_TEST_1_ADWORDSCAMPAIGN"
    ;;

  label: "Adwords Campaign"

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
    sql: nullifzero(${TABLE}."BOUNCE_RATE")/100  ;;
    value_format_name: percent_1
    type: number
  }

  dimension: cpc {
    description: "Cost per Click"
    type: number
    sql: ${TABLE}."CPC" ;;
  }

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      date,
      day_of_week,
      month_name,
      hour_of_day,
      week_of_year,
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

  # ========= MEASURES ============

  measure: total_clicks {
    type: sum
    sql: ${ad_clicks} ;;
  }

  measure: average_clicks {
    type: average
    sql: ${ad_clicks} ;;
  }

  measure: total_cost {
    type: sum
    sql: ${ad_cost} ;;
    value_format_name: usd
  }

  measure: average_cost{
    type: average
    sql: ${ad_cost} ;;
    value_format_name: usd
  }

  measure: total_cpc {
    type: sum
    sql: ${cpc} ;;
    value_format_name: usd
  }

  measure: average_cpc {
    type: average
    sql: ${cpc} ;;
    value_format_name: usd
  }

  measure: total_sessions {
    type: sum
    sql: ${sessions} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
