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
local PaymentGatewayHelperFactory = require("admin.taghelpers.PaymentGatewayHelperFactory")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local TableTag = require("admin.tags.TableTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentGatewayTag = {}
PaymentGatewayTag.__index = PaymentGatewayTag
PaymentGatewayTag.className = "PaymentGatewayTag"
setmetatable(PaymentGatewayTag, {__index = TableTag})

function PaymentGatewayTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function PaymentGatewayTag.new()
    local self = setmetatable(TableTag.new(), PaymentGatewayTag)
    self:_init_fields()
        self:setTagHelperFactory(PaymentGatewayHelperFactory.new())
        self:setTagRequestHelperFactory(PaymentGatewayHelperFactory.new())
    return self
end


-- throws LicensingException, Exception
function PaymentGatewayTag:process()
        local try_ok, try_error = pcall(function()
            local anyType = PaymentGatewayHelperFactory.new():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local helperClass = getmetatable(anyType)
            local method = helperClass:getMethod(self.commonStrings.PROCESS, nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("LicensingException", self, self.commonStrings.PROCESS, e)
            error(e, 0)
        end
end


-- throws JspTagException
function PaymentGatewayTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self:isEnabled() then
                if self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.AUTHORIZEORDEREVALBODYONERROR) == 0 or self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.AUTHORIZEORDERANDEVALBODY) == 0 or self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.AUTHORIZEFORMEVALBODYONERROR) == 0 then
                    local output = self:process()
                    do
                        self.pageContext:getOut():print(output .. "<br />")
                    end
                    if self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.AUTHORIZEORDEREVALBODYONERROR) == 0 then
                        return self.SKIP_BODY
                    else
                        return self.EVAL_BODY_INCLUDE
                    end
                else
                    return TableTag.doStartTag(self)
                end
            end
            return self.SKIP_BODY
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return PaymentGatewayTag

