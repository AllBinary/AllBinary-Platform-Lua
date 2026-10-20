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
-- package org.allbinary.input.motion.button

local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BaseTouchInput = {}
BaseTouchInput.__index = BaseTouchInput
BaseTouchInput.className = "BaseTouchInput"

function BaseTouchInput:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
end


function BaseTouchInput.new()
    local self = setmetatable({}, BaseTouchInput)
    self:_init_fields()
    return self
end


function BaseTouchInput:getList()
        return self.basicArrayListUtil:getImmutableInstance()
end


function BaseTouchInput:toString()
        return getmetatable(self).className
end
BaseTouchInput.__tostring = function(self) return self:toString() end

return BaseTouchInput

