resource "opensearch_index_template" "logs" {

  depends_on = [
    aws_opensearch_domain_policy.main
  ]

  name = "logs"

  body = jsonencode({

    index_patterns = [
      "logs-*"
    ]

    priority = 100

    template = {

      settings = {

        number_of_shards   = 1
        number_of_replicas = 0
        refresh_interval   = "5s"
      }

      mappings = {

        properties = {

          "@timestamp" = {
            type = "date"
          }

          application = {
            type = "keyword"
          }

          event_type = {
            type = "keyword"
          }

          status = {
            type = "keyword"
          }

          severity = {
            type = "keyword"
          }

          duration_ms = {
            type = "long"
          }

          job_id = {
            type = "keyword"
          }

          job = {
            type = "keyword"
          }

          probe = {
            type = "keyword"
          }

          adapter = {
            type = "keyword"
          }

          devices_imported = {
            type = "integer"
          }

          error = {
            type = "keyword"
          }
        }
      }
    }
  })
}

resource "opensearch_ism_policy" "logs" {

  policy_id = "logs-policy"

  body = jsonencode({

    policy = {

      description = "Delete log indices after 3 hours"

      default_state = "hot"

      states = [

        {
          name = "hot"

          actions = []

          transitions = [
            {
              state_name = "delete"

              conditions = {
                min_index_age = "3h"
              }
            }
          ]
        },

        {
          name = "delete"

          actions = [
            {
              delete = {}
            }
          ]

          transitions = []
        }
      ]

      ism_template = [
        {
          index_patterns = [
            "logs-*"
          ]
          priority = 100
        }
      ]
    }
  })
}