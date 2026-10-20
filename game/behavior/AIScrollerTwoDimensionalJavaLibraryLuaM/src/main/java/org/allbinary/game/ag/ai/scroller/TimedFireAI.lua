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
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TimedFireAI = {}
TimedFireAI.__index = TimedFireAI
TimedFireAI.className = "TimedFireAI"
setmetatable(TimedFireAI, {__index = BasicAI})

function TimedFireAI:_init_fields()
    self.maxFireDelayTimeHelper = TimeDelayHelper.new(0)
    self.delay = nil
end


function TimedFireAI.new(delay, ownerLayerInterface, gameInput)
    local self = setmetatable(BasicAI.new(ownerLayerInterface, gameInput), TimedFireAI)
    self:_init_fields()
        -- super(...) made self above
        self.delay = delay
    return self
end


-- throws Exception
function TimedFireAI:processAI(allBinaryLayerManager)
        local timeFiredInterface = self:getOwnerLayerInterface()
        if self.maxFireDelayTimeHelper:isTime(GameTickTimeDelayHelperFactory.getInstance().startTime) and timeFiredInterface:getLastFireTime() + self.maxFireDelayTimeHelper.delay < self.maxFireDelayTimeHelper:getStartTime() then
            BasicAI.processKeyAI(self, Canvas.KEY_NUM1)
            self.maxFireDelayTimeHelper.delay = self.delay
        end
end

TimedFireAI.TIME = SmallIntegerSingletonFactory.getInstance():getAt(1)

return TimedFireAI

