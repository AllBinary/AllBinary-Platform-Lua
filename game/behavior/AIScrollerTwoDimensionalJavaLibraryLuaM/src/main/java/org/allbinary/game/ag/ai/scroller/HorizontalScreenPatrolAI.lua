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
-- package org.allbinary.game.ag.ai.scroller

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local GameInput = require("org.allbinary.game.input.GameInput")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local MyRandomFactory = require("org.allbinary.game.rand.MyRandomFactory")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local PlayerQueue = require("org.allbinary.media.audio.PlayerQueue")
local SecondaryPlayerQueueFactory = require("org.allbinary.media.audio.SecondaryPlayerQueueFactory")
local Sound = require("org.allbinary.media.audio.Sound")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local ABHashtable = require("org.allbinary.util.ABHashtable")

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

local HorizontalScreenPatrolAI = {}
HorizontalScreenPatrolAI.__index = HorizontalScreenPatrolAI
HorizontalScreenPatrolAI.className = "HorizontalScreenPatrolAI"
setmetatable(HorizontalScreenPatrolAI, {__index = BasicAI})

function HorizontalScreenPatrolAI:_init_fields()
    self.keyDirection = Canvas.LEFT
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
    self.firingX = self.displayInfoSingleton:getLastHalfWidth()
    self.firedIndex = 0
    self.MAX_FIRE = 28
    self.timeDelayHelper = TimeDelayHelper.new(240)
    self.secondaryPlayerQueue = SecondaryPlayerQueueFactory.getInstance()
    self.sound = nil
end


function HorizontalScreenPatrolAI.new(hashtable, ownerLayerInterface, gameInput)
    local self = setmetatable(BasicAI.new(ownerLayerInterface, gameInput), HorizontalScreenPatrolAI)
    self:_init_fields()
        -- super(...) made self above
        self.sound = hashtable:get(HorizontalScreenPatrolAI.SOUND)
        if self.sound == nil then
            error(java_exception("Exception", "No Sound Provided!!"), 0)
        end
    return self
end


-- throws Exception
function HorizontalScreenPatrolAI:processAI(allBinaryLayerManager)
        BasicAI.processKeyAI(self, self.keyDirection)
        if self.timeDelayHelper:isTimeTNT() then
            local layerInterface = self:getOwnerLayerInterface()
            local currentOwnerLayerX = layerInterface:getXP()
            if currentOwnerLayerX < -layerInterface:getWidth() then
                local y = MyRandomFactory.getInstance():getAbsoluteNextIntAllowZero(50)
                layerInterface:setPosition(self.displayInfoSingleton:getLastWidth() + layerInterface:getWidth() + 50, y, layerInterface:getZP())
                self.firedIndex = 0
                self.firingX = self.displayInfoSingleton:getLastHalfWidth() + MyRandomFactory.getInstance():getNextInt(self.displayInfoSingleton:getLastHalfWidth())
                self.secondaryPlayerQueue:add(self.sound)
            end
            if currentOwnerLayerX < self.firingX and currentOwnerLayerX > -layerInterface:getWidth() then
                BasicAI.processKeyAI(self, Canvas.KEY_NUM1)
                local gameLayerManager = allBinaryLayerManager
                local FIRE = (((gameLayerManager:getGameInfo():getCurrentLevel() + 12)) // (1 << (2)))
                if FIRE > self.MAX_FIRE then
                    FIRE = self.MAX_FIRE
                end
                if self.firedIndex > FIRE then
                    self.firedIndex = 0
                    self.firingX = Integer.MIN_VALUE
                end
                self.firedIndex = self.firedIndex + 1
            end
        end
end


function HorizontalScreenPatrolAI:nextDirection()
end

HorizontalScreenPatrolAI.SOUND = SmallIntegerSingletonFactory.getInstance():getAt(433)

return HorizontalScreenPatrolAI

