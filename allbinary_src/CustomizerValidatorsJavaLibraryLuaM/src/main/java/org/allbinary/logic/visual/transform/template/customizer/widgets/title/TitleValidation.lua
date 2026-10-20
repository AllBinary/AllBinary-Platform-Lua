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
-- package org.allbinary.logic.visual.transform.template.customizer.widgets.title

-- local HashMap = require("java.util.HashMap")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationInterface = require("org.allbinary.logic.control.validate.ValidationInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local TitleView = require("org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TitleValidation = {}
TitleValidation.__index = TitleValidation
TitleValidation.className = "TitleValidation"
setmetatable(TitleValidation, {__index = TitleView})

function TitleValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function TitleValidation.new(...)
    local count = select("#", ...)
    if count == 0 then return TitleValidation._new0(...)
    elseif count == 1 then return TitleValidation._new1(...)
    elseif count == 1 then return TitleValidation._new1(...)
    end
end


function TitleValidation._new0()
    local self = setmetatable(TitleView.new(), TitleValidation)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function TitleValidation._new1(node)
    local self = setmetatable(TitleView.new(node), TitleValidation)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function TitleValidation._new1(hashMap)
    local self = setmetatable(TitleView.new(hashMap), TitleValidation)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function TitleValidation:isValid()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("TitleValidation", self, self.commonStrings.IS_VALID)
            end
            local valid = true
            if not StringValidationUtil.getInstance():isValidRequired(self:getTitle(), 1, TitleData.getInstance().MAXLEN) then
                valid = false
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("TitleValidation: " .. tostring(valid), self, self.commonStrings.IS_VALID)
            end
            return valid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate form", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function TitleValidation:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Title is not valid.")
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
end


function TitleValidation:toValidationInfoDoc()
        return nil
end


function TitleValidation:toValidationInfoNode(document)
        return nil
end

return TitleValidation

