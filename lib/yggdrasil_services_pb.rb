# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: yggdrasil.proto for package 'yggdrasil'

require 'grpc'
require 'yggdrasil_pb'

module Yggdrasil
  module Dispatcher
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'yggdrasil.Dispatcher'

      # Register is called by a worker to indicate it is ready and capable of
      # handling the specified type of work.
      rpc :Register, ::Yggdrasil::RegistrationRequest, ::Yggdrasil::RegistrationResponse
      # Send is called by a worker to send data to the dispatcher.
      rpc :Send, ::Yggdrasil::Data, ::Yggdrasil::Receipt
    end

    Stub = Service.rpc_stub_class
  end
  module Worker
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'yggdrasil.Worker'

      # Send is called by the dispatcher to send data to a worker.
      rpc :Send, ::Yggdrasil::Data, ::Yggdrasil::Receipt
    end

    Stub = Service.rpc_stub_class
  end
end