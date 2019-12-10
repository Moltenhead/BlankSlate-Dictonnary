# frozen_string_literal: true

module Assets
  module Parameters
    module HandleSort
      def handle_sort sort_h
        sort_result = sort_h.each_with_object({}) { |(key, val), h|
          h[key.to_sym] = ["Integer", "Number", "String"].include?(val.class.name) ?
            if val.to_i != 0; val.to_i end :
            val }
        if hashes = sort_result.select { |key, val| ["Parameters", "Hash", "Document"].include?(val.class.name.demodulize) }
          inter_h = {}
          order_map = hashes.map { |key, val| val["order"] && val["order"].to_i }.compact
          order_map.present? && (order_map.min..order_map.max).each do |i|
            if selected = hashes.find { |key, val| val["order"] && val["order"].to_i == i }
              inter_h[selected.first] = selected[1]["value"].to_i if selected[1]["value"].to_i != 0
            end
          end
          sort_result = sort_result.select { |key, val|
            ["Integer", "Number", "String"].include?(val.class.name) }.each_with_object(inter_h) { |(key, val), h|
              h[key] = val }
        end
        sort_result
      end
    end
  end
end
