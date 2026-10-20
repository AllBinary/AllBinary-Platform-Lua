-- Generated Code Do Not Modify
-- package org.allbinary.util

local JsType = require("jsinterop.annotations.JsType")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsConstructor = require("jsinterop.annotations.JsConstructor")
local JsProperty = require("jsinterop.annotations.JsProperty")

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

--This is a very fast and simple resizable list.
local BasicArrayList = {}
BasicArrayList.__index = BasicArrayList
BasicArrayList.className = "BasicArrayList"

function BasicArrayList:_init_fields()
    self.arrayUtil = ArrayUtil.getInstance()
    self.objectArray = nil
    self.currentIndex = 0
end


function BasicArrayList.new(objectArray)
    local self = setmetatable({}, BasicArrayList)
    self:_init_fields()
        self.objectArray = objectArray
    return self
end


function BasicArrayList:addAt(index, element)
        if index > self.currentIndex or index < 0 then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(CommonLabels.getInstance().INDEX_LABEL)
            stringBuffer:appendint(index)
            stringBuffer:append(BasicArrayList.SIZE)
            stringBuffer:appendint(self.currentIndex)
            error(java_exception("IndexOutOfBoundsException", tostring(stringBuffer)), 0)
        end
        self:ensureCapacity(self.currentIndex + 1)
        table.move(self.objectArray, (index) + 1, (index) + (self.currentIndex - index), (index + 1) + 1, self.objectArray)
        self.objectArray[index + 1] = element
        self.currentIndex = self.currentIndex + 1
end


function BasicArrayList:add(anyType)
        self:ensureCapacity(self.currentIndex + 1)
        self.objectArray[(function() local value = self.currentIndex self.currentIndex = value + 1 return value end)() + 1] = anyType
        return true
end


function BasicArrayList:removeAt(index)
        if index >= self.currentIndex then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(CommonLabels.getInstance().INDEX_LABEL)
            stringBuffer:appendint(index)
            stringBuffer:append(BasicArrayList.SIZE)
            stringBuffer:appendint(self.currentIndex)
            error(java_exception("IndexOutOfBoundsException", tostring(stringBuffer)), 0)
        end
        local oldValue = self.objectArray[index + 1]
        local numMoved = self.currentIndex - index - 1
        if numMoved > 0 then
            table.move(self.objectArray, (index + 1) + 1, (index + 1) + (numMoved), (index) + 1, self.objectArray)
        end
        self.objectArray[(function() self.currentIndex = self.currentIndex - 1 return self.currentIndex end)() + 1] = nil
        return oldValue
end


function BasicArrayList:remove(anyType)
        if anyType == nil then
            for index = 0, self.currentIndex - 1 do
                if self.objectArray[index + 1] == nil then
                    local numMoved = self.currentIndex - index - 1
                    if numMoved > 0 then
                        table.move(self.objectArray, (index + 1) + 1, (index + 1) + (numMoved), (index) + 1, self.objectArray)
                    end
                    self.objectArray[(function() self.currentIndex = self.currentIndex - 1 return self.currentIndex end)() + 1] = nil
                    return true
                end
            end
        else
            for index = 0, self.currentIndex - 1 do
                if anyType == self.objectArray[index + 1] or anyType:equals(self.objectArray[index + 1]) then
                    local numMoved = self.currentIndex - index - 1
                    if numMoved > 0 then
                        table.move(self.objectArray, (index + 1) + 1, (index + 1) + (numMoved), (index) + 1, self.objectArray)
                    end
                    self.objectArray[(function() self.currentIndex = self.currentIndex - 1 return self.currentIndex end)() + 1] = nil
                    return true
                end
            end
        end
        return false
end


function BasicArrayList:removeAll2(list)
        local result = true
        local size = list:size()
        for index = 0, size - 1 do
            if self:remove(list:get(index)) then
            else
                result = false
            end
        end
        return result
end


function BasicArrayList:addAll2(list)
        self:ensureCapacity(self.currentIndex + list.currentIndex)
        local listSize = list.currentIndex
        for index = 0, listSize - 1 do
            self.objectArray[(function() local value = self.currentIndex self.currentIndex = value + 1 return value end)() + 1] = list.objectArray[index + 1]
        end
        return true
end


function BasicArrayList:addAllList(list)
        local newObjectArray = list:toArray()
        return self:addAll(newObjectArray)
end


