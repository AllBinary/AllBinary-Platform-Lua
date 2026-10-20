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
-- package org.allbinary.android.input.motion

local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
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

local AnalogControllerHelper = {}
AnalogControllerHelper.__index = AnalogControllerHelper
AnalogControllerHelper.className = "AnalogControllerHelper"

function AnalogControllerHelper:_init_fields()
    self.reduceTimeFactor = nil
    self.SCALE_VALUE = AnalogControllerConfigurationFactory.getInstance().SCALE_VALUE
    self.rightTimeElapsedHelper = TimeDelayHelper.new(0)
    self.leftTimeElapsedHelper = TimeDelayHelper.new(0)
    self.downTimeElapsedHelper = TimeDelayHelper.new(0)
    self.upTimeElapsedHelper = TimeDelayHelper.new(0)
end


function AnalogControllerHelper.new(reduceTimeFactor)
    local self = setmetatable({}, AnalogControllerHelper)
    self:_init_fields()
        self.reduceTimeFactor = reduceTimeFactor
    return self
end


-- throws Exception
function AnalogControllerHelper:right(collidableDestroyableDamageableLayer, xAnalogValue)
        self.rightTimeElapsedHelper.delay = ((((self.SCALE_VALUE - xAnalogValue)) // (1 << (self.reduceTimeFactor))))
        if self.rightTimeElapsedHelper:isTimeTNT() then
            collidableDestroyableDamageableLayer:right()
        end
end


-- throws Exception
function AnalogControllerHelper:left(collidableDestroyableDamageableLayer, xAnalogValue)
        self.leftTimeElapsedHelper.delay = ((((self.SCALE_VALUE + xAnalogValue)) // (1 << (self.reduceTimeFactor))))
        if self.leftTimeElapsedHelper:isTimeTNT() then
            collidableDestroyableDamageableLayer:left()
        end
end


-- throws Exception
function AnalogControllerHelper:up(collidableDestroyableDamageableLayer, xAnalogValue)
        self.upTimeElapsedHelper.delay = ((((self.SCALE_VALUE - xAnalogValue)) // (1 << (self.reduceTimeFactor))))
        if self.upTimeElapsedHelper:isTimeTNT() then
            collidableDestroyableDamageableLayer:up()
        end
end


-- throws Exception
function AnalogControllerHelper:down(collidableDestroyableDamageableLayer, xAnalogValue)
        self.downTimeElapsedHelper.delay = ((((self.SCALE_VALUE + xAnalogValue)) // (1 << (self.reduceTimeFactor))))
        if self.downTimeElapsedHelper:isTimeTNT() then
            collidableDestroyableDamageableLayer:down()
        end
end

return AnalogControllerHelper

