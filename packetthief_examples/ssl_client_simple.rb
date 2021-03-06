#!/usr/bin/env ruby
# This example just shows how to call the SSLServer class with PacketThief. All
# it does is receive data -- it does not attempt to send data on.
#
# TODO: Make the dest configurable
# TODO: Pull input form stdin

$: << 'lib'

require 'rubygems'
require 'eventmachine'
require 'packetthief' # needs root

Signal.trap('ABRT') do
  puts 'catching abort'
end

log = Logger.new(STDOUT)
log.level = Logger::DEBUG
PacketThief.logger = log

EM.run do

  PacketThief::Handlers::SSLClient.connect('www.isecpartners.com', 443) do |h|
    h.ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE
#    h.ctx.ssl_version = :TLSv1_client

    def h.tls_successful_handshake
      puts @sslsocket.peer_cert_chain.inspect
      close_connection
    end
  end

end