function BasicArrayList:addAll(newObjectArray)
        local numSize = (newObjectArray.n or #newObjectArray)
        self:ensureCapacity(self.currentIndex + numSize)
        table.move(newObjectArray, (0) + 1, (0) + (numSize), (self.currentIndex) + 1, self.objectArray)
        self.currentIndex = self.currentIndex + (numSize)
        return numSize ~= 0
end


function BasicArrayList:ensureCapacity(minSize)
        local oldCapacity = (self.objectArray.n or #self.objectArray)
        if minSize > oldCapacity then
            local newCapacity = ((((oldCapacity * 3)) // (1 << (1)))) + 1
            if newCapacity < minSize then
                newCapacity = minSize
            end
            self.objectArray = self.arrayUtil:copyOf(self.objectArray, newCapacity)
        end
end


function BasicArrayList:trimToSize()
        local oldCapacity = (self.objectArray.n or #self.objectArray)
        if self.currentIndex < oldCapacity then
            self.objectArray = self.arrayUtil:copyOf(self.objectArray, self.currentIndex)
        end
end


function BasicArrayList:indexOf(anyType)
        if anyType == nil then
            for i = 0, self.currentIndex - 1 do
                if self.objectArray[i + 1] == nil then
                    return i
                end
            end
        else
            for i = 0, self.currentIndex - 1 do
                if anyType:equals(self.objectArray[i + 1]) then
                    return i
                end
            end
        end
        return -1
end


function BasicArrayList:lastIndexOf(anyType)
        if anyType == nil then
            for i = self.currentIndex - 1, 0, -1 do
                if self.objectArray[i + 1] == nil then
                    return i
                end
            end
        else
            for i = self.currentIndex - 1, 0, -1 do
                if anyType:equals(self.objectArray[i + 1]) then
                    return i
                end
            end
        end
        return -1
end


function BasicArrayList:get(index)
        if index >= self.currentIndex then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(CommonLabels.getInstance().INDEX_LABEL)
            stringBuffer:appendint(index)
            stringBuffer:append(BasicArrayList.SIZE)
            stringBuffer:appendint(self.currentIndex)
            error(java_exception("IndexOutOfBoundsException", tostring(stringBuffer)), 0)
        end
        return self.objectArray[index + 1]
end


function BasicArrayList:set(index, element)
        if index >= self.currentIndex then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(CommonLabels.getInstance().INDEX_LABEL)
            stringBuffer:appendint(index)
            stringBuffer:append(BasicArrayList.SIZE)
            stringBuffer:appendint(self.currentIndex)
            error(java_exception("IndexOutOfBoundsException", tostring(stringBuffer)), 0)
        end
        local oldValue = self.objectArray[index + 1]
        self.objectArray[index + 1] = element
        return oldValue
end


function BasicArrayList:clear()
        for i = 0, self.currentIndex - 1 do
            self.objectArray[i + 1] = nil
        end
        self.currentIndex = 0
end


function BasicArrayList:size()
        return self.currentIndex
end


function BasicArrayList:isEmpty()
        return self.currentIndex == 0
end


function BasicArrayList:contains(anyType)
        return self:indexOf(anyType) >= 0
end


function BasicArrayList:toArray()
        return self.arrayUtil:copyOf(self.objectArray, self.currentIndex)
end


function BasicArrayList:toArrayType(objectArray)
        if (objectArray.n or #objectArray) < self.currentIndex then
            return self.arrayUtil:copyOfType(self.objectArray, self.currentIndex, getmetatable(objectArray))
        end
        table.move(self.objectArray, (0) + 1, (0) + (self.currentIndex), (0) + 1, objectArray)
        if (objectArray.n or #objectArray) > self.currentIndex then
            objectArray[self.currentIndex + 1] = nil
        end
        return objectArray
end


function BasicArrayList:clone()
        local size = self:size()
        local list = BasicArrayListS.new(size)
        local anyType = nil
        for index = 0, size - 1 do
            anyType = self.objectArray[index + 1]
            list:add(anyType)
        end
        return list
end


function BasicArrayList:toString()
        local COMMA_SEP = CommonSeps.getInstance().COMMA_SEP
        local stringBuffer = StringMaker.new()
        for index = 0, self.currentIndex - 1 do
            stringBuffer:append(tostring(self.objectArray[index + 1]))
            stringBuffer:append(COMMA_SEP)
        end
        return tostring(stringBuffer)
end
BasicArrayList.__tostring = function(self) return self:toString() end

BasicArrayList.SIZE = ", Size: "

return BasicArrayList

