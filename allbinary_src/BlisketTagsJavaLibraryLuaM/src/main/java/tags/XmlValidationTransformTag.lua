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
-- package tags

-- local Method = require("java.lang.reflect.Method")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local TransformTag = require("tags.TransformTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local XmlValidationTransformTag = {}
XmlValidationTransformTag.__index = XmlValidationTransformTag
XmlValidationTransformTag.className = "XmlValidationTransformTag"
setmetatable(XmlValidationTransformTag, {__index = TransformTag})

function XmlValidationTransformTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function XmlValidationTransformTag.new()
    local self = setmetatable(TransformTag.new(), XmlValidationTransformTag)
    self:_init_fields()
    return self
end


-- throws Exception
function XmlValidationTransformTag:isValid()
        local try_ok, try_error = pcall(function()
            local helperClass = getmetatable(self:getHelper())
            local method = helperClass:getMethod(self.commonStrings.IS_VALID, nil)
            local result = method:invoke(self:getHelper(), nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.IS_VALID, e)
            end
            error(e, 0)
        end
end


-- throws JspTagException
function XmlValidationTransformTag:doStartTag()
        local try_ok, try_error = pcall(function()
            self:setHelper()
            if self:isValid() then
                TransformTag.doStartTag(self)
                return self.EVAL_BODY_INCLUDE
            else
                TransformTag.doStartTag(self)
                return self.SKIP_BODY
            end
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return XmlValidationTransformTag

