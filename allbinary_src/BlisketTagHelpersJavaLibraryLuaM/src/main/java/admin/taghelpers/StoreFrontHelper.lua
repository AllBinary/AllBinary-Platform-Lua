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
-- package admin.taghelpers

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFront = require("org.allbinary.business.context.modules.storefront.StoreFront")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Replace = require("org.allbinary.logic.string.regex.replace.Replace")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local TagHelper = require("admin.taghelpers.TagHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreFrontHelper = {}
StoreFrontHelper.__index = StoreFrontHelper
StoreFrontHelper.className = "StoreFrontHelper"
setmetatable(StoreFrontHelper, {__index = TagHelper})

function StoreFrontHelper:_init_fields()
    self.storeFrontInterface = nil
    self.currentLocation = nil
    self.currentHomeLocation = nil
end


function StoreFrontHelper.new(hashMap, pageContext)
    local self = setmetatable(TagHelper.new(), StoreFrontHelper)
    self:_init_fields()
        local storeName = hashMap:get(StoreFrontData.getInstance().NAME)
        if storeName ~= nil then
            self.storeFrontInterface = StoreFrontFactory.getInstance(storeName)
            self.currentLocation = Replace.new(CommonSeps.getInstance().SPACE, "%20"):all(self.storeFrontInterface:getCurrentHostName() + self.storeFrontInterface:getCurrentHostNamePath())
            self.currentHomeLocation = Replace.new(CommonSeps.getInstance().SPACE, "%20"):all(self.storeFrontInterface:getCurrentHomeHostName() + self.storeFrontInterface:getCurrentHomeHostNamePath())
        else
            local stringUtil = StringUtil.getInstance()
            self.storeFrontInterface = StoreFront.new()
            self.currentLocation = stringUtil.EMPTY_STRING
            self.currentHomeLocation = stringUtil.EMPTY_STRING
        end
    return self
end


function StoreFrontHelper:getCurrentLocation()
        return self.currentLocation
end


function StoreFrontHelper:getCurrentHomeLocation()
        return self.currentHomeLocation
end

return StoreFrontHelper

