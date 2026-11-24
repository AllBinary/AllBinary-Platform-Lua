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

local BasicArrayListUtil = {}
package.loaded["org.allbinary.util.BasicArrayListUtil"] = BasicArrayListUtil

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
local MyRandomFactory = java_lazy("org.allbinary.game.rand.MyRandomFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local JsProperty = java_lazy("jsinterop.annotations.JsProperty")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local ImmutableBasicArrayList = java_lazy("org.allbinary.util.ImmutableBasicArrayList")

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

-- class table BasicArrayListUtil is declared before the requires
BasicArrayListUtil.__index = BasicArrayListUtil
BasicArrayListUtil.className = "BasicArrayListUtil"
BasicArrayListUtil.javaClassName = "org.allbinary.util.BasicArrayListUtil"

function BasicArrayListUtil:_init_fields()
    self.NULL_ARRAY_OF_ARRAY = java_new_array(nil, 0, 0)
    self.myRandomFactory = MyRandomFactory.getInstance()
    self.immutableInstance = ImmutableBasicArrayList.new("Immutable", 0)
end

function BasicArrayListUtil._jinit(self)
    BasicArrayListUtil._init_fields(self)
    return self
end

function BasicArrayListUtil.new()
    return BasicArrayListUtil._jinit(setmetatable({}, BasicArrayListUtil))
end


function BasicArrayListUtil.getInstance()
        return BasicArrayListUtil.instance_f
end


function BasicArrayListUtil:getRandom(list)
        local i_random = self:getRandomIndex(list)
        return list.objectArray[i_random + 1]
end


function BasicArrayListUtil:getRandomIndex(list)
        return self.myRandomFactory:getAbsoluteNextInt(list:size())
end


function BasicArrayListUtil:reverse(list)
        local lastMinusOneIndex = list:size() - 2
        local temp = nil
        local size = java_idiv(lastMinusOneIndex, 2)
        local secondSwapIndex = 0
        for index = 0, size do
            secondSwapIndex = lastMinusOneIndex - index
            temp = list:removeAt(index)
            list:addAt(index, list:removeAt(secondSwapIndex))
            list:addAt(secondSwapIndex + 1, temp)
        end
end


function BasicArrayListUtil:log(list)
        local S_LABEL = " s: "
        local size = list:size()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(CommonLabels.getInstance().TOTAL_LABEL)
        stringBuffer:appendint(size)
        for index = size - 1, 0, -1 do
            local usedList = list.objectArray[index + 1]
            stringBuffer:append(S_LABEL)
            stringBuffer:appendint(usedList:size())
        end
        return tostring(stringBuffer)
end


function BasicArrayListUtil:getImmutableInstance()
        return self.immutableInstance
end


function BasicArrayListUtil.main(args)
        local commonPhoneStrings = CommonPhoneStrings.getInstance()
        local list = BasicArrayListD.new()
        list:add(commonPhoneStrings.ONE)
        list:add(commonPhoneStrings.TWO)
        list:add(commonPhoneStrings.THREE)
        list:add(commonPhoneStrings.FOUR)
        list:add(commonPhoneStrings.FIVE)
        list:add(commonPhoneStrings.SIX)
        list:add(commonPhoneStrings.SEVEN)
        list:add(commonPhoneStrings.EIGHT)
        list:add(commonPhoneStrings.NINE)
        BasicArrayListUtil.getInstance():reverse(list)
        print(tostring(list))
end

BasicArrayListUtil.instance_f = BasicArrayListUtil.new()

return BasicArrayListUtil

