CachedSignals = {}
local fs = require("@lune/fs")
local serde = require("@lune/serde")
debugmode = false
token = ""

if fs.isFile("./debug.toml") then
    local FileData = serde.decode("toml", fs.readFile("./debug.toml"))

    debugmode = FileData.Debug or false

    spit = FileData.SpitData
end

return {
    enum = require("@self/enum");

    client = require("@self/Constructors/Client");
    
    events = require("@self/events")
}