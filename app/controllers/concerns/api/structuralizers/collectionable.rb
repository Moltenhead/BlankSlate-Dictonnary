# frozen_string_literal: true

# app/controllers/concerns/api/collactionable.rb

module Concerns
  module Api
    module Structuralizers
      # add query handlers
      module Collectionable
        extend ActiveSupport::Concern

        included do
          include ::Parameters::Querestrict

          # ========================================== #
          # --------------- UTILITIES  --------------- #
          # ========================================== #

          attr_accessor(
            :acceptable_params,
            :regex_default_params,
            :regex_params,
            :valid_operators,
            :included_relationships
          )
          def acceptable_params(arr = [])
            @acceptable_params = arr
          end
          def regex_default_params(arr = [])
            @regex_default_params = arr
          end
          def regex_params(arr = [])
            @regex_params = arr
          end
          def valid_operators(arr = [])
            @valid_operators = arr
          end
          def included_relationships(arr = [])
            @included_relationships = arr
          end

          # %i[
          #   acceptable_params
          #   regex_default_params
          #   regex_params
          #   valid_operators
          #   included_relationships
          # ].each do |method_name|
          #   attr_accessor method_name
          #   define_method(method_name) do |value = []|
          #     instance_variable_set(method_name, value || [])
          #   end
          # end

          # handle query parameters and query operators
          def build_query(other_model = nil)
          # @other_model: when nil use @model, else use passed model
          #   - needed for value type handling
            query = {}

            params.each do |key, value|
              # find parameters beginning by "search_"
              if ((match = key =~ /^search_([\w]*)$/) && (@regex_params.include?(target_key = match[1])) || (@regex_default_params.include?(target_key == key)))
                query[target_key.to_sym] ||= {}
                query[target_key.to_sym][:$regex] = value  # turn it into regex
                params.delete(key)                            # then remove it from parameters
              # handle ids paramter => query for every id passed within array
              elsif [:ids, 'ids'].include?(key) && @acceptable_params.include?('ids')
                query[:id] = { :$in => value }
              end
            end

            model = other_model || @model
            valid_params = restricted_params(model, params)  # slice only valid parameters

            query.merge(valid_params)
          end

          def format_parameter(type, param)
            if %w[ActionController::Parameters Hash].include?(param.class.name)
              param.to_hash.each_with_object({}) do |(sf_k, sf_v), x|
                x[sf_k] = format_value(type, sf_v) if @valid_operators.include?(sf_k)
              end
            else
              format_value(type, param)
            end
          end

          def handle_order_param(val)
            return unless [1, -1, '1', '-1', 'asc', 'desc', :asc, :desc].include?(val)

            val = Integer(val) if ['1', '-1'].include?(val)
            if [1, -1].include? val
              val == 1 ? :asc : :desc
            elsif %w[asc desc].include?(val)
              val.to_sym
            else
              val
            end
          end

          def index_aggregation(target_model: @model)
            return unless target_model

            precision = @query_precision || {}
            precision[:user_id] = params[:responsible] if params[:responsible]
            query = target_model
            query.where(build_query(target_model).deep_merge(precision))
                .order_by(order_params)
                .includes(@include_relationships || [])
          end

          def order_params
            if %w[
              ActionController::Parameters
              Mongoid::Document
              Hash
            ].include?(params.permit![:sort].class.name)
              params.permit![:sort].to_h.each_with_object({}) do |(key, val), h|
                next unless handle_order_param(val)

                h[key] = handle_order_param(val)
              end
            end
          end

          def paginate(aggregation, options = {})
            page = params.permit![:page]&.fetch(:number, nil) || 1
            page_size = params.permit![:page]&.fetch(:size, nil) || 15
            paginated_aggregation = aggregation.skip((Integer(page) - 1) * Integer(page_size)).limit(page_size)

            render(
              json: paginated_aggregation,
              **options
            )
          end

          def restricted_params(model, hash)
            return unless model
            return {} unless hash

            valid_keys = @acceptable_params + [:$and, :$or, :id, '$and', '$or', 'id']
            hash = hash.permit!.slice(*valid_keys)

            hash.to_h.each_with_object({}) do |(key, value), h|
              h[key.to_sym] = if [:$or, :$and, '$or', '$and'].include?(key)
                                value.map do |sub_h|
                                  restricted_params(model, sub_h.slice(*valid_keys))
                                end
                              else
                                next unless model.fields[key].present?

                                field_type = model.fields[key].type.name.demodulize
                                case value.class.name
                                when /(ActionController::Parameters|Hash|Mongoid::Document)/
                                  value.each_with_object({}) do |(sub_key, sub_value), sub_h|
                                    sub_h[sub_key.to_sym] = format_parameter(field_type, sub_value) if @valid_operators.include?(sub_key)
                                  end
                                else
                                  format_parameter(field_type, value) || {:$eq => nil}
                                end
                              end
            end
          end

          # ========================================== #
          # ---------------- ACTIONS  ---------------- #
          # ========================================== #
          def index
            @options ||= {}
            paginate(
              index_aggregation,
              each_serializer: @serializer,
              **@options
            )
          end
        end
      end
    end
  end
end
