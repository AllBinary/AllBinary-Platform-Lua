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
-- package org.allbinary.business.category.properties.root.store.theme

-- local HashMap = require("java.util.HashMap")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local RootStoreCategoryProperties = require("org.allbinary.business.category.properties.root.store.RootStoreCategoryProperties")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local TransformInfoHttpStoreInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpStoreInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RootStoreThemeCategoryProperties = {}
RootStoreThemeCategoryProperties.__index = RootStoreThemeCategoryProperties
RootStoreThemeCategoryProperties.className = "RootStoreThemeCategoryProperties"
setmetatable(RootStoreThemeCategoryProperties, {__index = RootStoreCategoryProperties})

function RootStoreThemeCategoryProperties.new(...)
    local count = select("#", ...)
    if count == 1 then return RootStoreThemeCategoryProperties._new1(...)
    elseif count == 2 then return RootStoreThemeCategoryProperties._new2(...)
    elseif count == 2 then return RootStoreThemeCategoryProperties._new2(...)
    elseif count == 2 then return RootStoreThemeCategoryProperties._new2(...)
    end
end


function RootStoreThemeCategoryProperties._new1(transformInfoInterface)
    local self = setmetatable(RootStoreCategoryProperties.new(transformInfoInterface), RootStoreThemeCategoryProperties)
        -- super(...) made self above
    return self
end


function RootStoreThemeCategoryProperties._new2(transformInfoInterface, abPath)
    local self = setmetatable(RootStoreCategoryProperties.new(transformInfoInterface, abPath), RootStoreThemeCategoryProperties)
        -- super(...) made self above
    return self
end


function RootStoreThemeCategoryProperties._new2(transformInfoInterface, node)
    local self = setmetatable(RootStoreCategoryProperties.new(transformInfoInterface, node), RootStoreThemeCategoryProperties)
        -- super(...) made self above
    return self
end


function RootStoreThemeCategoryProperties._new2(transformInfoInterface, categoryPropertiesHashMap)
    local self = setmetatable(RootStoreCategoryProperties.new(transformInfoInterface, categoryPropertiesHashMap), RootStoreThemeCategoryProperties)
        -- super(...) made self above
    return self
end


-- throws Exception
function RootStoreThemeCategoryProperties:initPath()
        local transformInfoHttpStoreInterface = self.transformInfoInterface
        local storeFrontInterface = StoreFrontFactory.getInstance(transformInfoHttpStoreInterface:getStoreName())
        local stringBuffer = StringMaker.new()
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH)
        stringBuffer:append(storeFrontInterface:getName())
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().THEMEPATH)
        local abPath = AbPath.new(tostring(stringBuffer), StringUtil.getInstance().EMPTY_STRING)
        local httpServletRequest = transformInfoHttpStoreInterface:getPageContext():getRequest()
        self.webAppAbPath = AbPath.new(tostring(httpServletRequest:getContextPath()) .. tostring(abPath), StringUtil.getInstance().EMPTY_STRING)
        self:setRootFilePath(AbPath.new(tostring(self.URLGLOBALS:getMainPath()) .. tostring(abPath), StringUtil.getInstance().EMPTY_STRING))
end

return RootStoreThemeCategoryProperties

