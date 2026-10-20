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
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local ValidatedViewHelperFactory = require("taghelpers.ValidatedViewHelperFactory")
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

local ValidationTransformTag = {}
ValidationTransformTag.__index = ValidationTransformTag
ValidationTransformTag.className = "ValidationTransformTag"
setmetatable(ValidationTransformTag, {__index = TransformTag})

function ValidationTransformTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.xslFile = nil
    self.logic = nil
end


function ValidationTransformTag.new()
    local self = setmetatable(TransformTag.new(ValidatedViewHelperFactory.new()), ValidationTransformTag)
    self:_init_fields()
        -- super(...) made self above
        self.logic = true
    return self
end


function ValidationTransformTag:setXsl(value)
        self.xslFile = value
        self:setTemplateFile(self.xslFile)
end


function ValidationTransformTag:setLogic(logic)
        self.logic = logic
end


-- throws Exception
function ValidationTransformTag:isValid()
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


-- throws Exception
function ValidationTransformTag:validationInfo()
        local try_ok, try_error = pcall(function()
            local addressHelperClass = getmetatable(self:getHelper())
            local method = addressHelperClass:getMethod("validationInfo", nil)
            local result = method:invoke(self:getHelper(), nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "validationInfo()", e)
            end
            error(e, 0)
        end
end


-- throws JspTagException
function ValidationTransformTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                local stringBuffer = StringMaker.new()
                local request = self.pageContext:getRequest()
                stringBuffer:append("ValidationViewTag Start For: ")
                stringBuffer:append(self:getName())
                stringBuffer:append("\nView FIle: ")
                stringBuffer:append(self:getObjectFile())
                stringBuffer:append("\nRequest URI: ")
                stringBuffer:append(request:getRequestURI())
                self.logUtil:putF(tostring(stringBuffer), self, self.tagStrings.DO_START_TAG)
            end
            self:setHelper()
            if self:isValid() then
                TransformTag.doStartTag(self)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("View File: ")
                    stringBuffer:append(self:getObjectFile())
                    stringBuffer:append("\nLogic includes body if true=")
                    stringBuffer:appendboolean(self.logic)
                    self.logUtil:putF(tostring(stringBuffer), self, self.tagStrings.DO_START_TAG)
                end
                if self.logic then
                    return self.EVAL_BODY_INCLUDE
                else
                    return self.SKIP_BODY
                end
            else
                self.pageContext:getOut():print(self:validationInfo())
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("View File: ")
                    stringBuffer:append(self:getObjectFile())
                    stringBuffer:append("\nisValid()=false")
                    stringBuffer:append("\nLogic skips body if true=")
                    stringBuffer:appendboolean(self.logic)
                    self.logUtil:putF(tostring(stringBuffer), self, self.tagStrings.DO_START_TAG)
                end
                if self.logic then
                    return self.SKIP_BODY
                else
                    return self.EVAL_BODY_INCLUDE
                end
            end
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end


function ValidationTransformTag:doEndTag()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
            self.logUtil:putF("Tag Ended", self, "doEndTag")
        end
        self.logic = true
        return TransformTag.doEndTag(self)
end

return ValidationTransformTag

