module Phaxion
  module DTO
    class Recipient < Struct.new(:number, :status, :completed_at)
    end
  end
end
