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

local BasicArrayListResetablePool = {}
BasicArrayListResetablePool.__index = BasicArrayListResetablePool
BasicArrayListResetablePool.className = "BasicArrayListResetablePool"
setmetatable(BasicArrayListResetablePool, {__index = AbstractArrayListPool})


function BasicArrayListResetablePool.new(cacheableInterfaceFactoryInterface)
    local self = setmetatable(AbstractArrayListPool.new(cacheableInterfaceFactoryInterface), BasicArrayListResetablePool)
        -- super(...) made self above
    return self
end


function BasicArrayListResetablePool:clear()
end


-- throws Exception
function BasicArrayListResetablePool:remove(key)
        local size = self.buffers:size()
        if size > 0 then
            return self.buffers:removeAt(size - 1)
        else
            return self.cacheableInterfaceFactoryInterface:getInstance(key)
        end
end

return BasicArrayListResetablePool

