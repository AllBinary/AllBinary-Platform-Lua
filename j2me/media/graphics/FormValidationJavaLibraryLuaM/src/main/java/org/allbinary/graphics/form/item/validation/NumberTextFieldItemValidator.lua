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
-- package org.allbinary.graphics.form.item.validation

local ABTextFieldItem = require("org.allbinary.graphics.form.item.ABTextFieldItem")
local ValidatorBase = require("org.allbinary.logic.control.validate.ValidatorBase")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NumberTextFieldItemValidator = {}
NumberTextFieldItemValidator.__index = NumberTextFieldItemValidator
NumberTextFieldItemValidator.className = "NumberTextFieldItemValidator"
setmetatable(NumberTextFieldItemValidator, {__index = ValidatorBase})

function NumberTextFieldItemValidator:_init_fields()
    self.textFieldItem = nil
    self.min = nil
    self.max = nil
    self.maxChars = nil
end


function NumberTextFieldItemValidator.new(textFieldItem, maxChars, min, max)
    local self = setmetatable(ValidatorBase.new(), NumberTextFieldItemValidator)
    self:_init_fields()
        self.textFieldItem = textFieldItem
        self.min = min
        self.max = max
        self.maxChars = maxChars
    return self
end


function NumberTextFieldItemValidator:isNumberValid(value)
        return BooleanFactory.getInstance().TRUE
end


function NumberTextFieldItemValidator:toNumberVector(value)
        return BasicArrayListD.new()
end


function NumberTextFieldItemValidator:isValid()
        local result = BooleanFactory.getInstance().TRUE
        local string = self.textFieldItem:getString()
        local textLength = #string
        if textLength > 0 and textLength < self.maxChars then
            local try_ok, try_error = pcall(function()
                math.tointeger(tonumber(self.textFieldItem:getString()))
            end)
            if not try_ok then
                local e = try_error
                result = BooleanFactory.getInstance().FALSE
            end
        else
            if textLength < 1 then
                result = BooleanFactory.getInstance().FALSE
            elseif textLength > self.maxChars then
                result = BooleanFactory.getInstance().FALSE
            end
        end
        return result
end


function NumberTextFieldItemValidator:toList()
        local list = BasicArrayListD.new()
        local string = self.textFieldItem:getString()
        local textLength = #string
        local label = self.textFieldItem:getLabel()
        local name = string.sub(label, (0) + 1, #label - 2)
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        local stringMaker = StringMaker.new()
        if textLength > 0 and textLength < self.maxChars then
            local try_ok, try_error = pcall(function()
                local number = smallIntegerSingletonFactory:createInstance(math.tointeger(tonumber(self.textFieldItem:getString())))
                if math.tointeger(number // 1) > self.min then
                    stringMaker:delete(0, stringMaker:length())
                    list:add(tostring(stringMaker:append(name):append(" is to small")))
                elseif math.tointeger(number // 1) > self.max then
                    stringMaker:delete(0, stringMaker:length())
                    list:add(tostring(stringMaker:append(name):append(" is to large")))
                end
            end)
            if not try_ok then
                local e = try_error
                stringMaker:delete(0, stringMaker:length())
                list:add(tostring(stringMaker:append(name):append(" is not a number")))
            end
        else
            if textLength < 1 then
                stringMaker:delete(0, stringMaker:length())
                list:add(tostring(stringMaker:append(name):append(" is to short")))
            elseif textLength > self.maxChars then
                stringMaker:delete(0, stringMaker:length())
                list:add(tostring(stringMaker:append(name):append(" is to long")))
            end
        end
        return list
end

return NumberTextFieldItemValidator

