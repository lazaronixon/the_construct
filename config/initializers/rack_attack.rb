if defined? Rack::Attack
  class Rack::Attack
    # You can perform up to 50 requests per 10 seconds period from the same IP address for the same account.
    # If you exceed this limit, you'll get a 429 Too Many Requests response for subsequent requests.
    # Check the Retry-After header to see how many seconds to wait before retrying the request.
    throttle('req/json/ip', limit: 50, period: 10) do |req|
      req.ip if req.path.end_with?('.json')
    end
  end
end
