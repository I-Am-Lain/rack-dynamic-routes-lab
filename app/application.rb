class Application

    @@items = []

      
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
    
        if req.path.match(/items/)
            the_item = req.path.split("/items/").last #turn /songs/Sorry into Sorry
            
            item = @@items.find{|i| i.name == the_item}
        
            if item == nil
                resp.write "Item not found"
                resp.status = 400
            else
                resp.write item.price
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish
    end
end
