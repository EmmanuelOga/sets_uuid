module SetsUUID
  module ClassMethods

    # Call it on ActiveRecord class definition body:
    #
    # sets_uuid :before_create, :attribute_name => :uuid_format.
    #
    # uuid_format is one of the formats available from uuid gem:
    # :compact, :urn, :default.
    #
    # Inspect UUID::FORMATS for the complete list.
    #
    def sets_uuid(callback_name, attributes_and_formats_hash)
      require 'uuid'

      raise ArgumentError, "attributes_and_formats_hash does not act as a Hash!" unless attributes_and_formats_hash.respond_to?(:each)

      attributes_and_formats_hash.each do |attribute, format|

        meth = "__generate_uuid_for_#{ attribute }".intern

        define_method(meth) { write_attribute(attribute, UUID.new.generate(format)) }

        send(callback_name, meth)
      end
    end

  end
end

ActiveRecord::Base.extend(SetsUUID::ClassMethods)
