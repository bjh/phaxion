module Phaxion
  module DTO
    class PhoneNumber < Struct.new(:number, :city, :state, :cost, :last_billed_at, :provisioned_at)
    end
  end
end
