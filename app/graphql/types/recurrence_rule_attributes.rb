class Types::RecurrenceRuleAttributes < Types::BaseInputObject
  description "Attributes for creating or updating a RecurrenceRule"
  argument :id, ID, required: false
  argument :recurrence_group_id, Integer, required: false
  argument :begin_day, String, required: false
  argument :end_day, String, required: false
  argument :start_time, String, required: false
  argument :end_time, String, required: false
end
