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
-- package org.allbinary.layer

local BaseCircularPool = require("org.allbinary.logic.util.cache.BaseCircularPool")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local AllBinaryLayerCircularPool = {}
AllBinaryLayerCircularPool.__index = AllBinaryLayerCircularPool
AllBinaryLayerCircularPool.className = "AllBinaryLayerCircularPool"
setmetatable(AllBinaryLayerCircularPool, {__index = BaseCircularPool})


function AllBinaryLayerCircularPool.new()
    local self = setmetatable(BaseCircularPool.new(), AllBinaryLayerCircularPool)
    return self
end


-- throws Exception
function AllBinaryLayerCircularPool:initAllBinaryLayerCircularPool(allbinaryLayerFactoryInterface, total)
        self.circularIndexUtil = CircularIndexUtil.createInstance(total)
        self.OBJECT_ARRAY = java_new_array(nil, total)
        for localIndex = 0, total - 1 do
            self.OBJECT_ARRAY[localIndex + 1] = allbinaryLayerFactoryInterface:getInstance()
        end
end

return AllBinaryLayerCircularPool

