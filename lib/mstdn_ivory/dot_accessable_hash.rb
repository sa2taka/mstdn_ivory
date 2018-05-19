module MstdnIvory
  # This class inherit hash.
  # The value is accessed by key name method:
  #   dah = DotAccessableHash.new
  #   dah['strkey'] = 'strvalue'
  #   dah[:symkey] = :symkey
  #   dah.strkey # => "strvalue"
  #   dah.symkey # => :symkey
  class DotAccessableHash < Hash
    def merge(obj)
      super unless obj.kind_of? Hash
      _merge(obj)
    end

    def _merge(obj)
      dah = DotAccessableHash.new
      obj.each do |key, value|
        dah[key] = value.kind_of?(Hash) ? _merge(value) : value
      end
      dah
    end

    def method_missing(name)
      super unless self.has_key?(name) || self.has_key?(name.to_s)
      self[name.to_s] || self[name]
    end

    def respond_to_missing?(name)
      return self.has_key?(name) || self.has_key?(name.to_s)
    end
  end
end
