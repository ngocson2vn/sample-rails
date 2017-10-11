class MyTraceId
  def initialize(app)
    @app = app
  end

  def call(env)
    request_id = env['X-Amzn-Trace-Id']
    Thread.current[:TRACE_ID] = request_id
    @app.call(env)
  ensure
    Thread.current[:TRACE_ID] = ''
  end
end
