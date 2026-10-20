-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.game.layer

local GameNotificationHud = require("org.allbinary.game.ag.layer.hud.basic.notification.GameNotificationHud")
local DestroyedEvent = require("org.allbinary.game.combat.destroy.event.DestroyedEvent")
local PlayerGameInput = require("org.allbinary.game.input.PlayerGameInput")
local NullRTSFormInputFactory = require("org.allbinary.game.input.form.NullRTSFormInputFactory")
local RTSFormInput = require("org.allbinary.game.input.form.RTSFormInput")
local Capital = require("org.allbinary.game.layer.capital.Capital")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local Sound = require("org.allbinary.media.audio.Sound")
local NullPathFindingLayer = require("org.allbinary.game.layer.NullPathFindingLayer")
local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullRTSLayer = {}
NullRTSLayer.__index = NullRTSLayer
NullRTSLayer.className = "NullRTSLayer"
setmetatable(NullRTSLayer, {__index = NullPathFindingLayer})

function NullRTSLayer.new()
    local self = setmetatable(NullPathFindingLayer.new(), NullRTSLayer)
    return self
end


function NullRTSLayer:getName()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullRTSLayer:processInput(layerManager)
        error(java_exception("RuntimeException"), 0)
end


function NullRTSLayer:initInputProcessors()
        error(java_exception("RuntimeException"), 0)
end


function NullRTSLayer:getGameNotificationHud()
        error(java_exception("RuntimeException"), 0)
end


function NullRTSLayer:getCurrentScrollSelectionForm()
        error(java_exception("RuntimeException"), 0)
end


function NullRTSLayer:setCurrentScrollSelectionForm(currentScrollSelectionForm)
        error(java_exception("RuntimeException"), 0)
end


function NullRTSLayer:getBuildingScrollSelectionForm()
        error(java_exception("RuntimeException"), 0)
end


function NullRTSLayer:getPlayerGameInput()
        error(java_exception("RuntimeException"), 0)
end


function NullRTSLayer:onEvent(eventObject)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullRTSLayer:onDestroyed(destroyedEvent)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullRTSLayer:processTick(allBinaryLayerManager)
        error(java_exception("RuntimeException"), 0)
end


function NullRTSLayer:getCapital()
        error(java_exception("RuntimeException"), 0)
end


function NullRTSLayer:getRTSFormInput()
        return NullRTSFormInputFactory.getInstance()
end


function NullRTSLayer:add(sound)
        error(java_exception("RuntimeException"), 0)
end


function NullRTSLayer:getPlayerOwnedRTSLayers()
        error(java_exception("RuntimeException"), 0)
end


function NullRTSLayer:implmentsArtificialIntelligenceCompositeInterface()
        error(java_exception("RuntimeException"), 0)
end

NullRTSLayer.NULL_RTS_LAYER = NullRTSLayer.new()

return NullRTSLayer

