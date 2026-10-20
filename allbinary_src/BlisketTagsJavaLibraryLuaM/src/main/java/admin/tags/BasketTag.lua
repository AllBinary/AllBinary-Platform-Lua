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
local BasketHelperFactory = require("admin.taghelpers.BasketHelperFactory")
local BasketRequestHelperFactory = require("admin.taghelpers.BasketRequestHelperFactory")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local BasketData = require("org.allbinary.business.user.commerce.inventory.basket.BasketData")
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

local BasketTag = {}
BasketTag.__index = BasketTag
BasketTag.className = "BasketTag"
setmetatable(BasketTag, {__index = CustomTagSupport})

function BasketTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.command = nil
    self.storeName = nil
    self.propertiesHashMap = nil
end


function BasketTag.new()
    local self = setmetatable(CustomTagSupport.new(), BasketTag)
    self:_init_fields()
    return self
end


function BasketTag:setCommand(command)
        self.command = command
end


function BasketTag:setStoreName(value)
        self.storeName = value
end


-- throws LicensingException
function BasketTag:isBasketEmpty()
        local try_ok, try_error = pcall(function()
            local anyType = BasketHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local method = getmetatable(anyType):getMethod("isBasketEmpty", nil)
            local emptyBoolean = method:invoke(anyType, nil)
            return emptyBoolean
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function BasketTag:addItemToBasket()
        local try_ok, try_error = pcall(function()
            local anyType = BasketRequestHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local method = getmetatable(anyType):getMethod("addItemToBasket", nil)
            local emptyBoolean = method:invoke(anyType, nil)
            return emptyBoolean
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function BasketTag:removeItemFromBasket()
        local try_ok, try_error = pcall(function()
            local anyType = BasketRequestHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local method = getmetatable(anyType):getMethod("removeItemFromBasket", nil)
            local emptyBoolean = method:invoke(anyType, nil)
            return emptyBoolean
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function BasketTag:adjustBasket()
        local try_ok, try_error = pcall(function()
            local anyType = BasketRequestHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local method = getmetatable(anyType):getMethod("adjustBasket", nil)
            local emptyBoolean = method:invoke(anyType, nil)
            return emptyBoolean
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws JspTagException
function BasketTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self.command ~= nil then
                self.propertiesHashMap = StdUtil.getInstance():createHashMap()
                self.propertiesHashMap:put(StoreFrontData.getInstance().NAME, self.storeName)
                if ((self.command < BasketData.INSERT and -1) or (self.command > BasketData.INSERT and 1) or 0) == 0 then
                    if not self:addItemToBasket() then
                        self.pageContext:getOut():println("Item is not currently being sold.<p/>")
                    end
                elseif ((self.command < BasketData.DELETE and -1) or (self.command > BasketData.DELETE and 1) or 0) == 0 then
                    self:removeItemFromBasket()
                elseif ((self.command < BasketData.ADJUST and -1) or (self.command > BasketData.ADJUST and 1) or 0) == 0 then
                    self:adjustBasket()
                elseif ((self.command < BasketData.ISEMPTY and -1) or (self.command > BasketData.ISEMPTY and 1) or 0) == 0 then
                    if self:isBasketEmpty() then
                        return self.EVAL_BODY_INCLUDE
                    else
                        return self.SKIP_BODY
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

return BasketTag

