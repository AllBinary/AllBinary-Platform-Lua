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
-- package org.allbinary.view

local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ViewPosition = {}
ViewPosition.__index = ViewPosition
ViewPosition.className = "ViewPosition"
setmetatable(ViewPosition, {__index = ViewPositionBase})

function ViewPosition:_init_fields()
    self.allbinaryLayer = AllBinaryLayer.NULL_ALLBINARY_LAYER
end


function ViewPosition.getInstanceD()
        return ViewPosition.new(0, 0, 0)
end


function ViewPosition.new(x, y, z)
    local self = setmetatable(ViewPositionBase.new(x, y, z), ViewPosition)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function ViewPosition:getX()
        return self.allbinaryLayer:getXP()
end


function ViewPosition:getY()
        return self.allbinaryLayer:getYP()
end


function ViewPosition:getZ()
        return self.allbinaryLayer:getZP()
end


function ViewPosition:getX2()
        return self:getX() + self.allbinaryLayer:getWidth()
end


function ViewPosition:getY2()
        return self:getY() + self.allbinaryLayer:getHeight()
end


function ViewPosition:getZ2()
        return java_int((self:getZ() + self.allbinaryLayer:getDepth()))
end


function ViewPosition:setAllbinaryLayer(allbinaryLayer)
        self.allbinaryLayer = allbinaryLayer
end

return ViewPosition

