-- Generated Code Do Not Modify
-- package org.allbinary.media.audio

local AndroidMediaPlayerWrapperListener = {}
package.loaded["org.allbinary.media.audio.AndroidMediaPlayerWrapperListener"] = AndroidMediaPlayerWrapperListener

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

local PlayerListener = java_lazy("javax.microedition.media.PlayerListener")
local MediaPlayer = java_lazy("android.media.MediaPlayer")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local AndroidMediaPlayerWrapper = java_lazy("org.allbinary.media.audio.AndroidMediaPlayerWrapper")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table AndroidMediaPlayerWrapperListener is declared before the requires
AndroidMediaPlayerWrapperListener.__index = AndroidMediaPlayerWrapperListener
AndroidMediaPlayerWrapperListener.className = "AndroidMediaPlayerWrapperListener"
AndroidMediaPlayerWrapperListener.javaClassName = "org.allbinary.media.audio.AndroidMediaPlayerWrapperListener"
local MediaPlayerOnBufferingUpdateListener = {}
    MediaPlayerOnBufferingUpdateListener.__index = MediaPlayerOnBufferingUpdateListener
    MediaPlayerOnBufferingUpdateListener.className = "MediaPlayerOnBufferingUpdateListener"
    MediaPlayerOnBufferingUpdateListener.javaClassName = "org.allbinary.media.audio.AndroidMediaPlayerWrapperListener$MediaPlayerOnBufferingUpdateListener"
    MediaPlayerOnBufferingUpdateListener.java_implements = " OnBufferingUpdateListener "
    MediaPlayerOnBufferingUpdateListener.java_interfaces = function() return {OnBufferingUpdateListener} end
    AndroidMediaPlayerWrapperListener.MediaPlayerOnBufferingUpdateListener = MediaPlayerOnBufferingUpdateListener

    function MediaPlayerOnBufferingUpdateListener._jinit(self)
        return self
    end

    function MediaPlayerOnBufferingUpdateListener.new()
        return MediaPlayerOnBufferingUpdateListener._jinit(setmetatable({}, MediaPlayerOnBufferingUpdateListener))
    end
    function MediaPlayerOnBufferingUpdateListener.newEnclosed(outer)
        return MediaPlayerOnBufferingUpdateListener._jinit(setmetatable({__javaOuter = outer}, MediaPlayerOnBufferingUpdateListener))
    end
    

    function MediaPlayerOnBufferingUpdateListener:onBufferingUpdate(mediaPlayer, i)
    end

local MediaPlayerOnPreparedListener = {}
    MediaPlayerOnPreparedListener.__index = MediaPlayerOnPreparedListener
    MediaPlayerOnPreparedListener.className = "MediaPlayerOnPreparedListener"
    MediaPlayerOnPreparedListener.javaClassName = "org.allbinary.media.audio.AndroidMediaPlayerWrapperListener$MediaPlayerOnPreparedListener"
    MediaPlayerOnPreparedListener.java_implements = " OnPreparedListener "
    MediaPlayerOnPreparedListener.java_interfaces = function() return {OnPreparedListener} end
    AndroidMediaPlayerWrapperListener.MediaPlayerOnPreparedListener = MediaPlayerOnPreparedListener

    function MediaPlayerOnPreparedListener._jinit(self)
        return self
    end

    function MediaPlayerOnPreparedListener.new()
        return MediaPlayerOnPreparedListener._jinit(setmetatable({}, MediaPlayerOnPreparedListener))
    end
    function MediaPlayerOnPreparedListener.newEnclosed(outer)
        return MediaPlayerOnPreparedListener._jinit(setmetatable({__javaOuter = outer}, MediaPlayerOnPreparedListener))
    end
    

    function MediaPlayerOnPreparedListener:onPrepared(mp)
    end

local MediaPlayerOnErrorListener = {}
    MediaPlayerOnErrorListener.__index = MediaPlayerOnErrorListener
    MediaPlayerOnErrorListener.className = "MediaPlayerOnErrorListener"
    MediaPlayerOnErrorListener.javaClassName = "org.allbinary.media.audio.AndroidMediaPlayerWrapperListener$MediaPlayerOnErrorListener"
    MediaPlayerOnErrorListener.java_implements = " OnErrorListener "
    MediaPlayerOnErrorListener.java_interfaces = function() return {OnErrorListener} end
    AndroidMediaPlayerWrapperListener.MediaPlayerOnErrorListener = MediaPlayerOnErrorListener

    function MediaPlayerOnErrorListener._jinit(self)
        return self
    end

    function MediaPlayerOnErrorListener.new()
        return MediaPlayerOnErrorListener._jinit(setmetatable({}, MediaPlayerOnErrorListener))
    end
    function MediaPlayerOnErrorListener.newEnclosed(outer)
        return MediaPlayerOnErrorListener._jinit(setmetatable({__javaOuter = outer}, MediaPlayerOnErrorListener))
    end
    

    function MediaPlayerOnErrorListener:onError(mp, what, extra)
            return false
    end

