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
-- package org.allbinary.media.audio.music

local MusicManagerFactory = {}
package.loaded["org.allbinary.media.audio.music.MusicManagerFactory"] = MusicManagerFactory

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local MusicManager = java_lazy("org.allbinary.media.audio.music.MusicManager")
local MusicService = java_lazy("org.allbinary.media.audio.music.MusicService")

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

-- class table MusicManagerFactory is declared before the requires
MusicManagerFactory.__index = MusicManagerFactory
MusicManagerFactory.className = "MusicManagerFactory"
MusicManagerFactory.javaClassName = "org.allbinary.media.audio.music.MusicManagerFactory"

function MusicManagerFactory._jinit(self)
    return self
end

function MusicManagerFactory.new()
    return MusicManagerFactory._jinit(setmetatable({}, MusicManagerFactory))
end


function MusicManagerFactory.createMusicManager(soundList)
        return MusicManager.new(MusicService, soundList)
end

return MusicManagerFactory

