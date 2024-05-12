require 'date'

module Logger
  MyLogs = "./app.log"

  def log_info(message)
    log("INFO", message)
    puts "INFO: #{message}"
  end

  def log_warning(message)
    log("WARNING", message)
    puts "WARNING: #{message}"
  end

  def log_error(message)
    log("ERROR", message)
    puts "ERROR: #{message}"
  end

  def log(log_type, message)
    timestamp = DateTime.now.strftime('%Y-%m-%dT%H:%M:%S%:z')
    log_entry = "#{timestamp} -- #{log_type} -- #{message}\n"
    begin
      File.open(MyLogs, 'a') { |file| file.write(log_entry) }
    rescue StandardError => e
      puts "Error writing to log file: #{e.message}"
    end
  end
end
