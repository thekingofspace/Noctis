local module = {}
local gate = "wss://gateway.discord.gg/?v=10&encoding=json"
local net = require("@lune/net")
local task = require("@lune/task")
local serde = require("@lune/serde")
local types = require("../types")

function module.new(Token:string, Intents:{number})
    local self = setmetatable({}, {})

    self._intent = 0
    self._alive = false

    for I, item in ipairs(Intents) do
        self._intent += item
    end

    self._token = Token

    self._lastSequence = 0

    self._heartbeat = 0

    self._threads = {}

    self.StartTime = 0

    function self:_AddThread(Thread)
        table.insert(self._threads, Thread)
    end

    function self:_KillThread()
        for I, item in ipairs(self._threads) do
            task.cancel(item)
        end

        table.clear(self._threads)
    end

    function self:Start()
        token = token
        if self._alive == true then
            return
        end

        self._socket = net.socket(gate)

        self._alive = true
        local Identifier = {
            op = 2;
            d = {
                token = self._token;
                intents = self._intent;
                properties = {
                    os = "linux";
                    browser = "Noctis";
                    device = "Noctis"
                }
            }
        }

        self._socket:send(serde.encode("json", Identifier))

        local NextPacket:types.Hello =  serde.decode("json", self._socket:next())

        self._heartbeat = NextPacket.d.heartbeat_interval / 1000

        self:_AddThread(task.spawn(function()
            while true do
                local Packet:types.GateWay<any> = serde.decode("json", self._socket:next())

                if Packet.s then
                    self._lastSequence = Packet.s
                end

                if Packet.t then
                    local Cache = CachedSignals[Packet.t] or CachedSignals[Packet.t:lower()]

                    if debugmode == true and not Cache then
                        print(Packet.t)

                        if spit ~= nil and table.find(spit, Packet.t) then
                            print(Packet.d)
                        end
                    end

                    if Cache then
                        Cache.Signal:Fire(Packet.d)
                    end
                end
            end
        end))

        self:_AddThread(task.spawn(function()
            while true do
                task.wait(self._heartbeat)

                self._socket:send(serde.encode("json", {
                    op = 1;
                    d = self._lastSequence
                }))

                if CachedSignals["heartbeat"] then
                    CachedSignals["heartbeat"].Signal:Fire(os.time() - self.StartTime)
                end
            end
        end))

        self.StartTime = os.time()
    end

    function self:Stop()
        if self._alive  == false then
            return
        end
        self._alive = false
        self._socket:close()
        self._socket = nil
        self:_KillThread()
        token = ""

        if CachedSignals["stopped"] then
            CachedSignals["stopped"].Signal:Fire(os.time() - self.StartTime)
        end
    end

    self.__index = self


    return self
end

return module