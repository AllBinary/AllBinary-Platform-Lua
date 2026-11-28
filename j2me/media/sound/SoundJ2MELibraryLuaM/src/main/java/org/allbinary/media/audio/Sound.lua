--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.media.audio

local Sound = {}
package.loaded["org.allbinary.media.audio.Sound"] = Sound

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

local Player = java_lazy("javax.microedition.media.Player")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local SoundInterface = require("org.allbinary.media.audio.SoundInterface")
local Runnable = require("java.lang.Runnable")
local NoPlayer = java_lazy("org.allbinary.media.audio.NoPlayer")

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

-- class table Sound is declared before the requires
Sound.__index = Sound
Sound.className = "Sound"
Sound.javaClassName = "org.allbinary.media.audio.Sound"
Sound.java_implements = " SoundInterface Runnable "
Sound.java_interfaces = function() return {SoundInterface, Runnable} end

function Sound:_init_fields()
    if self.resource == nil then self.resource = nil end
    self.player = NoPlayer.NO_PLAYER
end


function Sound._jinit(self, resource)
    Sound._init_fields(self)
        self.resource = resource
    return self
end

function Sound.new(...)
    local self = setmetatable({}, Sound)
    Sound._jinit(self, ...)
    return self
end


function Sound:getResource()
        return self.resource
end


function Sound:getPlayerP()
        return self.player
end


function Sound:setPlayerP(player)
        self.player = player
end


-- throws Exception
function Sound:init()
end


function Sound:getDuration()
        return -1
end


function Sound:run()
        local try_ok, try_error, try_value = pcall(function()
            self.player:start()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.put(commonStrings.EXCEPTION, self, commonStrings.RUN)
        end
end

return Sound

