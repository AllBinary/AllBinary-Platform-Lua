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
-- package org.allbinary.game.rand

local MyRandomFactory = {}
package.loaded["org.allbinary.game.rand.MyRandomFactory"] = MyRandomFactory

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

local Random = java_lazy("java.util.Random")
local JsType = java_lazy("jsinterop.annotations.JsType")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local JsConstructor = java_lazy("jsinterop.annotations.JsConstructor")
local MathUtil = java_lazy("org.allbinary.logic.math.MathUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")

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

--Do not use in client code for money related things.
-- class table MyRandomFactory is declared before the requires
MyRandomFactory.__index = MyRandomFactory
MyRandomFactory.className = "MyRandomFactory"
MyRandomFactory.javaClassName = "org.allbinary.game.rand.MyRandomFactory"

function MyRandomFactory:_init_fields()
    self.mathUtil = MathUtil.getInstance()
    if self.rand == nil then self.rand = nil end
end


function MyRandomFactory.getInstance()
        return MyRandomFactory.instance_f
end


function MyRandomFactory._jinit(self)
    MyRandomFactory._init_fields(self)
        self.rand = Random.new(math.floor(os.time() * 1000))
    return self
end

function MyRandomFactory.new(...)
    local self = setmetatable({}, MyRandomFactory)
    MyRandomFactory._jinit(self, ...)
    return self
end


function MyRandomFactory:setSeed(seed)
        self.rand = Random.new(seed)
end


function MyRandomFactory:getNextInt(range)
        local div = (require("java.lang.Integer").MAX_VALUE / range) + 1
        return java_int((self.rand:nextInt() / div))
end


function MyRandomFactory:getAbsoluteNextInt(range)
        return self.mathUtil:abs(self:getNextInt(range))
end


function MyRandomFactory:getAbsoluteNextIntAllowZero(range)
        if range == 0 then
            return 0
        else
            return self.mathUtil:abs(self:getNextInt(range))
        end
end


function MyRandomFactory:shuffle(intArray)
        self:shuffleTotal(intArray, (intArray.n or #intArray) * 7)
end


function MyRandomFactory:shuffleTotal(intArray, shuffleTotal)
        local size = (intArray.n or #intArray)
        local randomIndex = 0
        local randomIndex2 = 0
        local value = 0
        for index = 0, shuffleTotal - 1 do
            randomIndex = self:getAbsoluteNextIntAllowZero(size)
            randomIndex2 = self:getAbsoluteNextIntAllowZero(size)
            value = intArray[randomIndex + 1]
            intArray[randomIndex + 1] = intArray[randomIndex2 + 1]
            intArray[randomIndex2 + 1] = value
        end
end


function MyRandomFactory:shuffle2(intArray, intArray2)
        self:shuffle2Total(intArray, intArray2, (intArray.n or #intArray) * 7)
end


function MyRandomFactory:shuffle2Total(intArray, intArray2, shuffleTotal)
        local size = (intArray.n or #intArray)
        local randomIndex = 0
        local randomIndex2 = 0
        local value = 0
        local value2 = 0
        for index = 0, shuffleTotal - 1 do
            randomIndex = self:getAbsoluteNextIntAllowZero(size)
            randomIndex2 = self:getAbsoluteNextIntAllowZero(size)
            value = intArray[randomIndex + 1]
            value2 = intArray2[randomIndex + 1]
            intArray[randomIndex + 1] = intArray[randomIndex2 + 1]
            intArray[randomIndex2 + 1] = value
            intArray2[randomIndex + 1] = intArray2[randomIndex2 + 1]
            intArray2[randomIndex2 + 1] = value2
        end
end


function MyRandomFactory.main(args)
        local randomFactory = MyRandomFactory.getInstance()
        local stringBuilder = StringMaker.new()
        local commonSeps = CommonSeps.getInstance()
        local size2 = 100
        for index = 0, size2 - 1 do
            stringBuilder:appendint(java_int(randomFactory:getAbsoluteNextInt(3))):append(commonSeps.COMMA)
        end
        print(tostring(stringBuilder))
        stringBuilder:delete(0, stringBuilder:length())
        local intArray = java_typed_array("I", java_new_array(0, 52))
        local intArray2 = java_typed_array("I", java_new_array(0, 52))
        local size = (intArray.n or #intArray)
        for index = 0, size - 1 do
            intArray[index + 1] = index
            intArray2[index + 1] = index
        end
        randomFactory:shuffle2(intArray, intArray2)
        for index = 0, size - 1 do
            stringBuilder:appendint(intArray[index + 1]):append(commonSeps.COMMA)
        end
        print(tostring(stringBuilder))
        stringBuilder:delete(0, stringBuilder:length())
        for index = 0, size - 1 do
            stringBuilder:appendint(intArray2[index + 1]):append(commonSeps.COMMA)
        end
        print(tostring(stringBuilder))
        local found = false
        for index = 0, size - 1 do
            found = false
            for index2 = 0, size - 1 do
                if intArray[index2 + 1] == index then
                    found = true
                end
            end
            if not found then
                error(require("java.lang.RuntimeException").new(), 0)
            end
        end
end

MyRandomFactory.instance_f = MyRandomFactory.new()

return MyRandomFactory

