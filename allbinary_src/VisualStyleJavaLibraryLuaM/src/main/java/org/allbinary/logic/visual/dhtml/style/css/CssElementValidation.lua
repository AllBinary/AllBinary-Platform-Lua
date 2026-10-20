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
-- package org.allbinary.logic.visual.dhtml.style.css

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationInterface = require("org.allbinary.logic.control.validate.ValidationInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local CssElementView = require("org.allbinary.logic.visual.dhtml.style.css.CssElementView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CssElementValidation = {}
CssElementValidation.__index = CssElementValidation
CssElementValidation.className = "CssElementValidation"
setmetatable(CssElementValidation, {__index = CssElementView})

function CssElementValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function CssElementValidation.new(...)
    local count = select("#", ...)
    if count == 0 then return CssElementValidation._new0(...)
    elseif count == 1 then return CssElementValidation._new1(...)
    end
end


function CssElementValidation._new0()
    local self = setmetatable(CssElementView.new(), CssElementValidation)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function CssElementValidation._new1(node)
    local self = setmetatable(CssElementView.new(node), CssElementValidation)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function CssElementValidation:isValid()
        local try_ok, try_error = pcall(function()
            local valid = true
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("CssElementValidation", self, self.commonStrings.IS_VALID)
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("CssElementValidation: " .. tostring(valid), self, self.commonStrings.IS_VALID)
            end
            return valid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate data", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function CssElementValidation:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self:getValue())
            stringBuffer:append(" Css Style is not valid.")
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation info error", self, "validationInfo()", e)
            end
            return "Error Validating Data"
        end
end


function CssElementValidation:toValidationInfoDoc()
        return nil
end


function CssElementValidation:toValidationInfoNode(document)
        return nil
end

return CssElementValidation

