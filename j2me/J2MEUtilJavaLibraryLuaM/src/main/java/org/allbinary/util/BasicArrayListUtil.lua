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

local JsType = require("jsinterop.annotations.JsType")
local MyRandomFactory = require("org.allbinary.game.rand.MyRandomFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsProperty = require("jsinterop.annotations.JsProperty")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local BasicArrayListUtil = {}
BasicArrayListUtil.__index = BasicArrayListUtil
BasicArrayListUtil.className = "BasicArrayListUtil"

function BasicArrayListUtil:_init_fields()
    self.NULL_ARRAY_OF_ARRAY = java_new_array(nil, 0, 0)
    self.myRandomFactory = MyRandomFactory.getInstance()
    self.immutableInstance = ImmutableBasicArrayList.new("Immutable", 0)
end

function BasicArrayListUtil.new()
    local self = setmetatable({}, BasicArrayListUtil)
    self:_init_fields()
    return self
end


function BasicArrayListUtil.getInstance()
        return BasicArrayListUtil.instance
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

BasicArrayListUtil.instance = BasicArrayListUtil.new()

return BasicArrayListUtil