local MediaPlayerOnCompletionListener = {}
    MediaPlayerOnCompletionListener.__index = MediaPlayerOnCompletionListener
    MediaPlayerOnCompletionListener.className = "MediaPlayerOnCompletionListener"
    MediaPlayerOnCompletionListener.javaClassName = "org.allbinary.media.audio.AndroidMediaPlayerWrapperListener$MediaPlayerOnCompletionListener"
    MediaPlayerOnCompletionListener.java_implements = " OnCompletionListener "
    MediaPlayerOnCompletionListener.java_interfaces = function() return {OnCompletionListener} end
    AndroidMediaPlayerWrapperListener.MediaPlayerOnCompletionListener = MediaPlayerOnCompletionListener

    function MediaPlayerOnCompletionListener._jinit(self)
        return self
    end

    function MediaPlayerOnCompletionListener.new()
        return MediaPlayerOnCompletionListener._jinit(setmetatable({}, MediaPlayerOnCompletionListener))
    end
    function MediaPlayerOnCompletionListener.newEnclosed(outer)
        return MediaPlayerOnCompletionListener._jinit(setmetatable({__javaOuter = outer}, MediaPlayerOnCompletionListener))
    end
    

    function MediaPlayerOnCompletionListener:onCompletion(mp)
    end

local AndroidMediaPlayerOnBufferingUpdateListener = {}
    AndroidMediaPlayerOnBufferingUpdateListener.__index = AndroidMediaPlayerOnBufferingUpdateListener
    AndroidMediaPlayerOnBufferingUpdateListener.className = "AndroidMediaPlayerOnBufferingUpdateListener"
    AndroidMediaPlayerOnBufferingUpdateListener.javaClassName = "org.allbinary.media.audio.AndroidMediaPlayerWrapperListener$AndroidMediaPlayerOnBufferingUpdateListener"
    setmetatable(AndroidMediaPlayerOnBufferingUpdateListener, {__index = MediaPlayerOnBufferingUpdateListener})
    AndroidMediaPlayerWrapperListener.AndroidMediaPlayerOnBufferingUpdateListener = AndroidMediaPlayerOnBufferingUpdateListener

    function AndroidMediaPlayerOnBufferingUpdateListener:_init_fields()
        self.ON_BUFFERING_UPDATE = "onBufferingUpdate()"
        if self.androidMediaPlayerWrapperListener == nil then self.androidMediaPlayerWrapperListener = nil end
    end
    

    function AndroidMediaPlayerOnBufferingUpdateListener._jinit(self, androidMediaPlayerWrapperListener)
        java_super_init(MediaPlayerOnBufferingUpdateListener, self)
        AndroidMediaPlayerOnBufferingUpdateListener._init_fields(self)
            self.androidMediaPlayerWrapperListener = androidMediaPlayerWrapperListener
        return self
    end

    function AndroidMediaPlayerOnBufferingUpdateListener.new(...)
        local self = setmetatable({}, AndroidMediaPlayerOnBufferingUpdateListener)
        AndroidMediaPlayerOnBufferingUpdateListener._jinit(self, ...)
        return self
    end
        function AndroidMediaPlayerOnBufferingUpdateListener.newEnclosed(outer, ...)
            local self = setmetatable({__javaOuter = outer}, AndroidMediaPlayerOnBufferingUpdateListener)
            AndroidMediaPlayerOnBufferingUpdateListener._jinit(self, ...)
            return self
        end
    

    function AndroidMediaPlayerOnBufferingUpdateListener:onBufferingUpdate(mediaPlayer, i)
            local logUtil = LogUtil.getInstance()
            logUtil:putF(tostring(StringMaker.new():append("Update buffer: "):appendint(i):append("%")), self, self.ON_BUFFERING_UPDATE)
            self.androidMediaPlayerWrapperListener.androidMediaPlayerWrapper:update(PlayerListener.DEVICE_UNAVAILABLE)
    end
    java_overload(AndroidMediaPlayerOnBufferingUpdateListener, "onBufferingUpdate", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "MediaPlayer")) and type(java_a2) == "number" end)

