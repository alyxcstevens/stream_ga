view: googleanalytics_test_1_channeltraffic {
  sql_table_name: "GOOGLE_ANALYTICS"."GOOGLEANALYTICS_TEST_1_CHANNELTRAFFIC"
    ;;
label: "Channel Traffic"

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

  dimension: avg_session_duration {
    hidden: yes
    type: number
    sql: ${TABLE}."AVG_SESSION_DURATION" ;;
  }

  measure: average_session_duration {
    type: average
    sql: ${avg_session_duration} ;;
    value_format_name: decimal_1
  }

  dimension: bounce_rate_dim {
    hidden: yes
    type: number
    sql: ${TABLE}."BOUNCE_RATE" ;;
  }

  measure: bounce_rate {
    type: average
    sql: ${bounce_rate_dim}/100 ;;
    value_format_name: percent_1
  }

  dimension: channel {
    type: string
    sql: ${TABLE}."CHANNEL_GROUPING" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      day_of_year,
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

  measure: total_completions {
    type: sum
    sql: ${goal_completions_all} ;;
  }

  dimension: goal_conversion_rate_all {
    hidden: yes
    type: number
    sql: ${TABLE}."GOAL_CONVERSION_RATE_ALL" ;;
  }

  measure: conversion_rate {
    type: average
    sql: ${goal_conversion_rate_all}/100 ;;
    value_format_name: percent_2
    drill_fields: [channel, date_month, conversion_rate]
  }

  dimension: goal_value_all {
    type: number
    sql: ${TABLE}."GOAL_VALUE_ALL" ;;
  }

  dimension: new_users {
    type: number
    sql: ${TABLE}."NEW_USERS" ;;
  }

  measure: total_new_users {
    type: sum
    sql: ${new_users} ;;
  }

  dimension: pageviews_per_session {
    type: number
    sql: ${TABLE}."PAGEVIEWS_PER_SESSION" ;;
  }

  measure: average_pageviews_per_session {
    type: average
    sql: ${pageviews_per_session} ;;
    value_format_name: decimal_1
  }

  measure: total_pageviews {
    type: sum
    sql: ${pageviews_per_session} ;;
  }


  dimension: percent_new_sessions {
    type: number
    sql: ${TABLE}."PERCENT_NEW_SESSIONS" ;;
  }

  dimension: profile {
    type: string
    sql: ${TABLE}."PROFILE" ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}."SESSIONS" ;;
  }

  measure: total_sessions {
    type: sum
    sql:  ${sessions} ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}."USERS" ;;
  }

  measure: total_users {
    type: sum
    sql: ${users} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
