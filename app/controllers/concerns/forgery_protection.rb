module ForgeryProtection
  extend ActiveSupport::Concern

  included do
    protect_from_forgery unless: -> { api_request? }
  end

  private
    def api_request?
      request.format.json?
    end
end
