# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
# frozen_string_literal: true

module Api
  module V1
    # This is locations Controller
    class LocationsController < ApplicationController
      # Fetch all available locations in the cumulative dump
      def index
        with_cohort = params.key?(:with_cohort) ? params[:with_cohort] : false
        start_date = params.key?(:start_date) ? params[:start_date] : nil
        end_date = params.key?(:end_date) ? params[:end_date] : nil

        ids = []

        if with_cohort
          raise ArgumentError, 'start_date and end_date are required' if start_date.nil? || end_date.nil?

          results = ActiveRecord::Base.connection.select_all <<~SQL
            SELECT site_id
            FROM cdr_temp_cohort_status
            WHERE start_date = '#{start_date}'
            AND end_date = '#{end_date}'
          SQL
          ids = results.rows.flatten
        else
          ids = Encounter.all.select(:site_id).distinct.map(&:site_id)
        end
        render json: Location.where(location_id: ids)
      end
    end
  end
end

# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
