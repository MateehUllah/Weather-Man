module AMain
    def aMain(date,folder)
        begin
            path=createPath(date[0],date[1],folder)+".txt"
            file=FilingHandler::Filing.new(path)
            obj=Factory.getObject("-a")
            obj.setQuery("Max TemperatureC")
            puts "Highest Average:#{obj.Average(file.getTable)}C"
            obj.setQuery("Min TemperatureC")
            puts "Lowest Average:#{obj.Average(file.getTable)}C"
            obj.setQuery(" Mean Humidity")
            puts "Average Humidity:#{obj.Average(file.getTable)}%"
        rescue
            raise "Error"
        end
    end
end