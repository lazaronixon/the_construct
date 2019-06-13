class ApplicationController < ActionController::Base
  include ForgeryProtection
  include SetPlatform
end
