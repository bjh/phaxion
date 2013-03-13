module Phaxion
  module DTO
    class Fax < Struct.new(
      :id,
      :direction,
      :num_pages,
      :cost,
      :status,
      :is_test,
      :requested_at,
      # not always present
      :from_number,
      :to_number,
      :recipients,
      :error_type,
      :error_code,
      :completed_at
    )
    end
  end
end
