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
    type: number
    sql: ${TABLE}."AVG_SESSION_DURATION" ;;
  }

  dimension: bounce_rate {
    type: number
    sql: ${TABLE}."BOUNCE_RATE" ;;
  }

  dimension: channel_grouping {
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

  dimension: new_users {
    type: number
    sql: ${TABLE}."NEW_USERS" ;;
  }

  dimension: pageviews_per_session {
    type: number
    sql: ${TABLE}."PAGEVIEWS_PER_SESSION" ;;
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

  dimension: users {
    type: number
    sql: ${TABLE}."USERS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
