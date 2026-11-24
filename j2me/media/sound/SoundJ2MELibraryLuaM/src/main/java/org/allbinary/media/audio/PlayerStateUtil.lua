-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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

local PlayerStateUtil = {}
package.loaded["org.allbinary.media.audio.PlayerStateUtil"] = PlayerStateUtil

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

-- local Player = require("javax.microedition.media.Player")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table PlayerStateUtil is declared before the requires
PlayerStateUtil.__index = PlayerStateUtil
PlayerStateUtil.className = "PlayerStateUtil"
PlayerStateUtil.javaClassName = "org.allbinary.media.audio.PlayerStateUtil"

function PlayerStateUtil:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.UNREALIZED = "UNREALIZED"
    self.REALIZED = "REALIZED"
    self.PREFETCHED = "PREFETCHED"
    self.STARTED = "STARTED"
    self.CLOSED = "CLOSED"
end

function PlayerStateUtil._jinit(self)
    PlayerStateUtil._init_fields(self)
    return self
end

function PlayerStateUtil.new()
    return PlayerStateUtil._jinit(setmetatable({}, PlayerStateUtil))
end


function PlayerStateUtil.getInstance()
        return PlayerStateUtil.instance_f
end


function PlayerStateUtil:convert(state)
        if state == Player.UNREALIZED then
            return self.UNREALIZED
        elseif state == Player.REALIZED then
            return self.REALIZED
        elseif state == Player.PREFETCHED then
            return self.PREFETCHED
        elseif state == Player.STARTED then
            return self.STARTED
        elseif state == Player.CLOSED then
            return self.CLOSED
        end
        return self.commonStrings.UNKNOWN
end

PlayerStateUtil.instance_f = PlayerStateUtil.new()

return PlayerStateUtil

