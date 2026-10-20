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

local TextFieldItemValidator = {}
TextFieldItemValidator.__index = TextFieldItemValidator
TextFieldItemValidator.className = "TextFieldItemValidator"
setmetatable(TextFieldItemValidator, {__index = ValidatorBase})

function TextFieldItemValidator:_init_fields()
    self.textFieldItem = nil
    self.min = nil
    self.max = nil
    self.allowOnEmpty = nil
end


function TextFieldItemValidator.new(textFieldItem, min, max, allowOnEmpty)
    local self = setmetatable(ValidatorBase.new(), TextFieldItemValidator)
    self:_init_fields()
        self.textFieldItem = textFieldItem
        self.min = min
        self.max = max
        self.allowOnEmpty = allowOnEmpty
    return self
end


function TextFieldItemValidator:isValid()
        local booleanFactory = BooleanFactory.getInstance()
        local result = booleanFactory.TRUE
        local string = self.textFieldItem:getString()
        local textLength = #string
        if (textLength == 0 and self.allowOnEmpty) or textLength > self.min and textLength < self.max then
        else
            if textLength < self.min then
                result = booleanFactory.FALSE
            elseif textLength > self.max then
                result = booleanFactory.FALSE
            end
        end
        return result
end


function TextFieldItemValidator:toList()
        local list = BasicArrayListD.new()
        local string = self.textFieldItem:getString()
        local textLength = #string
        if textLength > self.min and textLength < self.max then
        else
            local label = self.textFieldItem:getLabel()
            local name = string.sub(label, (0) + 1, #label - 2)
            if textLength < self.min then
                list:add(tostring(StringMaker.new():append(name):append(" is to short")))
            elseif textLength > self.max then
                list:add(tostring(StringMaker.new():append(name):append(" is to long")))
            end
        end
        return list
end

return TextFieldItemValidator

