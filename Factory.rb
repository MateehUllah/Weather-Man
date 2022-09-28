module Factory
    def getObject(type)
        if(type.include?("-a"))
            return Queries::AQuery.new("")
        elsif(type.include?("-c"))
            return Queries::CQuery.new("")
        elsif(type.include?("-e"))
            return Queries::EQuery.new("")
        else
             raise "Invalid"
        end
    end
end