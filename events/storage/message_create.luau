local Event = {}

local types = require("../../types")

Event.Register = function(signal:types.Signal)
    Event.Signal = signal
end 

Event.Signal = nil

Event.ActiveID = "MESSAGE_CREATE"

return Event