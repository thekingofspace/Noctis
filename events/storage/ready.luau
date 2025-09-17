local Event = {}
local types = require("../../types")

Event.Register = function(signal:types.Signal)
    Event.Signal = signal
    signal:AddConstructor(function(olddata)
        return olddata.user
    end)
end


Event.Signal = nil

Event.ActiveID = "READY"

return Event