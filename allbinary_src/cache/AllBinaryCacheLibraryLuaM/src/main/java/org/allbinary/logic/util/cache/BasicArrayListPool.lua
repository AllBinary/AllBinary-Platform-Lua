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
-- package org.allbinary.logic.util.cache

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local AbstractArrayListPool = require("org.allbinary.logic.util.cache.AbstractArrayListPool")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicArrayListPool = {}
BasicArrayListPool.__index = BasicArrayListPool
BasicArrayListPool.className = "BasicArrayListPool"
setmetatable(BasicArrayListPool, {__index = AbstractArrayListPool})


function BasicArrayListPool.new(cacheableInterfaceFactoryInterface)
    local self = setmetatable(AbstractArrayListPool.new(cacheableInterfaceFactoryInterface), BasicArrayListPool)
        -- super(...) made self above
    return self
end


function BasicArrayListPool:clear()
        self.buffers:clear()
end


-- throws Exception
function BasicArrayListPool:remove(key)
        local size = self.buffers:size()
        if size > 0 then
            return self.buffers:removeAt(size - 1)
        else
            return self.cacheableInterfaceFactoryInterface:getInstance(key)
        end
end


-- throws Exception
function BasicArrayListPool:addAll(usedList)
        do
            local index = usedList:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local anyType = usedList.objectArray[index + 1]
            self:add(anyType)
            end
        end
        usedList:clear()
end


-- throws Exception
function BasicArrayListPool:releaseUsedBackToPool(usedList)
        do
            local index = usedList:size()
            while (function() index = index - 1 return index end)() >= 0 do
            local list = usedList.objectArray[index + 1]
            if list:size() == 0 then
                usedList:removeAt(index)
                self:add(list)
            end
            end
        end
end

return BasicArrayListPool

