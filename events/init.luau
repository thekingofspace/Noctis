local fs = require("@lune/fs")
local MainPath:string = debug.info(1, "s")
local LoadedEvents = {}
local types = require("./types")
local Signal = require("./Vendors/signal")

MainPath:gsub([[\]], "/")

fs.readDir(MainPath .. "/storage")

type Events = {
    heartbeat:types.ReadOnlySignal<number>;
    ready:types.ReadOnlySignal<types.DiscordUser>;
    typing_started:types.ReadOnlySignal<{channel_id:string, timestamp:number, user_id:string}>
}

for I, item in ipairs(fs.readDir(MainPath .. "/storage")) do
    local Register = require("@self/storage/" .. item:gsub(".luau", ""))

    LoadedEvents[item:gsub(".luau", "")] = Register
end

local EventGetter = setmetatable({}, {
    __index = function(self, index:string)
        if LoadedEvents[index].Signal ~= nil then
            return LoadedEvents[index]
        end

        LoadedEvents[index].Register(Signal.CreateSignal())

        CachedSignals[LoadedEvents[index].ActiveID] = LoadedEvents[index]

        return LoadedEvents[index].Signal
    end
})

return EventGetter::Events