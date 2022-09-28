require 'colorize'
require "Date"
require 'csv'
require_relative "utils.rb"
require_relative "Factory.rb"
require_relative "Filing.rb"
require_relative "aMain.rb"
require_relative "eMain.rb"
require_relative "cMain.rb"
require_relative "Queries.rb"
include Factory
include Utils
include FilingHandler
include Queries
include AMain
include EMain
include CMain
begin
    if ARGV.length==3
        type=ARGV[0]
        date=ARGV[1].split('/')
        folder=ARGV[2]
        if type.include?("-a")
           AMain.aMain(date,folder)
        elsif type.include?("-c")
            CMain.cMain(date,folder)
        elsif type.include?("-e")
            EMain.eMain(date[0],folder)
        else
            raise
                puts "Error!!!"
        end
    else
        raise
            puts "Error!!!"
    end
rescue 
    puts "Error!!!"
end
