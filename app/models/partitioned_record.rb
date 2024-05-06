# frozen_string_literal: true

# Modify ActiveRecord models with a partitioned behaviour
class PartitionedRecord < ApplicationRecord
  self.abstract_class = true

  default_scope do
    partition = Thread.current[:location]

    if partition.present? && model.partitioned?
      from("#{table_name} PARTITION (p#{partition})")
    else
      all
    end
  end

  def self.partitioned?
    connection.execute("SHOW CREATE TABLE #{table_name}").to_a.first[1].include?('PARTITION BY')
  end

  scope :site, ->(site_id) { from("#{table_name} PARTITION (p#{site_id})") }
end
