module CMain
    def cMain(date,folder)
        begin
            path=createPath(date[0],date[1],folder)+".txt"
            file=FilingHandler::Filing.new(path)
            obj=Factory.getObject("-c")
            obj.setQuery("Max TemperatureC")
            maxTemp=obj.getData(file.getTable)
            obj.setQuery("Min TemperatureC")
            minTemp=obj.getData(file.getTable)
            puts "1st Type of Horizontle bar"
            horizontleBar_1(maxTemp,minTemp,date)
            puts "2nd Type of Horizontle bar"
            horizontleBar_2(maxTemp,minTemp,date)
        rescue
            puts "Error"
        end
    end
end