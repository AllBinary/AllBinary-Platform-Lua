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

local InputMapping = {}
package.loaded["org.allbinary.game.input.mapping.InputMapping"] = InputMapping

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local Input = java_lazy("org.allbinary.game.input.Input")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local InputToGameKeyMapping = java_lazy("org.allbinary.game.input.mapping.InputToGameKeyMapping")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table InputMapping is declared before the requires
InputMapping.__index = InputMapping
InputMapping.className = "InputMapping"
InputMapping.javaClassName = "org.allbinary.game.input.mapping.InputMapping"

function InputMapping:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.hashtable = StdUtil.getInstance():createHashtable()
    self.mappedList = BasicArrayListD.new()
end


function InputMapping._jinit(self)
    InputMapping._init_fields(self)
    return self
end

function InputMapping.new(...)
    local self = setmetatable({}, InputMapping)
    InputMapping._jinit(self, ...)
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
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
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

