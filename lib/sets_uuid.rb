module SetsUUID
  VERSION = "1.0.0"

  module ClassMethods

    # Call it on ActiveRecord class definition body:
    #
    # sets_uuid :before_create, :attribute_name => :uuid_format.
    #
    # uuid_format is one of :compact, :default.
    #
    def sets_uuid(callback_name, attributes_and_formats_hash)
      require 'simple_uuid'

      raise ArgumentError, "attributes_and_formats_hash does not act as a Hash!" unless attributes_and_formats_hash.respond_to?(:each)

      attributes_and_formats_hash.each do |attribute, format|

        meth = "__generate_uuid_for_#{ attribute }".intern

        if format == :compact
          implementation = proc { write_attribute(attribute, SimpleUUID::UUID.new.to_guid.gsub(/-/, "")) }
        else
          implementation = proc { write_attribute(attribute, SimpleUUID::UUID.new.to_guid) }
        end

        include(Module.new { define_method(meth, &implementation) })

        send(callback_name, meth)
      end
    end

  end
end

ActiveRecord::Base.extend(SetsUUID::ClassMethods)
