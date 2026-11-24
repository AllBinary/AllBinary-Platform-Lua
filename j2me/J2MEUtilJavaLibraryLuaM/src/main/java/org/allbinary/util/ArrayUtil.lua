-- Generated Code Do Not Modify
-- package org.allbinary.util

local ArrayUtil = {}
package.loaded["org.allbinary.util.ArrayUtil"] = ArrayUtil

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

local JsType = java_lazy("jsinterop.annotations.JsType")
local MathUtil = java_lazy("org.allbinary.logic.math.MathUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table ArrayUtil is declared before the requires
ArrayUtil.__index = ArrayUtil
ArrayUtil.className = "ArrayUtil"
ArrayUtil.javaClassName = "org.allbinary.util.ArrayUtil"

function ArrayUtil:_init_fields()
    self.mathUtil = MathUtil.getInstance()
end

function ArrayUtil._jinit(self)
    ArrayUtil._init_fields(self)
    return self
end

function ArrayUtil.new()
    return ArrayUtil._jinit(setmetatable({}, ArrayUtil))
end


function ArrayUtil.getInstance()
        return ArrayUtil.instance_f
end


function ArrayUtil:copyOf(original, newLength)
        return self:copyOfType(original, newLength, getmetatable(original))
end


function ArrayUtil:copyOfType(original, newLength, newType)
        local copy = java_new_array(nil, newLength)
        table.move(original, (0) + 1, (0) + (self.mathUtil:min((original.n or #original), newLength)), (0) + 1, copy)
        return copy
end


function ArrayUtil:copyOfbyte(original, newLength)
        local copy = java_typed_array("B", java_new_array(0, newLength))
        table.move(original, (0) + 1, (0) + (self.mathUtil:min((original.n or #original), newLength)), (0) + 1, copy)
        return copy
end


function ArrayUtil:copyOfshort(original, newLength)
        local copy = java_typed_array("S", java_new_array(0, newLength))
        table.move(original, (0) + 1, (0) + (self.mathUtil:min((original.n or #original), newLength)), (0) + 1, copy)
        return copy
end


function ArrayUtil:copyOfint(original, newLength)
        local copy = java_typed_array("I", java_new_array(0, newLength))
        table.move(original, (0) + 1, (0) + (self.mathUtil:min((original.n or #original), newLength)), (0) + 1, copy)
        return copy
end


function ArrayUtil:copyOflong(original, newLength)
        local copy = java_typed_array("J", java_new_array(0, newLength))
        table.move(original, (0) + 1, (0) + (self.mathUtil:min((original.n or #original), newLength)), (0) + 1, copy)
        return copy
end


function ArrayUtil:copyOfchar(original, newLength)
        local copy = java_new_array("\0", newLength)
        table.move(original, (0) + 1, (0) + (self.mathUtil:min((original.n or #original), newLength)), (0) + 1, copy)
        return copy
end


function ArrayUtil:copyOffloat(original, newLength)
        local copy = java_typed_array("F", java_new_array(0.0, newLength))
        table.move(original, (0) + 1, (0) + (self.mathUtil:min((original.n or #original), newLength)), (0) + 1, copy)
        return copy
end


function ArrayUtil:copyOfdouble(original, newLength)
        local copy = java_typed_array("D", java_new_array(0.0, newLength))
        table.move(original, (0) + 1, (0) + (self.mathUtil:min((original.n or #original), newLength)), (0) + 1, copy)
        return copy
end


function ArrayUtil:copyOfboolean(original, newLength)
        local copy = java_new_array(false, newLength)
        table.move(original, (0) + 1, (0) + (self.mathUtil:min((original.n or #original), newLength)), (0) + 1, copy)
        return copy
end


function ArrayUtil:reverse(intArray)
        local length = (intArray.n or #intArray) - 1
        local temp = 0
        local size = java_idiv(length, 2)
        for index = 0, size do
            temp = intArray[index + 1]
            intArray[index + 1] = intArray[length - index + 1]
            intArray[length - index + 1] = temp
        end
end


function ArrayUtil:flip(intArray, width, height)
        local length = height - 1
        local temp = 0
        local index = 0
        local rowIndex = 0
        for y = 0, java_idiv(length, 2) do
            for x = 0, width - 1 do
                rowIndex = ((length - y) * width)
                index = x + (y * width)
                temp = intArray[index + 1]
                intArray[index + 1] = intArray[rowIndex + x + 1]
                intArray[rowIndex + x + 1] = temp
            end
        end
end


function ArrayUtil:toStringFromTwoDimensionaArray(twoDimensionalIntArray)
        local stringBuffer = StringMaker.new()
        local commonSeps = CommonSeps.getInstance()
        local endIndex = (twoDimensionalIntArray.n or #twoDimensionalIntArray)
        local endIndex2 = (twoDimensionalIntArray[1].n or #twoDimensionalIntArray[1])
        for index = 0, endIndex - 1 do
            stringBuffer:append(commonSeps.BRACE_OPEN)
            for index2 = 0, endIndex2 - 1 do
                stringBuffer:appendint(java_int(twoDimensionalIntArray[index + 1][index2 + 1]))
                stringBuffer:append(commonSeps.COMMA_SEP)
            end
            stringBuffer:append(commonSeps.BRACE_CLOSE)
            stringBuffer:append(commonSeps.NEW_LINE)
        end
        return tostring(stringBuffer)
end


function ArrayUtil:toStringFromObjectArray(objectArray)
        local stringBuffer = StringMaker.new()
        local commonSeps = CommonSeps.getInstance()
        for index = 0, (objectArray.n or #objectArray) - 1 do
            stringBuffer:append(StringUtil.getInstance():toString(objectArray[index + 1]))
            stringBuffer:append(commonSeps.COMMA_SEP)
        end
        return tostring(stringBuffer)
end


function ArrayUtil:toStringFromByteArray(byteArray)
        local stringBuffer = StringMaker.new()
        local commonSeps = CommonSeps.getInstance()
        for index = 0, (byteArray.n or #byteArray) - 1 do
            stringBuffer:appendbyte(byteArray[index + 1])
            stringBuffer:append(commonSeps.COMMA_SEP)
        end
        return tostring(stringBuffer)
end

ArrayUtil.instance_f = ArrayUtil.new()

return ArrayUtil

