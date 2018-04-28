module MstdnIvory
  # This class inherit hash.
  # The value is accessed by key name method:
  #   dah = DotAccessableHash.new
  #   dah['strkey'] = 'strvalue'
  #   dah[:symkey] = :symkey
  #   dah.strkey # => "strvalue"
  #   dah.symkey # => :symkey
  class DotAccessableHash < Hash
    def method_missing(name)
      super unless self.has_key?(name) || self.has_key?(name.to_s)
      self[name.to_s] || self[name]
    end

    def respond_to_missing?(name)
      return self.has_key?(name) || self.has_key?(name.to_s)
    end
  end
end
