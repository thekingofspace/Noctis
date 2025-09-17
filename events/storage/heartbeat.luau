local Event = {}

Event.Register = function(signal)
    Event.Signal = signal
end

Event.Signal = nil

Event.ActiveID = "heartbeat"

return Event