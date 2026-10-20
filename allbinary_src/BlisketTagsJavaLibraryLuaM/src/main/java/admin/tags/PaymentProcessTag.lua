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
-- package admin.tags

-- local Method = require("java.lang.reflect.Method")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local PaymentProcessHelperFactory = require("admin.taghelpers.PaymentProcessHelperFactory")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local StoreValidationTransformTag = require("tags.StoreValidationTransformTag")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentProcessTag = {}
PaymentProcessTag.__index = PaymentProcessTag
PaymentProcessTag.className = "PaymentProcessTag"
setmetatable(PaymentProcessTag, {__index = StoreValidationTransformTag})

function PaymentProcessTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function PaymentProcessTag.new()
    local self = setmetatable(StoreValidationTransformTag.new(), PaymentProcessTag)
    self:_init_fields()
    return self
end


-- throws LicensingException, Exception
function PaymentProcessTag:process()
        local try_ok, try_error = pcall(function()
            local anyType = PaymentProcessHelperFactory.new():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local helperClass = getmetatable(anyType)
            local method = helperClass:getMethod(self.commonStrings.PROCESS, nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().LICENSINGERROR) then
                self.logUtil:put("LicensingException", self, self.commonStrings.PROCESS, e)
            end
            error(e, 0)
        end
end


-- throws JspTagException
function PaymentProcessTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.AUTHORIZEORDEREVALBODYONERROR) == 0 or self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.AUTHORIZEORDERANDEVALBODY) == 0 or self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.AUTHORIZEFORMEVALBODYONERROR) == 0 then
                self.pageContext:getOut():print(tostring(self:process()) .. "<br />")
                if self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.AUTHORIZEORDEREVALBODYONERROR) == 0 then
                    return self.SKIP_BODY
                else
                    return self.EVAL_BODY_INCLUDE
                end
            else
                error(java_exception("Exception", "No Such Payment Processing Command"), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return PaymentProcessTag