local AndroidMediaPlayerOnPreparedListener = {}
    AndroidMediaPlayerOnPreparedListener.__index = AndroidMediaPlayerOnPreparedListener
    AndroidMediaPlayerOnPreparedListener.className = "AndroidMediaPlayerOnPreparedListener"
    AndroidMediaPlayerOnPreparedListener.javaClassName = "org.allbinary.media.audio.AndroidMediaPlayerWrapperListener$AndroidMediaPlayerOnPreparedListener"
    setmetatable(AndroidMediaPlayerOnPreparedListener, {__index = MediaPlayerOnPreparedListener})
    AndroidMediaPlayerWrapperListener.AndroidMediaPlayerOnPreparedListener = AndroidMediaPlayerOnPreparedListener

    function AndroidMediaPlayerOnPreparedListener:_init_fields()
        self.ON_PREPARE = "onPrepare()"
        if self.androidMediaPlayerWrapperListener == nil then self.androidMediaPlayerWrapperListener = nil end
    end
    

    function AndroidMediaPlayerOnPreparedListener._jinit(self, androidMediaPlayerWrapperListener)
        java_super_init(MediaPlayerOnPreparedListener, self)
        AndroidMediaPlayerOnPreparedListener._init_fields(self)
            self.androidMediaPlayerWrapperListener = androidMediaPlayerWrapperListener
        return self
    end

    function AndroidMediaPlayerOnPreparedListener.new(...)
        local self = setmetatable({}, AndroidMediaPlayerOnPreparedListener)
        AndroidMediaPlayerOnPreparedListener._jinit(self, ...)
        return self
    end
        function AndroidMediaPlayerOnPreparedListener.newEnclosed(outer, ...)
            local self = setmetatable({__javaOuter = outer}, AndroidMediaPlayerOnPreparedListener)
            AndroidMediaPlayerOnPreparedListener._jinit(self, ...)
            return self
        end
    

    function AndroidMediaPlayerOnPreparedListener:onPrepared(mp)
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            logUtil:putF(commonStrings.START, self, self.ON_PREPARE)
            self.androidMediaPlayerWrapperListener.androidMediaPlayerWrapper:update(PlayerListener.DEVICE_AVAILABLE)
    end
    java_overload(AndroidMediaPlayerOnPreparedListener, "onPrepared", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MediaPlayer")) end)

local AndroidMediaPlayerOnErrorListener = {}
    AndroidMediaPlayerOnErrorListener.__index = AndroidMediaPlayerOnErrorListener
    AndroidMediaPlayerOnErrorListener.className = "AndroidMediaPlayerOnErrorListener"
    AndroidMediaPlayerOnErrorListener.javaClassName = "org.allbinary.media.audio.AndroidMediaPlayerWrapperListener$AndroidMediaPlayerOnErrorListener"
    setmetatable(AndroidMediaPlayerOnErrorListener, {__index = MediaPlayerOnErrorListener})
    AndroidMediaPlayerWrapperListener.AndroidMediaPlayerOnErrorListener = AndroidMediaPlayerOnErrorListener

    function AndroidMediaPlayerOnErrorListener:_init_fields()
        self.ON_ERROR = "onError()"
        if self.androidMediaPlayerWrapperListener == nil then self.androidMediaPlayerWrapperListener = nil end
    end
    

    function AndroidMediaPlayerOnErrorListener._jinit(self, androidMediaPlayerWrapperListener)
        java_super_init(MediaPlayerOnErrorListener, self)
        AndroidMediaPlayerOnErrorListener._init_fields(self)
            self.androidMediaPlayerWrapperListener = androidMediaPlayerWrapperListener
        return self
    end

    function AndroidMediaPlayerOnErrorListener.new(...)
        local self = setmetatable({}, AndroidMediaPlayerOnErrorListener)
        AndroidMediaPlayerOnErrorListener._jinit(self, ...)
        return self
    end
        function AndroidMediaPlayerOnErrorListener.newEnclosed(outer, ...)
            local self = setmetatable({__javaOuter = outer}, AndroidMediaPlayerOnErrorListener)
            AndroidMediaPlayerOnErrorListener._jinit(self, ...)
            return self
        end
    

    function AndroidMediaPlayerOnErrorListener:onError(mp, what, extra)
            local logUtil = LogUtil.getInstance()
            logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):append("What: "):appendint(what):append(" Extra: "):appendint(extra)), self, self.ON_ERROR)
            self.androidMediaPlayerWrapperListener.androidMediaPlayerWrapper:update(PlayerListener.ERROR)
            return true
    end
    java_overload(AndroidMediaPlayerOnErrorListener, "onError", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "MediaPlayer")) and type(java_a2) == "number" and type(java_a3) == "number" end)

