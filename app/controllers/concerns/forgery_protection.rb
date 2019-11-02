module ForgeryProtection
  extend ActiveSupport::Concern

  included do
    protect_from_forgery unless: -> { request.format.json? }
  end
end
