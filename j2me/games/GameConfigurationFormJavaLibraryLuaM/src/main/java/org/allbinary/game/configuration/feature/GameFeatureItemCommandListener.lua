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
-- package org.allbinary.game.configuration.feature

-- local Command = require("javax.microedition.lcdui.Command")
-- local Item = require("javax.microedition.lcdui.Item")
-- local ItemCommandListener = require("javax.microedition.lcdui.ItemCommandListener")
local GameConfigurationGauge = require("org.allbinary.game.configuration.GameConfigurationGauge")
local GameConfigurationUtil = require("org.allbinary.game.configuration.GameConfigurationUtil")
local GameOptionsForm = require("org.allbinary.game.configuration.GameOptionsForm")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local MidletStrings = require("org.allbinary.midlet.MidletStrings")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_instanceof(object, class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameFeatureItemCommandListener = {}
GameFeatureItemCommandListener.__index = GameFeatureItemCommandListener
GameFeatureItemCommandListener.className = "GameFeatureItemCommandListener"

function GameFeatureItemCommandListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.gameOptionsForm = nil
end


function GameFeatureItemCommandListener.new(gameOptionsForm)
    local self = setmetatable({}, GameFeatureItemCommandListener)
    self:_init_fields()
        self.gameOptionsForm = gameOptionsForm
    return self
end


function GameFeatureItemCommandListener:commandAction(command, item)
        local try_ok, try_error = pcall(function()
            local itemLabel = item:getLabel()
            self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().ITEM_LABEL):append(itemLabel)), self, MidletStrings.getInstance().COMMAND_ACTION)
            if java_instanceof(item, GameConfigurationGauge) then
                GameConfigurationUtil.getInstance():change(self.gameOptionsForm, item)
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, MidletStrings.getInstance().COMMAND_ACTION, e)
        end
end

return GameFeatureItemCommandListener

