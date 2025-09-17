local Event = {}

Event.Register = function(signal)
    Event.Signal = signal
end -- added register here so that way I can make event constructors.

Event.Signal = nil

Event.ActiveID = "heartbeat"

return Event