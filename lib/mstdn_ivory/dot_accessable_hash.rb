module MstdnIvory
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
