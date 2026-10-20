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

local TextNotificationUtil = require("org.allbinary.game.input.TextNotificationUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TextItemUserIdentifierVisitor = {}
TextItemUserIdentifierVisitor.__index = TextItemUserIdentifierVisitor
TextItemUserIdentifierVisitor.className = "TextItemUserIdentifierVisitor"
setmetatable(TextItemUserIdentifierVisitor, {__index = Visitor})

function TextItemUserIdentifierVisitor:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TextItemUserIdentifierVisitor.new()
    local self = setmetatable(Visitor.new(), TextItemUserIdentifierVisitor)
    self:_init_fields()
    return self
end


function TextItemUserIdentifierVisitor:visit(anyType)
        local value = anyType
        if #value < 2 then
            local charValue = string.sub(value, (0) + 1, (0) + 1)
            local stringValidationUtil = StringValidationUtil.getInstance()
            if stringValidationUtil:isNumber(value) then
                return BooleanFactory.getInstance().TRUE
            elseif self:isLetter(charValue) then
                return BooleanFactory.getInstance().TRUE
            else
                local try_ok, try_error = pcall(function()
                    TextNotificationUtil.getInstance():fireError("Only Letters & Numbers Allowed")
                end)
                if not try_ok then
                    local e = try_error
                    local commonStrings = CommonStrings.getInstance()
                    self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.VISIT, e)
                end
                return BooleanFactory.getInstance().FALSE
            end
        else
            return BooleanFactory.getInstance().FALSE
        end
end


function TextItemUserIdentifierVisitor:isLetter(charValue)
        local value = string.byte(charValue)
        return (value > 64 and value < 91) or (value > 96 and value < 123)
end

return TextItemUserIdentifierVisitor

