require 'rubygems'
require 'json'
require 'logger'

class App
  def call(env)
    req = Rack::Request.new(env)
    @body = {}
    @body.merge!(req.params) unless req.params.empty?
    if req.POST.empty?
      req_body = req.body.read
      begin
        @body.merge!(JSON.parse(req_body)) unless req_body.empty?
      rescue JSON::ParserError => e
        @status_code = 500
        @body.merge!({
          error: "body json parse error",
          path: req.path,
          request_method: req.request_method,
          response_status_code: @status_code
        })
        logger.fatal e.message
        logger.fatal e.backtrace.join("\n")
        return render
      end
    else
      @body.merge!(req.POST)
    end
    sleep @body['response_time'].to_i / 1000 if @body['response_time'] && @body['response_time'].to_i < 10000
    @status_code = @body['response_status_code'] || 200
    @body.merge!({
      path: req.path,
      request_method: req.request_method,
      status_code: @status_code
    })
    render
  end

  def logger
    l = Logger.new($stderr)
    l.level = Logger::DEBUG
    l
  end

  def render()
    logger.info @body
    [@status_code, {'Content-Type' => 'application/json'}, [@body.to_json]]
  end
end
