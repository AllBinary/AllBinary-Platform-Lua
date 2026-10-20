-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SteeringVisitor = {}
SteeringVisitor.__index = SteeringVisitor
SteeringVisitor.className = "SteeringVisitor"
setmetatable(SteeringVisitor, {__index = Visitor})

function SteeringVisitor:_init_fields()
    self.list = BasicArrayListD.new()
end

function SteeringVisitor.new()
    local self = setmetatable(Visitor.new(), SteeringVisitor)
    self:_init_fields()
    return self
end


function SteeringVisitor:getList()
        return self.list
end

return SteeringVisitor

