-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.input.form

local RTSGameStrings = require("org.allbinary.game.layer.RTSGameStrings")
local RTSInterface = require("org.allbinary.game.layer.RTSInterface")
local RTSPlayerLayerInterface = require("org.allbinary.game.layer.RTSPlayerLayerInterface")
local TechnologyRTSInterfaceImageItem = require("org.allbinary.game.layer.TechnologyRTSInterfaceImageItem")
local Capital = require("org.allbinary.game.layer.capital.Capital")
local TechEventHandler = require("org.allbinary.game.rts.technology.event.TechEventHandler")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local BuildingSound = require("org.allbinary.media.audio.BuildingSound")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local Group = require("org.allbinary.game.identification.Group")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local GameNotificationEvent = require("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationEventHandler = require("org.allbinary.game.layer.hud.event.GameNotificationEventHandler")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local ErrorSound = require("org.allbinary.media.audio.ErrorSound")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local RTSFormInput = require("org.allbinary.game.input.form.RTSFormInput")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TechRTSFormInput = {}
TechRTSFormInput.__index = TechRTSFormInput
TechRTSFormInput.className = "TechRTSFormInput"
setmetatable(TechRTSFormInput, {__index = RTSFormInput})

function TechRTSFormInput:_init_fields()
    self.EVENT = AllBinaryEventObject.new(self)
    self.noMoneyGameNotificationEvent = nil
end


function TechRTSFormInput.new(groupInterface)
    local self = setmetatable(RTSFormInput.new(groupInterface), TechRTSFormInput)
    self:_init_fields()
        -- super(...) made self above
        local basicColorFactory = BasicColorFactory.getInstance()
        self.noMoneyGameNotificationEvent = GameNotificationEvent.new(self, RTSGameStrings.getInstance().NO_MONEY, SmallIntegerSingletonFactory.getInstance():getAt(2), basicColorFactory.WHITE, BooleanFactory.getInstance().FALSE)
    return self
end


-- throws Exception
function TechRTSFormInput:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        RTSFormInput.setAllBinaryGameLayerManager(self, allBinaryGameLayerManager)
        local geographicMapCompositeInterface = allBinaryGameLayerManager
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        self.noMoneyGameNotificationEvent:setBasicColorP(geographicMapInterface:getForegroundBasicColor())
end


-- throws Exception
function TechRTSFormInput:processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, itemIndex)
        RTSFormInput.process(self, layerManager)
        local commonStrings = CommonStrings.getInstance()
        local stringMaker = StringMaker.new()
        local technologyRTSInterfaceImageItem = item
        local rtsInterface = technologyRTSInterfaceImageItem:getRtsInterface()
        self.logUtil:putF(tostring(stringMaker:append("isUpgradeable: "):appendboolean(rtsInterface:isUpgradeable())), self, commonStrings.PROCESS)
        if rtsInterface:isUpgradeable() then
            local cost = rtsInterface:getUpgradeCost()
            local capital = rtsPlayerLayerInterface:getCapital()
            stringMaker:delete(0, stringMaker:length())
            self.logUtil:putF(tostring(stringMaker:appendint(cost):append("<="):appendint(java_int(capital:getTotalMoney()))), self, commonStrings.PROCESS)
            if cost <= capital:getTotalMoney() then
                rtsPlayerLayerInterface:add(BuildingSound.getInstance())
                capital:removeMoney(cost)
                rtsInterface:upgrade()
                technologyRTSInterfaceImageItem:update()
                TechEventHandler.getInstance():fireEvent(self.EVENT)
            else
                rtsPlayerLayerInterface:add(ErrorSound.getInstance())
                if not rtsPlayerLayerInterface:implmentsArtificialIntelligenceCompositeInterface() then
                    GameNotificationEventHandler.getInstance():fireEvent(self.noMoneyGameNotificationEvent)
                end
            end
        end
end

return TechRTSFormInput

