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
-- package tags.generic.order.history

-- local Method = require("java.lang.reflect.Method")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local OrderHistoryData = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local OrderHistoryHelperFactory = require("taghelpers.OrderHistoryHelperFactory")
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

local OrderHistoryTag = {}
OrderHistoryTag.__index = OrderHistoryTag
OrderHistoryTag.className = "OrderHistoryTag"
setmetatable(OrderHistoryTag, {__index = StoreValidationTransformTag})

function OrderHistoryTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.status = nil
end


function OrderHistoryTag.new()
    local self = setmetatable(StoreValidationTransformTag.new(), OrderHistoryTag)
    self:_init_fields()
    return self
end


function OrderHistoryTag:setStatus(value)
        self.status = value
end


-- throws LicensingException
function OrderHistoryTag:setOrderStatus()
        local try_ok, try_error = pcall(function()
            local anyType = OrderHistoryHelperFactory.new():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local helperClass = getmetatable(anyType)
            local method = helperClass:getMethod("setOrderStatus", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws JspTagException
function OrderHistoryTag:doStartTag()
        local try_ok, try_error = pcall(function()
            self:setName("Basic Order History View")
            self:setObjectFile("views.generic.order.history.ValidationView")
            if self:getCommand() ~= nil then
                if self:getCommand():compareTo(OrderHistoryData.SETSTATUS) == 0 then
                    self:getPropertiesHashMap():put(OrderHistoryData.STATUS, self.status)
                    self.pageContext:getOut():print(self:setOrderStatus())
                elseif self:getCommand():compareTo(org.allbinary.globals.GLOBALS2.VIEW) == 0 then
                else
                    error(java_exception("Exception", "No Such View Command: " .. tostring(self:getCommand())), 0)
                end
                return StoreValidationTransformTag.doStartTag(self)
            end
            error(java_exception("Exception", "Command Null"), 0)
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return OrderHistoryTag

