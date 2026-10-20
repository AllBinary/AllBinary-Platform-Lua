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
-- package org.allbinary.game.layer.geological.resources


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeologicalResource = {}
GeologicalResource.__index = GeologicalResource
GeologicalResource.className = "GeologicalResource"

function GeologicalResource:_init_fields()
    self.total = 0
    self.initTotal = nil
end


function GeologicalResource.new(initTotal)
    local self = setmetatable({}, GeologicalResource)
    self:_init_fields()
        self.initTotal = initTotal
        self:init()
    return self
end


function GeologicalResource:init()
        self:setTotal(self.initTotal)
end


function GeologicalResource:add(value)
        local max = Integer.MAX_VALUE
        if self:getTotal() + value > max then
            self:setTotal(max)
        else
            self:setTotal(self:getTotal() + value)
        end
end


function GeologicalResource:remove(value)
        if self:getTotal() - value < 0 then
            self:setTotal(0)
        else
            self:setTotal(self:getTotal() - value)
        end
end


function GeologicalResource:getTotal()
        return self.total
end


function GeologicalResource:setTotal(total)
        self.total = total
end

return GeologicalResource

