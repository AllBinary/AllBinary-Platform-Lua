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
-- package org.allbinary.logic.math.vector

local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local PositionStrings = require("org.allbinary.math.PositionStrings")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Vertex = {}
Vertex.__index = Vertex
Vertex.className = "Vertex"

function Vertex:_init_fields()
    self.x = BasicDecimal.new(0)
    self.y = BasicDecimal.new(0)
    self.z = BasicDecimal.new(0)
end


function Vertex.new()
    local self = setmetatable({}, Vertex)
    self:_init_fields()
    return self
end


function Vertex:toString()
        local stringBuffer = StringMaker.new()
        local positionStrings = PositionStrings.getInstance()
        stringBuffer:append(positionStrings.X_LABEL)
        stringBuffer:append(tostring(self.x))
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(positionStrings.Y_LABEL)
        stringBuffer:append(tostring(self.y))
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(positionStrings.Z_LABEL)
        stringBuffer:append(tostring(self.z))
        return tostring(stringBuffer)
end
Vertex.__tostring = function(self) return self:toString() end

return Vertex

