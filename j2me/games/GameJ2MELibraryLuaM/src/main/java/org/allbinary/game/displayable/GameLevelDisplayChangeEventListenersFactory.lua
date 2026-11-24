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
-- package org.allbinary.game.displayable

local GameLevelDisplayChangeEventListenersFactory = {}
package.loaded["org.allbinary.game.displayable.GameLevelDisplayChangeEventListenersFactory"] = GameLevelDisplayChangeEventListenersFactory

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

local DisplayChangeEventHandler = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEventHandler")
local DisplayChangeEventListener = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEventListener")
local BasicEventHandler = java_lazy("org.allbinary.logic.util.event.handler.BasicEventHandler")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table GameLevelDisplayChangeEventListenersFactory is declared before the requires
GameLevelDisplayChangeEventListenersFactory.__index = GameLevelDisplayChangeEventListenersFactory
GameLevelDisplayChangeEventListenersFactory.className = "GameLevelDisplayChangeEventListenersFactory"
GameLevelDisplayChangeEventListenersFactory.javaClassName = "org.allbinary.game.displayable.GameLevelDisplayChangeEventListenersFactory"

function GameLevelDisplayChangeEventListenersFactory:_init_fields()
    self.list = BasicArrayListD.new()
end

function GameLevelDisplayChangeEventListenersFactory._jinit(self)
    GameLevelDisplayChangeEventListenersFactory._init_fields(self)
    return self
end

function GameLevelDisplayChangeEventListenersFactory.new()
    return GameLevelDisplayChangeEventListenersFactory._jinit(setmetatable({}, GameLevelDisplayChangeEventListenersFactory))
end


function GameLevelDisplayChangeEventListenersFactory.getInstance()
        return GameLevelDisplayChangeEventListenersFactory.instance_f
end


function GameLevelDisplayChangeEventListenersFactory:add(displayChangeEventListener)
        self.list:add(displayChangeEventListener)
        DisplayChangeEventHandler.getInstance():addListenerInterface(displayChangeEventListener)
end


function GameLevelDisplayChangeEventListenersFactory:clear()
        local displayChangeEventHandler = DisplayChangeEventHandler.getInstance()
        local displayChangeEventListener = nil
        do
            local index = self.list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            displayChangeEventListener = self.list.objectArray[index + 1]
            displayChangeEventHandler:removeListener(displayChangeEventListener)
            end
        end
        self.list:clear()
end

GameLevelDisplayChangeEventListenersFactory.instance_f = GameLevelDisplayChangeEventListenersFactory.new()

return GameLevelDisplayChangeEventListenersFactory

