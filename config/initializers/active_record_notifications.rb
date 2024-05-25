# config/initializers/active_record_notifications.rb
# ActiveSupport::Notifications.subscribe("sql.active_record") do |name, started, finished, unique_id, data|
#   if data[:sql] =~ /SELECT \[users\]/
#     Rails.logger.info "User SQL Query: #{data[:sql]}"
#     Rails.logger.info "Stack Trace:"
#     Rails.logger.info caller.select { |line| line.include?(Rails.root.to_s) }.join("\n")
#   end
# end
