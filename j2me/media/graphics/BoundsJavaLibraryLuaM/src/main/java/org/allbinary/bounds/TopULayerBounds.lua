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
-- package org.allbinary.bounds

local Rectangle = require("org.allbinary.graphics.Rectangle")
local LayerBounds = require("org.allbinary.bounds.LayerBounds")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TopULayerBounds = {}
TopULayerBounds.__index = TopULayerBounds
TopULayerBounds.className = "TopULayerBounds"
setmetatable(TopULayerBounds, {__index = LayerBounds})


function TopULayerBounds.new(rectangle)
    local self = setmetatable(LayerBounds.new(rectangle), TopULayerBounds)
        -- super(...) made self above
    return self
end


function TopULayerBounds:visit(boundsVisitorInterface)
        if boundsVisitorInterface:getX() > self.rectangle:getMaxX() then
            boundsVisitorInterface:maxX()
        end
        if boundsVisitorInterface:getX() < self.rectangle:getPoint():getX() then
            boundsVisitorInterface:minX()
        end
        if boundsVisitorInterface:getY() < self.rectangle:getPoint():getY() then
            boundsVisitorInterface:minY()
        end
end

return TopULayerBounds

