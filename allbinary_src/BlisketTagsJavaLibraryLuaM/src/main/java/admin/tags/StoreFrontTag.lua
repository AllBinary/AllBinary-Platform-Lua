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
local StoreFrontHelperFactory = require("admin.taghelpers.StoreFrontHelperFactory")
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

local StoreFrontTag = {}
StoreFrontTag.__index = StoreFrontTag
StoreFrontTag.className = "StoreFrontTag"
setmetatable(StoreFrontTag, {__index = CustomTagSupport})

function StoreFrontTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.command = nil
    self.storeName = nil
    self.propertiesHashMap = nil
end


function StoreFrontTag.new()
    local self = setmetatable(CustomTagSupport.new(), StoreFrontTag)
    self:_init_fields()
    return self
end


function StoreFrontTag:setCommand(command)
        self.command = command
end


function StoreFrontTag:setStoreName(value)
        self.storeName = value
end


-- throws LicensingException
function StoreFrontTag:getCurrentLocation()
        local try_ok, try_error = pcall(function()
            local anyType = StoreFrontHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local method = getmetatable(anyType):getMethod("getCurrentLocation", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws LicensingException
function StoreFrontTag:getCurrentHomeLocation()
        local try_ok, try_error = pcall(function()
            local anyType = StoreFrontHelperFactory.new():getInstance(self.propertiesHashMap, self.pageContext)
            local method = getmetatable(anyType):getMethod("getCurrentHomeLocation", nil)
            local result = method:invoke(anyType, nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws JspTagException
function StoreFrontTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if self.command ~= nil then
                self.propertiesHashMap = StdUtil.getInstance():createHashMap()
                self.propertiesHashMap:put(StoreFrontData.getInstance().NAME, self.storeName)
                if ((self.command < org.allbinary.globals.GLOBALS2.GETCURRENTLOCATION and -1) or (self.command > org.allbinary.globals.GLOBALS2.GETCURRENTLOCATION and 1) or 0) == 0 then
                    self.pageContext:getOut():print(self:getCurrentLocation())
                elseif ((self.command < org.allbinary.globals.GLOBALS2.GETCURRENTHOMELOCATION and -1) or (self.command > org.allbinary.globals.GLOBALS2.GETCURRENTHOMELOCATION and 1) or 0) == 0 then
                    self.pageContext:getOut():print(self:getCurrentHomeLocation())
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

return StoreFrontTag

