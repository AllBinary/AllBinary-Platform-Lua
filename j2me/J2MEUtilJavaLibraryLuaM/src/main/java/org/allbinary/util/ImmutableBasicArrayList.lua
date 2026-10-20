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
-- package org.allbinary.util

local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local BasicArrayListS = require("org.allbinary.util.BasicArrayListS")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImmutableBasicArrayList = {}
ImmutableBasicArrayList.__index = ImmutableBasicArrayList
ImmutableBasicArrayList.className = "ImmutableBasicArrayList"
setmetatable(ImmutableBasicArrayList, {__index = BasicArrayListS})

function ImmutableBasicArrayList:_init_fields()
    self.name = nil
end


function ImmutableBasicArrayList.new(name, size)
    local self = setmetatable(BasicArrayListS.new(size), ImmutableBasicArrayList)
    self:_init_fields()
        -- super(...) made self above
        self.name = name
    return self
end


function ImmutableBasicArrayList:add(e)
        ForcedLogUtil.log(self.name, self)
        return true
end


function ImmutableBasicArrayList:addAt(index, element)
        ForcedLogUtil.log(self.name, self)
end


function ImmutableBasicArrayList:toString()
        return self.name
end
ImmutableBasicArrayList.__tostring = function(self) return self:toString() end

return ImmutableBasicArrayList

