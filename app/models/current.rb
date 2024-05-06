# frozen_string_literal: true

class Current < ActiveSupport::CurrentAttribute
  attribute :session
  delegete :user, to: :session, allow_nil: true
end
