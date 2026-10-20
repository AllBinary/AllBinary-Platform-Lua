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
-- local TagSupport = require("javax.servlet.jsp.tagext.TagSupport")
local OrderHelperFactory = require("admin.taghelpers.OrderHelperFactory")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local PaymentGatewayData = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local StdUtil = require("org.allbinary.logic.StdUtil")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local CustomTagSupport = require("tags.CustomTagSupport")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OrderTag = {}
OrderTag.__index = OrderTag
OrderTag.className = "OrderTag"
setmetatable(OrderTag, {__index = CustomTagSupport})

function OrderTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.command = nil
    self.storeName = nil
    self.propertiesHashMap = nil
end


function OrderTag.new()
    local self = setmetatable(CustomTagSupport.new(), OrderTag)
    self:_init_fields()
    return self
end


function OrderTag:setCommand(command)
        self.command = command
end


function OrderTag:setStoreName(value)
        self.storeName = value
end


-- throws LicensingException
function OrderTag:process()
        local try_ok, try_error = pcall(function()
            local anyType = OrderHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local helperClass = getmetatable(anyType)
            local method = helperClass:getMethod(self.commonStrings.PROCESS, nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function OrderTag:setPaymentGateway()
        local try_ok, try_error = pcall(function()
            local anyType = OrderHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("setPaymentGateway", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws JspTagException
function OrderTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self.command ~= nil then
                self.propertiesHashMap = StdUtil.getInstance():createHashMap()
                self.propertiesHashMap:put(StoreFrontData.getInstance().NAME, self.storeName)
                if ((self.command < org.allbinary.globals.GLOBALS2.PROCESS and -1) or (self.command > org.allbinary.globals.GLOBALS2.PROCESS and 1) or 0) == 0 then
                    self:process()
                elseif ((self.command < tostring(PaymentGatewayData.NAME) and -1) or (self.command > tostring(PaymentGatewayData.NAME) and 1) or 0) == 0 then
                    if self:setPaymentGateway() == true then
                        return TagSupport.EVAL_BODY_INCLUDE
                    end
                end
            end
            return TagSupport.SKIP_BODY
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return OrderTag

