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
-- package views.admin.customizers

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local CustomizersView = require("views.admin.customizers.CustomizersView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CustomizersValidationView = {}
CustomizersValidationView.__index = CustomizersValidationView
CustomizersValidationView.className = "CustomizersValidationView"
setmetatable(CustomizersValidationView, {__index = CustomizersView})

function CustomizersValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function CustomizersValidationView.new(transformInfoInterface)
    local self = setmetatable(CustomizersView.new(transformInfoInterface), CustomizersValidationView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function CustomizersValidationView:isValid()
        local try_ok, try_error = pcall(function()
            if self.customizersVector:size() > 0 then
                return true
            else
                return false
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function CustomizersValidationView:validationInfo()
        local try_ok, try_error = pcall(function()
            return "No Customizers"
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Getting Validation Info"
        end
end


function CustomizersValidationView:toValidationInfoDoc()
        return nil
end


function CustomizersValidationView:toValidationInfoNode(document)
        return nil
end

return CustomizersValidationView

