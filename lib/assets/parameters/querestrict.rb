# frozen_string_literal: true

module Assets
  module Parameters
    module Querestrict
      # require_relative "./handle_nil"
      include Assets::Parameters::HandleNil

      def handle_cast(value, type_cast)
        return nil if handle_nil(value).nil?

        value.send(type_cast)
      end

      def cast_to_datetime(date)
        return if handle_nil(date).nil?

        DateTime.parse(date) rescue nil
      end

      def type_to_type_cast_name(type)
        case type
        when /Number|Float|Integer/
          if (type == 'Number' && val =~ /[0-9](\.|,)[0-9]/) ||
             type == 'Float'
            'to_f'
          else
            'to_i'
          end
        when 'String'
          'to_s'
        when 'Boolean'
          'to_bool'
        end
      end

      def format_value(type, val)
        type_cast = type_to_type_cast_name(type)

        if type_cast.present?
          if %w[Number Integer Float String Boolean].include?(type)
            case val.class.name.demodulize
            when 'Array'
              val.map { |x| handle_cast(x, type_cast) }
            else
              handle_cast(val, type_cast)
            end
          end
        elsif type =~ /(Date|DateTime|Time)/
          if val.is_a?(Array)
            val.map { |x| cast_to_datetime(x) }
          else
            cast_to_datetime(val)
          end
        else
          val
        end
      end
    end
  end
end
