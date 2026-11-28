-- Generated Code Do Not Modify
-- package org.allbinary.media.audio.music

local BaseMusicService = {}
package.loaded["org.allbinary.media.audio.music.BaseMusicService"] = BaseMusicService

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local Service = require("android.app.Service")
local Intent = java_lazy("android.content.Intent")
local MediaPlayer = java_lazy("android.media.MediaPlayer")
local IBinder = java_lazy("android.os.IBinder")
local NullAndroidCanvas = java_lazy("org.allbinary.android.NullAndroidCanvas")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStateStrings = java_lazy("org.allbinary.string.CommonStateStrings")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ARunnable = require("org.allbinary.thread.ARunnable")
local MusicStrings = java_lazy("org.allbinary.media.audio.music.MusicStrings")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

-- class table BaseMusicService is declared before the requires
BaseMusicService.__index = BaseMusicService
BaseMusicService.className = "BaseMusicService"
BaseMusicService.javaClassName = "org.allbinary.media.audio.music.BaseMusicService"
setmetatable(BaseMusicService, {__index = Service})
--A member class instead of a local class using the method's player and intent since most of the converted languages do not have local classes.
    local MusicRunnable = {}
    MusicRunnable.__index = MusicRunnable
    MusicRunnable.className = "MusicRunnable"
    MusicRunnable.javaClassName = "org.allbinary.media.audio.music.BaseMusicService$MusicRunnable"
    setmetatable(MusicRunnable, {__index = ARunnable})
    BaseMusicService.MusicRunnable = MusicRunnable

    function MusicRunnable:_init_fields()
        if self.baseMusicService == nil then self.baseMusicService = nil end
        if self.player == nil then self.player = nil end
        if self.intent == nil then self.intent = nil end
    end
    

    function MusicRunnable._jinit(self, baseMusicService, player, intent)
        java_super_init(ARunnable, self)
        MusicRunnable._init_fields(self)
            self.baseMusicService = baseMusicService
            self.player = player
            self.intent = intent
        return self
    end

    function MusicRunnable.new(...)
        local self = setmetatable({}, MusicRunnable)
        MusicRunnable._jinit(self, ...)
        return self
    end
    

    function MusicRunnable:run()
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            local commonStateStrings = CommonStateStrings.getInstance()
            local try_ok, try_error, try_value = pcall(function()
                while self.player:isPlaying() do
                    logUtil:putF(self.baseMusicService.WAITING_FOR_MUSIC_TO_END, self, commonStateStrings.ON_START_COMMAND)
                    require("java.lang.Thread").sleep(1200)
                end
                self.baseMusicService:onStartCommandIntent(self.intent)
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                logUtil:put(commonStrings.EXCEPTION, self, commonStateStrings.ON_START_COMMAND, e)
            end
    end
    java_overload(MusicRunnable, "run", 0)


function BaseMusicService:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonStateStrings = CommonStateStrings.getInstance()
    self.ALREADY_PLAYING = "This is one song per music service"
    self.WAITING_FOR_MUSIC_TO_END = "Waiting for music to end"
    self.player = NullAndroidCanvas.NULL_MEDIA_PLAYER
    self.songId = -1
    self.leftVolume = -1
    self.rightVolume = -1
end

function BaseMusicService._jinit(self)
    java_super_init(Service, self)
    BaseMusicService._init_fields(self)
    return self
end

function BaseMusicService.new()
    return BaseMusicService._jinit(setmetatable({}, BaseMusicService))
end


function BaseMusicService:onBind(intent)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.BIND)
        return nil
end
java_overload(BaseMusicService, "onBind", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Intent")) end)


function BaseMusicService:onCreate()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.CREATE)
end
java_overload(BaseMusicService, "onCreate", 0)


function BaseMusicService:onDestroy()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.DESTROY)
        if not rawequal(self.player, NullAndroidCanvas.NULL_MEDIA_PLAYER) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.PAUSE)
            self.player:stop()
            self.player:reset()
            self.player:release()
        end
end
java_overload(BaseMusicService, "onDestroy", 0)


function BaseMusicService:pause()
        if not rawequal(self.player, NullAndroidCanvas.NULL_MEDIA_PLAYER) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.PAUSE)
            self.player:pause()
        end
end
java_overload(BaseMusicService, "pause", 0)


function BaseMusicService:resume()
        if not rawequal(self.player, NullAndroidCanvas.NULL_MEDIA_PLAYER) and not (self.player:isPlaying()) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.RESUME)
            self.player:start()
        end
end
java_overload(BaseMusicService, "resume", 0)


function BaseMusicService:start()
        self.player = MediaPlayer.create(self, self.songId)
        self.player:setVolume(((self.leftVolume + 0.0)) / 100.0, ((self.rightVolume + 0.0)) / 100.0)
        self.player:setLooping(false)
        self.player:start()
end
java_overload(BaseMusicService, "start", 0)


function BaseMusicService:onStart(intent, startid)
        self:onStartCommandIntent(intent)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.START)
end
java_overload(BaseMusicService, "onStart", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "Intent")) and type(java_a2) == "number" end)


function BaseMusicService:onStartCommand(intent, flags, startId)
        self:onStartCommandIntent(intent)
        return Service.START_STICKY
end
java_overload(BaseMusicService, "onStartCommand", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Intent")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function BaseMusicService:onStartCommandIntent(intent)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.ON_START_COMMAND)
        local musicStrings = MusicStrings.getInstance()
        if not rawequal(intent, nil) then
            local command = intent:getIntExtra(self.commonStateStrings.ON_START_COMMAND, -1)
            self.logUtil:putF(CommonLabels.getInstance().COMMAND_LABEL + command, self, self.commonStateStrings.ON_START_COMMAND)
            if rawequal(command, 1) then
                self:pause()
                return
            elseif rawequal(command, 2) then
                self:resume()
                return
            else
                self.songId = intent:getIntExtra(musicStrings.SONG_EXTRA, -1)
                self.leftVolume = intent:getIntExtra(musicStrings.LEFT_VOLUME, -1)
                self.rightVolume = intent:getIntExtra(musicStrings.RIGHT_VOLUME, -1)
            end
        else
            error(require("java.lang.RuntimeException").new("Started service without intent"), 0)
        end
        if not rawequal(self.songId, -1) then
            collectgarbage()
            if not rawequal(self.player, NullAndroidCanvas.NULL_MEDIA_PLAYER) and self.player:isPlaying() then
                local player = self.player
                self.logUtil:putF(self.ALREADY_PLAYING, self, self.commonStateStrings.ON_START_COMMAND)
                local runnable = MusicRunnable.new(self, player, intent)
                local thread = require("java.lang.Thread").new(runnable)
                thread:start()
                return
            end
            self:start()
        end
end
java_overload(BaseMusicService, "onStartCommandIntent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Intent")) end)

return BaseMusicService

