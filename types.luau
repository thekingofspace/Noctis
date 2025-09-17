export type Connection = {
    Callback: (...any) -> (),
    IsConnected: boolean,
    Disconnect: (self: Connection) -> (),
}

export type Signal = {
    Connect: (self: Signal, Callback: (...any) -> ()) -> Connection,
    ConnectAsync: (self: Signal, Callback: (...any) -> ()) -> Connection,
    Wait: (self: Signal, timeout: number?) -> ...any,
    Fire: (self: Signal, ...any) -> (),
    Destroy: (self:Signal) -> nil,
    AddConstructor: (self:Signal ,Callback: (...any) -> ...any) -> nil
}

export type ReadOnlySignal<T...> = {
    Connect: (self: ReadOnlySignal<T...>, callback: (T...) -> ()) -> Connection,
    ConnectAsync: (self: ReadOnlySignal<T...>, callback: (T...) -> ()) -> Connection,
    Wait: (self: ReadOnlySignal<T...>, timeout: number?) -> (T...),
}

export type GateWay<data> = {
    op:string;
    d:data;
    s:number;
    t:string
}

export type Hello = GateWay<{heartbeat_interval:number}>

return true