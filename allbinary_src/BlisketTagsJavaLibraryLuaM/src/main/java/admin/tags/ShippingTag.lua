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
local ShippingHelperFactory = require("admin.taghelpers.ShippingHelperFactory")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
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

local ShippingTag = {}
ShippingTag.__index = ShippingTag
ShippingTag.className = "ShippingTag"
setmetatable(ShippingTag, {__index = CustomTagSupport})

function ShippingTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.command = nil
    self.storeName = nil
    self.propertiesHashMap = nil
end


function ShippingTag.new()
    local self = setmetatable(CustomTagSupport.new(), ShippingTag)
    self:_init_fields()
    return self
end


function ShippingTag:setCommand(command)
        self.command = command
end


function ShippingTag:setStoreName(value)
        self.storeName = value
end


-- throws LicensingException
function ShippingTag:setShippingType()
        local try_ok, try_error = pcall(function()
            local anyType = ShippingHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local addressHelperClass = getmetatable(anyType)
            local method = addressHelperClass:getMethod("setShippingType", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws JspTagException
function ShippingTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self.command ~= nil then
                self.propertiesHashMap = StdUtil.getInstance():createHashMap()
                self.propertiesHashMap:put(StoreFrontData.getInstance().NAME, self.storeName)
                if ((self.command < org.allbinary.globals.GLOBALS2.SETSHIPPINGTYPE and -1) or (self.command > org.allbinary.globals.GLOBALS2.SETSHIPPINGTYPE and 1) or 0) == 0 then
                    self:setShippingType()
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

return ShippingTag

