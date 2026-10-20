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
local OrderItemsHelperFactory = require("admin.taghelpers.OrderItemsHelperFactory")
local OrderItemsRequestHelperFactory = require("admin.taghelpers.OrderItemsRequestHelperFactory")
local OrderHistoryData = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
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

local OrderItemsTag = {}
OrderItemsTag.__index = OrderItemsTag
OrderItemsTag.className = "OrderItemsTag"
setmetatable(OrderItemsTag, {__index = TableTag})

function OrderItemsTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.status = nil
end


function OrderItemsTag.new()
    local self = setmetatable(TableTag.new(), OrderItemsTag)
    self:_init_fields()
        self:setTagHelperFactory(OrderItemsHelperFactory.new())
        self:setTagRequestHelperFactory(OrderItemsRequestHelperFactory.new())
    return self
end


function OrderItemsTag:setStatus(value)
        self.status = value
end


-- throws LicensingException
function OrderItemsTag:setOrderStatus()
        local try_ok, try_error = pcall(function()
            local anyType = OrderItemsRequestHelperFactory.new():getInstance(self:getPropertiesHashMap(), self.pageContext)
            if self.status == nil then
                local helperClass = getmetatable(anyType)
                local method = helperClass:getMethod("setOrderStatus", nil)
                local result = method:invoke(anyType, nil)
                return result
            else
                local helperClass = getmetatable(anyType)
                local methodParams = {getmetatable(self.status)}
                local method = helperClass:getMethod("setOrderStatus", methodParams)
                local methodArgs = {self.status}
                local result = method:invoke(anyType, methodArgs)
                return result
            end
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws JspTagException
function OrderItemsTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self:isEnabled() then
                if self:getCommand() ~= nil then
                    self:getPropertiesHashMap():put(OrderHistoryData.STATUS, self.status)
                    if self:getCommand():compareTo(OrderHistoryData.SETSTATUS) == 0 then
                        self.pageContext:getOut():print(self:setOrderStatus())
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

return OrderItemsTag

