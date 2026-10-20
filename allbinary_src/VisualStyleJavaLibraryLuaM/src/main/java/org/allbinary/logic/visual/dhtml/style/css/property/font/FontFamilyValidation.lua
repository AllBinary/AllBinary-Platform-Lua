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
-- package org.allbinary.logic.visual.dhtml.style.css.property.font

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationInterface = require("org.allbinary.logic.control.validate.ValidationInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local FontFamilyView = require("org.allbinary.logic.visual.dhtml.style.css.property.font.FontFamilyView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FontFamilyValidation = {}
FontFamilyValidation.__index = FontFamilyValidation
FontFamilyValidation.className = "FontFamilyValidation"
setmetatable(FontFamilyValidation, {__index = FontFamilyView})

function FontFamilyValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function FontFamilyValidation.new(...)
    local count = select("#", ...)
    if count == 0 then return FontFamilyValidation._new0(...)
    elseif count == 1 then return FontFamilyValidation._new1(...)
    end
end


function FontFamilyValidation._new0()
    local self = setmetatable(FontFamilyView.new(), FontFamilyValidation)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function FontFamilyValidation._new1(node)
    local self = setmetatable(FontFamilyView.new(node), FontFamilyValidation)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function FontFamilyValidation:isValid()
        local try_ok, try_error = pcall(function()
            local valid = true
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("FontFamilyValidation", self, self.commonStrings.IS_VALID)
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("CssValidation: " .. tostring(valid), self, self.commonStrings.IS_VALID)
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


-- throws Exception
function FontFamilyValidation:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Css Font Family Property Validation Error")
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


-- throws Exception
function FontFamilyValidation:toValidationInfoDoc()
        return nil
end


-- throws Exception
function FontFamilyValidation:toValidationInfoNode(document)
        return nil
end

return FontFamilyValidation

