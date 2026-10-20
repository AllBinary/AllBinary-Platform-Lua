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
-- package views

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
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

--Replace when validation node is added
local ValidationOnlyTempUtil = {}
ValidationOnlyTempUtil.__index = ValidationOnlyTempUtil
ValidationOnlyTempUtil.className = "ValidationOnlyTempUtil"

function ValidationOnlyTempUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ValidationOnlyTempUtil.getInstance()
        return ValidationOnlyTempUtil.instance
end


function ValidationOnlyTempUtil.new()
    local self = setmetatable({}, ValidationOnlyTempUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function ValidationOnlyTempUtil:view(validationComponentInterface)
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("View Name: " .. validationComponentInterface:getTransformInfoInterface():getName(), self, "view()")
            end
            return StringUtil.getInstance().EMPTY_STRING
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

ValidationOnlyTempUtil.instance = ValidationOnlyTempUtil.new()

return ValidationOnlyTempUtil

