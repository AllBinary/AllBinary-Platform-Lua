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
local QuoteHelperFactory = require("admin.taghelpers.QuoteHelperFactory")
local QuoteRequestHelperFactory = require("admin.taghelpers.QuoteRequestHelperFactory")
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

local QuoteRequestTag = {}
QuoteRequestTag.__index = QuoteRequestTag
QuoteRequestTag.className = "QuoteRequestTag"
setmetatable(QuoteRequestTag, {__index = TableTag})

function QuoteRequestTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.storeName = nil
end


function QuoteRequestTag.new()
    local self = setmetatable(TableTag.new(), QuoteRequestTag)
    self:_init_fields()
        self:setTagHelperFactory(QuoteHelperFactory.new())
        self:setTagRequestHelperFactory(QuoteRequestHelperFactory.new())
    return self
end


function QuoteRequestTag:setStoreName(storeName)
        self.storeName = storeName
end


-- throws LicensingException
function QuoteRequestTag:email()
        local try_ok, try_error = pcall(function()
            local anyType = QuoteHelperFactory.new():getInstance(self:getPropertiesHashMap(), self.pageContext)
            local helperClass = getmetatable(anyType)
            local method = helperClass:getMethod("email", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws JspTagException
function QuoteRequestTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self:getCommand() ~= nil then
                self:getPropertiesHashMap():put(StoreFrontData.getInstance().NAME, self.storeName)
                if self:getCommand():compareTo("EMAIL") == 0 then
                    self:email()
                    return self.EVAL_BODY_INCLUDE
                else
                    return TableTag.doStartTag(self)
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

return QuoteRequestTag

