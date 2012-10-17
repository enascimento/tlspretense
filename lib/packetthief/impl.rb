module PacketThief
  # PacketThief implementations. Each one contains the implementation details
  # for working with a given firewall.
  module Impl
    autoload :Manual,     'packetthief/impl/manual'
    autoload :Netfilter,  'packetthief/impl/netfilter'
    autoload :Ipfw,       'packetthief/impl/ipfw'
    autoload :PFDivert,         'packetthief/impl/pf_divert'
  end
end