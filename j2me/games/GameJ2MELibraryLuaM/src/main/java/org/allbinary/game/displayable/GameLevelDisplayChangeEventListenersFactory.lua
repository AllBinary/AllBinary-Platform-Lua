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

local DisplayChangeEventHandler = require("org.allbinary.graphics.displayable.event.DisplayChangeEventHandler")
local DisplayChangeEventListener = require("org.allbinary.graphics.displayable.event.DisplayChangeEventListener")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameLevelDisplayChangeEventListenersFactory = {}
GameLevelDisplayChangeEventListenersFactory.__index = GameLevelDisplayChangeEventListenersFactory
GameLevelDisplayChangeEventListenersFactory.className = "GameLevelDisplayChangeEventListenersFactory"

function GameLevelDisplayChangeEventListenersFactory:_init_fields()
    self.list = BasicArrayListD.new()
end

function GameLevelDisplayChangeEventListenersFactory.new()
    local self = setmetatable({}, GameLevelDisplayChangeEventListenersFactory)
    self:_init_fields()
    return self
end


function GameLevelDisplayChangeEventListenersFactory.getInstance()
        return GameLevelDisplayChangeEventListenersFactory.instance
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

GameLevelDisplayChangeEventListenersFactory.instance = GameLevelDisplayChangeEventListenersFactory.new()

return GameLevelDisplayChangeEventListenersFactory

