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

local TextItemNumberVisitor = {}
TextItemNumberVisitor.__index = TextItemNumberVisitor
TextItemNumberVisitor.className = "TextItemNumberVisitor"
setmetatable(TextItemNumberVisitor, {__index = Visitor})

function TextItemNumberVisitor:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TextItemNumberVisitor.new()
    local self = setmetatable(Visitor.new(), TextItemNumberVisitor)
    self:_init_fields()
    return self
end


function TextItemNumberVisitor:visit(anyType)
        local value = anyType
        if #value < 2 then
            local stringValidationUtil = StringValidationUtil.getInstance()
            if stringValidationUtil:isNumber(value) then
                return BooleanFactory.getInstance().TRUE
            else
                local try_ok, try_error = pcall(function()
                    TextNotificationUtil.getInstance():fireError("Numbers Only")
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

return TextItemNumberVisitor

