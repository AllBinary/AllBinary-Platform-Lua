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
-- local HashMap = require("java.util.HashMap")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local PaymentHelperFactory = require("admin.taghelpers.PaymentHelperFactory")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local PaymentData = require("org.allbinary.business.user.commerce.money.payment.PaymentData")
local StdUtil = require("org.allbinary.logic.StdUtil")
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

local PaymentTag = {}
PaymentTag.__index = PaymentTag
PaymentTag.className = "PaymentTag"
setmetatable(PaymentTag, {__index = TableTag})

function PaymentTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.storeName = nil
    self.propertiesHashMap = nil
end


function PaymentTag.new()
    local self = setmetatable(TableTag.new(), PaymentTag)
    self:_init_fields()
        self:setTagHelperFactory(PaymentHelperFactory.new())
        self:setTagRequestHelperFactory(PaymentHelperFactory.new())
    return self
end


function PaymentTag:setStoreName(value)
        self.storeName = value
end


-- throws LicensingException
function PaymentTag:select()
        local try_ok, try_error = pcall(function()
            local anyType = PaymentHelperFactory.new():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("select", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws JspTagException
function PaymentTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self:isEnabled() then
                self.propertiesHashMap = StdUtil.getInstance():createHashMap()
                self.propertiesHashMap:put(StoreFrontData.getInstance().NAME, self.storeName)
                if self:getCommand() ~= nil then
                    if self:getCommand():compareTo(PaymentData.SELECT) == 0 then
                        local output = self:select()
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGEXTRAOUTPUT) then
                            self.pageContext:getOut():print(output .. "<br />")
                        end
                        return self.EVAL_BODY_INCLUDE
                    else
                        return TableTag.doStartTag(self)
                    end
                end
            end
            return self.SKIP_BODY
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return PaymentTag

