require 'mstdn_ivory/register'
require 'mstdn_ivory/request'
require 'mstdn_ivory/rest'
require 'mstdn_ivory/stream'

module MstdnIvory
  module Api
    include MstdnIvory::Register
    include MstdnIvory::Request
    include MstdnIvory::Rest
    include MstdnIvory::Stream
  end
end
