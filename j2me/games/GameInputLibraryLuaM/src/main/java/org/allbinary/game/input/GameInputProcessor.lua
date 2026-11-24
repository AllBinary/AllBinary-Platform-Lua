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
-- package org.allbinary.game.input

local GameInputProcessor = {}
package.loaded["org.allbinary.game.input.GameInputProcessor"] = GameInputProcessor

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

local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")

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

-- class table GameInputProcessor is declared before the requires
GameInputProcessor.__index = GameInputProcessor
GameInputProcessor.className = "GameInputProcessor"
GameInputProcessor.javaClassName = "org.allbinary.game.input.GameInputProcessor"


function GameInputProcessor.getInstance()
        return GameInputProcessor.instance_f
end


function GameInputProcessor._jinit(self)
    return self
end

function GameInputProcessor.new(...)
    local self = setmetatable({}, GameInputProcessor)
    GameInputProcessor._jinit(self, ...)
    return self
end


-- throws Exception
function GameInputProcessor:processEvent(allbinaryLayerManager, gameKeyEvent)
end


-- throws Exception
function GameInputProcessor:processReleasedEvent(allbinaryLayerManager, gameKeyEvent)
end


-- throws Exception
function GameInputProcessor:processAnalog(allbinaryLayerManager, gameKeyEvent, analogValue)
end


-- throws Exception
function GameInputProcessor:process(allbinaryLayerManager, keyAsInteger)
end


-- throws Exception
function GameInputProcessor:processReleased(allbinaryLayerManager, keyAsInteger)
end

GameInputProcessor.instance_f = GameInputProcessor.new()

return GameInputProcessor