local AndroidMediaPlayerOnCompletionListener = {}
    AndroidMediaPlayerOnCompletionListener.__index = AndroidMediaPlayerOnCompletionListener
    AndroidMediaPlayerOnCompletionListener.className = "AndroidMediaPlayerOnCompletionListener"
    AndroidMediaPlayerOnCompletionListener.javaClassName = "org.allbinary.media.audio.AndroidMediaPlayerWrapperListener$AndroidMediaPlayerOnCompletionListener"
    setmetatable(AndroidMediaPlayerOnCompletionListener, {__index = MediaPlayerOnCompletionListener})
    AndroidMediaPlayerWrapperListener.AndroidMediaPlayerOnCompletionListener = AndroidMediaPlayerOnCompletionListener

    function AndroidMediaPlayerOnCompletionListener:_init_fields()
        self.ON_COMPLETE = "onComplete()"
        if self.androidMediaPlayerWrapperListener == nil then self.androidMediaPlayerWrapperListener = nil end
    end
    

    function AndroidMediaPlayerOnCompletionListener._jinit(self, androidMediaPlayerWrapperListener)
        java_super_init(MediaPlayerOnCompletionListener, self)
        AndroidMediaPlayerOnCompletionListener._init_fields(self)
            self.androidMediaPlayerWrapperListener = androidMediaPlayerWrapperListener
        return self
    end

    function AndroidMediaPlayerOnCompletionListener.new(...)
        local self = setmetatable({}, AndroidMediaPlayerOnCompletionListener)
        AndroidMediaPlayerOnCompletionListener._jinit(self, ...)
        return self
    end
        function AndroidMediaPlayerOnCompletionListener.newEnclosed(outer, ...)
            local self = setmetatable({__javaOuter = outer}, AndroidMediaPlayerOnCompletionListener)
            AndroidMediaPlayerOnCompletionListener._jinit(self, ...)
            return self
        end
    

    function AndroidMediaPlayerOnCompletionListener:onCompletion(mp)
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            logUtil:putF(commonStrings.START, self, self.ON_COMPLETE)
            self.androidMediaPlayerWrapperListener.androidMediaPlayerWrapper:update(PlayerListener.END_OF_MEDIA)
    end
    java_overload(AndroidMediaPlayerOnCompletionListener, "onCompletion", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MediaPlayer")) end)


function AndroidMediaPlayerWrapperListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.androidMediaPlayerWrapper = AndroidMediaPlayerWrapper.NULL_ANDROID_MEDIA_PLAYER_WRAPPER
    self.mOnBufferingUpdateListener = AndroidMediaPlayerOnBufferingUpdateListener.newEnclosed(self, self)
    self.mOnPreparedListener = AndroidMediaPlayerOnPreparedListener.newEnclosed(self, self)
    self.mOnErrorListener = AndroidMediaPlayerOnErrorListener.newEnclosed(self, self)
    self.mOnCompletionListener = AndroidMediaPlayerOnCompletionListener.newEnclosed(self, self)
end


function AndroidMediaPlayerWrapperListener._jinit(self, androidMediaPlayerWrapper)
    AndroidMediaPlayerWrapperListener._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
            self.androidMediaPlayerWrapper = androidMediaPlayerWrapper
            local mediaPlayer = androidMediaPlayerWrapper:getMediaPlayer()
            mediaPlayer:setOnCompletionListener(self.mOnCompletionListener)
            mediaPlayer:setOnBufferingUpdateListener(self.mOnBufferingUpdateListener)
            mediaPlayer:setOnPreparedListener(self.mOnPreparedListener)
            mediaPlayer:setOnErrorListener(self.mOnErrorListener)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
        end
    return self
end

function AndroidMediaPlayerWrapperListener.new(...)
    local self = setmetatable({}, AndroidMediaPlayerWrapperListener)
    AndroidMediaPlayerWrapperListener._jinit(self, ...)
    return self
end

return AndroidMediaPlayerWrapperListener

