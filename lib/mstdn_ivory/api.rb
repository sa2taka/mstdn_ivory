require 'mstdn_ivory/register'
require 'mstdn_ivory/request'
require 'mstdn_ivory/rest'

module MstdnIvory
  module Api
    include MstdnIvory::Register
    include MstdnIvory::Request
    include MstdnIvory::Rest
  end
end
