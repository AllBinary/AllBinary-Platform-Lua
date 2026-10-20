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
-- package org.allbinary.game.input.mapping

local Input = require("org.allbinary.game.input.Input")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")

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

local InputMapping = {}
InputMapping.__index = InputMapping
InputMapping.className = "InputMapping"

function InputMapping:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.hashtable = StdUtil.getInstance():createHashtable()
    self.mappedList = BasicArrayListD.new()
end


function InputMapping.new()
    local self = setmetatable({}, InputMapping)
    self:_init_fields()
    return self
end


function InputMapping:getTotalMapped()
        return self.hashtable:size()
end


function InputMapping:isDefaultNew()
        return false
end


function InputMapping:getDefault()
        return InputToGameKeyMapping.getNullInstance()
end


function InputMapping:removeAll()
        self.hashtable:clear()
        self.mappedList:clear()
end


function InputMapping:remove(input, mappedToInput)
        local stringBuffer = StringMaker.new()
        local stringUtil = StringUtil.getInstance()
        stringBuffer:append(CommonLabels.getInstance().START_LABEL)
        stringBuffer:append(stringUtil:toString(input))
        stringBuffer:append(" == ")
        stringBuffer:append(stringUtil:toString(mappedToInput))
        self.logUtil:putF(tostring(stringBuffer), self, "InputMapping::remove")
        local list = self:getMappedInput(input)
        if list:contains(mappedToInput) then
            list:remove(mappedToInput)
            self.mappedList:remove(mappedToInput)
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append("Removed: ")
            stringBuffer:append(stringUtil:toString(input))
            stringBuffer:append(" == ")
            stringBuffer:append(stringUtil:toString(mappedToInput))
            self.logUtil:putF(tostring(stringBuffer), self, "InputMapping::remove")
        else
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append("Not Deleted: ")
            stringBuffer:append(stringUtil:toString(input))
            stringBuffer:append(" == ")
            stringBuffer:append(stringUtil:toString(mappedToInput))
            self.logUtil:putF(tostring(stringBuffer), self, "InputMapping::remove")
        end
end


-- throws Exception
function InputMapping:addMapping(inputToGameKeyMapping)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function InputMapping:add(input, mappedToInput)
        local list = self:getMappedInput(input)
        if not list:contains(mappedToInput) then
            list:add(mappedToInput)
            self.mappedList:add(mappedToInput)
        end
end


function InputMapping:isMapped(input)
        return self.mappedList:contains(input)
end


function InputMapping:getMappedInput(id)
        local mappingInputCanBeNullList = self.hashtable:get(id)
        if mappingInputCanBeNullList == nil then
            local list = BasicArrayListD.new()
            self.hashtable:put(id, list)
            return list
        end
        return mappingInputCanBeNullList
end


function InputMapping:getHashtable()
        return self.hashtable
end

return InputMapping

