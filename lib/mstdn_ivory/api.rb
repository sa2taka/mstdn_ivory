require 'mstdn_ivory/register'
require 'mstdn_ivory/request'
module MstdnIvory
  module Api
    include MstdnIvory::Register
    include MstdnIvory::Request
  end
end
