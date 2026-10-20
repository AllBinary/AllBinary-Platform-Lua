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
local ShippingAddressHelperFactory = require("admin.taghelpers.ShippingAddressHelperFactory")
local ShippingAddressData = require("org.allbinary.business.user.address.ShippingAddressData")
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

local ShippingAddressTag = {}
ShippingAddressTag.__index = ShippingAddressTag
ShippingAddressTag.className = "ShippingAddressTag"
setmetatable(ShippingAddressTag, {__index = TableTag})

function ShippingAddressTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.value = nil
end


function ShippingAddressTag.new()
    local self = setmetatable(TableTag.new(), ShippingAddressTag)
    self:_init_fields()
        self:setTagHelperFactory(ShippingAddressHelperFactory.new())
        self:setTagRequestHelperFactory(ShippingAddressHelperFactory.new())
    return self
end


function ShippingAddressTag:setValue(value)
        self.value = value
end


-- throws LicensingException
function ShippingAddressTag:set()
        local try_ok, try_error = pcall(function()
            local anyType = ShippingAddressHelperFactory.new():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("set", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function ShippingAddressTag:setToBillingAddress()
        local try_ok, try_error = pcall(function()
            local anyType = ShippingAddressHelperFactory.new():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("setToBillingAddress", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws JspTagException
function ShippingAddressTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self:isEnabled() then
                if self:getCommand() ~= nil then
                    if self:getCommand():compareTo(ShippingAddressData.SELECT) == 0 then
                        self:set()
                        return self.EVAL_BODY_INCLUDE
                    elseif self:getCommand():compareTo(ShippingAddressData.SETTOBILLINGADDRESS) == 0 then
                        self:setToBillingAddress()
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

return ShippingAddressTag

