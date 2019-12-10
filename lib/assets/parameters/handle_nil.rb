module Assets
  module Parameters
    module HandleNil
      def handle_nil val
        val.blank? || ["nil", "null", "undefined"].include?(val) ?
          nil :
          val
      end
    end
  end
end
