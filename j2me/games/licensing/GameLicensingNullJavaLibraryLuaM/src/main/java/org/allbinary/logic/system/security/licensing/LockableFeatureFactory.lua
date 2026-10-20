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
-- package org.allbinary.logic.system.security.licensing

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LockableFeatureFactory = {}
LockableFeatureFactory.__index = LockableFeatureFactory
LockableFeatureFactory.className = "LockableFeatureFactory"

function LockableFeatureFactory:_init_fields()
    self.list = BasicArrayListD.new()
end

function LockableFeatureFactory.new()
    local self = setmetatable({}, LockableFeatureFactory)
    self:_init_fields()
    return self
end


function LockableFeatureFactory.getInstance()
        return LockableFeatureFactory.instance
end


function LockableFeatureFactory:getList()
        return self.list
end

LockableFeatureFactory.instance = LockableFeatureFactory.new()

return LockableFeatureFactory

