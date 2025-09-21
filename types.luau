
export type Overwrite = {
    id: string,
    type: number,
    allow: string,
    deny: string,
}


export type ThreadMetadata = {
    archived: boolean,
    auto_archive_duration: number,
    archive_timestamp: string,
    locked: boolean,
    invitable: boolean?,
    create_timestamp: string?,
}

export type ThreadMember = {
    id: string?,
    user_id: string?,
    join_timestamp: string,
    flags: number,
}

export type Tag = {
    id: string,
    name: string,
    moderated: boolean,
    emoji_id: string?,
    emoji_name: string?,
}

export type DefaultReaction = {
    emoji_id: string?,
    emoji_name: string?,
}

export type Channel = {
    id: string,
    type: number,
    guild_id: string?,
    position: number?,
    permission_overwrites: {Overwrite}?,
    name: string?,
    topic: string?,
    nsfw: boolean?,
    last_message_id: string?,
    bitrate: number?,
    user_limit: number?,
    rate_limit_per_user: number?,
    recipients: {DiscordUser}?,
    icon: string?,
    owner_id: string?,
    application_id: string?,
    managed: boolean?,
    parent_id: string?,
    last_pin_timestamp: string?,
    rtc_region: string?,
    video_quality_mode: number?,
    message_count: number?,
    member_count: number?,
    thread_metadata: ThreadMetadata?,
    member: ThreadMember?,
    default_auto_archive_duration: number?,
    permissions: string?,
    flags: number?,
    total_message_sent: number?,
    available_tags: {Tag}?,
    applied_tags: {string}?,
    default_reaction_emoji: DefaultReaction?,
    default_thread_rate_limit_per_user: number?,
    default_sort_order: number?,
    default_forum_layout: number?,
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


export type AvatarDecorationData = {
	asset: string,
	sku_id: string,
}

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



export type GateWay<data> = {
    op:string;
    d:data;
    s:number;
    t:string
}

export type Hello = GateWay<{heartbeat_interval:number}>

export type MessageGate = Message & {
    guild_id:string?;
    member:DiscordUser?;
    mentions:{DiscordUser}
}



export type EmbedFooter = {
	title: string,
	icon_url: string?,
	proxy_icon_url: string?,
}

export type EmbedMedia = {
	url: string?,
	proxy_url: string?,
	height: number?,
	width: number?,
}

export type EmbedThumbnail = EmbedMedia
export type EmbedImage = EmbedMedia
export type EmbedVideo = {
	url: string?,
	proxy_url: string?,
	height: number?,
	width: number?,
}

export type EmbedProvider = {
	name: string?,
	url: string?,
}

export type EmbedAuthor = {
	name: string?,
	url: string?,
	icon_url: string?,
	proxy_icon_url: string?,
}

export type EmbedField = {
	name: string,
	value: string,
	inline: boolean?,
}

export type EmbedType = "rich" | "image" | "video" | "gifv" | "article" | "link"

export type Embed = {
	title: string?,
	type: EmbedType?, 
	description: string?,
	url: string?,
	timestamp: string?,
	color: number?,


	footer: EmbedFooter?,
	image: EmbedImage?,
	thumbnail: EmbedThumbnail?,
	video: EmbedVideo?,
	provider: EmbedProvider?,
	author: EmbedAuthor?,

	fields: { EmbedField }?,
}

export type ChannelMention = {
    guild_id:string;
    type:number;
    name:string
}

export type Attachment = {
	id: string,
	filename: string,
	title: string?,
	description: string?,
	content_type: string?,
	size: number,
	url: string,
	proxy_url: string,
	height: number?,
	width: number?,
	ephemeral: boolean?,
	duration_secs: number?,
	waveform: string?,
	flags: number?,
}

export type CountDetail = {
    burst:number;
    normal:number
}

export type Emoji = {
    id:string;
    name:string;
    roles:{};
    user:DiscordUser;
    require_colons:boolean;
    managed:boolean;
    animated:boolean;
    available:boolean
}

export type Reaction = {
    count:number;
    count_details:CountDetail;
    me:boolean;
    me_burst:boolean;
    burst_colors:{string};
    emoji:Emoji
}

export type MessageActivity = {
    type:number;
    party_id:string
}

export type PartialApplication = {

}

export type MessageReference = {

}

export type MessageSnapshot = {

}

export type MessageInteractionMetadata = {

}

export type MessageComponent = {

}

export type MessageStickerItem = {

}

export type RoleSubscriptionData = {

}

export type ResolvedData = {

}

export type Poll = {

}

export type MessageCall = {

}

export type Message = {
    id: string,
    channel_id: string,
    author: DiscordUser,
    content: string,
    timestamp: string,
    edited_timestamp: string?,
    tts: boolean,
    mention_everyone: boolean,
    mentions: {DiscordUser},
    mention_roles: {string},
    mention_channels: {ChannelMention}?,
    attachments: {Attachment},
    embeds: {Embed},
    reactions: {Reaction}?,
    nonce: (number | string)?,
    pinned: boolean,
    webhook_id: string?,
    type: number,
    activity: MessageActivity?,
    application: PartialApplication?,
    application_id: string?,
    flags: number?,
    message_reference: MessageReference?,
    message_snapshots: {MessageSnapshot}?,
    referenced_message: Message?,
    interaction_metadata: MessageInteractionMetadata?,
    thread: Channel?,
    components: {MessageComponent}?,
    sticker_items: {MessageStickerItem}?,
    position: number?,
    role_subscription_data: RoleSubscriptionData?,
    resolved: ResolvedData?,
    poll: Poll?,
    call: MessageCall?,
}


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


return true