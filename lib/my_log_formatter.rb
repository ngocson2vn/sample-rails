class MyLogFormatter < ::Logger::Formatter
  def call(severity, time, progname, msg)
    message = msg2str(msg)
    message = Thread.current[:TRACE_ID] + " " + msg2str(msg) unless Thread.current[:TRACE_ID].nil?
    Format % [severity[0..0], format_datetime(time), $$, severity, progname, message]
  end
end
