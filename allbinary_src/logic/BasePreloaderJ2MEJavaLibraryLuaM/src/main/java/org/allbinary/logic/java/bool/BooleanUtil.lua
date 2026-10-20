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
-- package org.allbinary.logic.java.bool

local TsUtil = require("org.allbinary.TsUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

local BooleanUtil = {}
BooleanUtil.__index = BooleanUtil
BooleanUtil.className = "BooleanUtil"

function BooleanUtil:_init_fields()
    self.tsUtil = TsUtil.getInstance()
end


function BooleanUtil.getInstance()
        return BooleanUtil.instance
end


function BooleanUtil.new()
    local self = setmetatable({}, BooleanUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function BooleanUtil:getFromString(booleanString)
        local stringValidationUtil = StringValidationUtil.getInstance()
        local booleanFactory = BooleanFactory.getInstance()
        if stringValidationUtil:isEmpty(booleanString) then
            return false
        end
        local booleanStringLowerCase = string.lower(booleanString)
        if self.tsUtil:compareTo(booleanStringLowerCase, booleanFactory.TRUE_STRING) == 0 then
            return true
        elseif self.tsUtil:compareTo(booleanStringLowerCase, booleanFactory.FALSE_STRING) == 0 then
            return false
        else
            error(java_exception("Exception", "Invalid booleanString - Must be true or false"), 0)
        end
end


-- throws Exception
function BooleanUtil:isStringBoolean(booleanString)
        local booleanFactory = BooleanFactory.getInstance()
        local booleanStringLowerCase = string.lower(booleanString)
        if ((booleanStringLowerCase < booleanFactory.TRUE_STRING and -1) or (booleanStringLowerCase > booleanFactory.TRUE_STRING and 1) or 0) == 0 or ((booleanStringLowerCase < booleanFactory.FALSE_STRING and -1) or (booleanStringLowerCase > booleanFactory.FALSE_STRING and 1) or 0) == 0 then
            return true
        end
        return false
end


function BooleanUtil:toStringFromBooleanArray(booleanArray)
        local stringMaker = StringMaker.new()
        local size = (booleanArray.n or #booleanArray)
        for index = 0, size - 1 do
            stringMaker:appendboolean(booleanArray[index + 1])
        end
        return tostring(stringMaker)
end

BooleanUtil.instance = BooleanUtil.new()

return BooleanUtil

