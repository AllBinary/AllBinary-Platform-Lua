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
-- package org.allbinary.logic.visual.transform.info

local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local SearchRequest = require("org.allbinary.logic.control.search.SearchRequest")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local TransformInfoHttp = require("org.allbinary.logic.visual.transform.info.TransformInfoHttp")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoHttpSearch = {}
TransformInfoHttpSearch.__index = TransformInfoHttpSearch
TransformInfoHttpSearch.className = "TransformInfoHttpSearch"
setmetatable(TransformInfoHttpSearch, {__index = TransformInfoHttp})


function TransformInfoHttpSearch.new(searchRequest)
    local self = setmetatable(TransformInfoHttp.new(searchRequest:getPropertiesHashMap(), searchRequest:getPageContext()), TransformInfoHttpSearch)
        -- super(...) made self above
        if searchRequest:getStoreFront():getName() ~= nil then
            self:setStoreName(searchRequest:getStoreFront():getName())
        else
            self:setStoreName(StringUtil.getInstance().EMPTY_STRING)
        end
        local dataFileName = searchRequest:getXslFile()
        self:setTemplateFile(dataFileName)
    return self
end


-- throws Exception
function TransformInfoHttpSearch:getPath()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.URLGLOBALS:getMainPath())
        stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH)
        stringBuffer:append(self:getStoreName())
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        return tostring(stringBuffer)
end


-- throws Exception
function TransformInfoHttpSearch:getTemplateFilePath()
        return AbPath.new(self:getPath(), self:getTemplateFile())
end


-- throws Exception
function TransformInfoHttpSearch:getObjectConfigFilePath()
        return AbPath.new(self:getPath(), self:getObjectConfigFile())
end


-- throws Exception
function TransformInfoHttpSearch:getDataFilePath()
        return AbPath.new(self:getPath(), self:getDataFile())
end

return TransformInfoHttpSearch

