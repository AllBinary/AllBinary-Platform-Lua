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
-- local TagSupport = require("javax.servlet.jsp.tagext.TagSupport")
local StoreFrontsHelperFactory = require("admin.taghelpers.StoreFrontsHelperFactory")
local StoreFrontsRequestHelperFactory = require("admin.taghelpers.StoreFrontsRequestHelperFactory")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
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

local StoreFrontsTag = {}
StoreFrontsTag.__index = StoreFrontsTag
StoreFrontsTag.className = "StoreFrontsTag"
setmetatable(StoreFrontsTag, {__index = TableTag})

function StoreFrontsTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function StoreFrontsTag.new()
    local self = setmetatable(TableTag.new(), StoreFrontsTag)
    self:_init_fields()
        self:setTagHelperFactory(StoreFrontsHelperFactory.new())
        self:setTagRequestHelperFactory(StoreFrontsRequestHelperFactory.new())
    return self
end


-- throws LicensingException
function StoreFrontsTag:generateSelect()
        local try_ok, try_error = pcall(function()
            local anyType = self:getTagHelperFactoryInterface():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local method = getmetatable(anyType):getMethod("generateSelect", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function StoreFrontsTag:install()
        local try_ok, try_error = pcall(function()
            local anyType = self:getTagRequestHelperFactoryInterface():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local method = getmetatable(anyType):getMethod("install", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function StoreFrontsTag:sendStoreCreatedEmails()
        local try_ok, try_error = pcall(function()
            local anyType = self:getTagRequestHelperFactoryInterface():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local method = getmetatable(anyType):getMethod("sendStoreCreatedEmails", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws JspTagException
function StoreFrontsTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self:isEnabled() then
                if self:getCommand() ~= nil then
                    local storeFrontData = StoreFrontData.getInstance()
                    if self:getCommand():compareTo(storeFrontData.SELECT) == 0 then
                        self.pageContext:getOut():print(self:generateSelect())
                    elseif self:getCommand():compareTo(storeFrontData.INSTALL) == 0 then
                        self:getPropertiesHashMap():put("current", self:getCurrent())
                        self:getPropertiesHashMap():put("total", self:getTotal())
                        if math.tointeger(self:getCurrent() // 1) == math.tointeger(self:getTotal() // 1) then
                            return TagSupport.EVAL_BODY_INCLUDE
                        end
                        self:install()
                    elseif self:getCommand():compareTo(storeFrontData.INSTALL_COMPLETE) == 0 then
                        self:sendStoreCreatedEmails()
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

return StoreFrontsTag

