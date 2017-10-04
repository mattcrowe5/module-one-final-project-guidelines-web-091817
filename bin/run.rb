require_relative '../config/environment'
ActiveRecord::Base.logger.level = 1 
CLI.new.start_program
