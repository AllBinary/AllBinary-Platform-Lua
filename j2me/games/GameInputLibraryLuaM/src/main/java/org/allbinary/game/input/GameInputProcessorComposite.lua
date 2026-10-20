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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local PlayerGameInput = require("org.allbinary.game.input.PlayerGameInput")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameInputProcessorComposite = {}
GameInputProcessorComposite.__index = GameInputProcessorComposite
GameInputProcessorComposite.className = "GameInputProcessorComposite"
setmetatable(GameInputProcessorComposite, {__index = PlayerGameInput})

function GameInputProcessorComposite:_init_fields()
    self.name = nil
    self.gameInputProcessorInterface = nil
    self.NAME_LABEL = " GameInputProcessorInterface: "
end


function GameInputProcessorComposite.new(name, gameInputProcessorInterface)
    local self = setmetatable(PlayerGameInput.new(BasicArrayListD.new(), BasicArrayListD.new(), -1), GameInputProcessorComposite)
    self:_init_fields()
        -- super(...) made self above
        self.name = name
        self.gameInputProcessorInterface = gameInputProcessorInterface
    return self
end


function GameInputProcessorComposite:update()
        local try_ok, try_error = pcall(function()
            local list = self:getGameKeyEventList()
            self.gameInputProcessorInterface:onInput(list)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.UPDATE, e)
        end
end


function GameInputProcessorComposite:toString()
        return tostring(StringMaker.new():append(tostring(PlayerGameInput)):append(self.NAME_LABEL):append(self.name))
end
GameInputProcessorComposite.__tostring = function(self) return self:toString() end

return GameInputProcessorComposite

