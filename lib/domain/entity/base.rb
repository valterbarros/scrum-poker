module Domain
  module Entity
    module Base

      def initialize attributes = {}
        check_attrs attributes
      end

      private
      def check_attrs attrs
        return if attrs.nil?

        attrs.each do |k, v|
          instance_variable_set("@#{k}", v) if self.class.method_defined?(k) || self.private_methods.include?(k.to_sym)
        end
      end
    end
  end
end
