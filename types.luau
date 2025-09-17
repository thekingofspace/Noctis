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

export type DiscordUser = {
	id: string,
	username: string,
	discriminator: string,
	global_name: string?,
	avatar: string?,
	bot: boolean?,
	system: boolean?,
	mfa_enabled: boolean?,
	banner: string?,
	accent_color: number?,
	locale: string?,
	verified: boolean?,
	email: string?,
	flags: number?,
	premium_type: number?,
	public_flags: number?,
	avatar_decoration_data: AvatarDecorationData?,
	collectibles: Collectibles?,
	primary_guild: UserPrimaryGuild?,
}

export type AvatarDecorationData = {
	asset: string,
	sku_id: string,
}

export type Collectibles = {
	nameplate: Nameplate?,
}

export type Nameplate = {
	sku_id: string,
	asset: string,
	label: string,
	palette: string,
}

export type UserPrimaryGuild = {
	identity_guild_id: string?,
	identity_enabled: boolean?,
	tag: string?,
	badge: string?,
}



return true