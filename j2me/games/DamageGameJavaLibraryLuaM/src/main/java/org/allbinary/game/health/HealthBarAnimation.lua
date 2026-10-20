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
-- package org.allbinary.game.health

local Animation = require("org.allbinary.animation.Animation")
local BasicHudFactory = require("org.allbinary.game.graphics.hud.BasicHudFactory")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")

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

local HealthBarAnimation = {}
HealthBarAnimation.__index = HealthBarAnimation
HealthBarAnimation.className = "HealthBarAnimation"
setmetatable(HealthBarAnimation, {__index = Animation})

function HealthBarAnimation:_init_fields()
    self.basicColorFactory = BasicColorFactory.getInstance()
    self.x2 = 0
    self.thickness = 0
    self.location = nil
    self.allbinaryLayer = nil
end


function HealthBarAnimation.new(layerInterface, location)
    local self = setmetatable(Animation.new(), HealthBarAnimation)
    self:_init_fields()
        self.allbinaryLayer = layerInterface
        self.location = location
        local basicHudFactory = BasicHudFactory.getInstance()
        if self.location ~= basicHudFactory.TOPLEFT and self.location ~= basicHudFactory.BOTTOMLEFT then
            error(java_exception("Exception", "Location Not Valid"), 0)
        end
        if layerInterface:getWidth() > 40 then
            self.thickness = 3
        elseif layerInterface:getWidth() > 20 then
            self.thickness = 2
        else
            self.thickness = 1
        end
    return self
end


function HealthBarAnimation:onHealthChange(newX2)
        self.x2 = newX2
        local quarter = (((self.allbinaryLayer:getWidth()) // (1 << (2))))
        if self.x2 > quarter * 3 then
            self.basicColor = self.basicColorFactory.GREEN
            self.colorP = math.tointeger(self.basicColor // 1)
        elseif self.x2 > quarter * 2 then
            self.basicColor = self.basicColorFactory.YELLOW
            self.colorP = math.tointeger(self.basicColor // 1)
        elseif self.x2 > quarter then
            self.basicColor = self.basicColorFactory.ORANGE
            self.colorP = math.tointeger(self.basicColor // 1)
        else
            self.basicColor = self.basicColorFactory.RED
            self.colorP = math.tointeger(self.basicColor // 1)
        end
end


function HealthBarAnimation:getY()
        local basicHudFactory = BasicHudFactory.getInstance()
        if self.location == basicHudFactory.TOPLEFT then
            return self.allbinaryLayer:getViewPosition():getY() - 4
        elseif self.location == basicHudFactory.BOTTOMLEFT then
            return self.allbinaryLayer:getViewPosition():getY2() + 4
        end
        return -1
end

return HealthBarAnimation

