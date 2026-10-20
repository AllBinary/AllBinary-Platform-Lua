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
-- package org.allbinary.data.tree.dom

-- local Source = require("javax.xml.transform.Source")
-- local TransformerException = require("javax.xml.transform.TransformerException")
-- local URIResolver = require("javax.xml.transform.URIResolver")
-- local StreamSource = require("javax.xml.transform.stream.StreamSource")
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CryptFileReader = require("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbFilePath = require("org.allbinary.logic.io.path.AbFilePath")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfoTemplateData = require("org.allbinary.logic.visual.transform.info.template.TransformInfoTemplateData")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicUriResolver = {}
BasicUriResolver.__index = BasicUriResolver
BasicUriResolver.className = "BasicUriResolver"

function BasicUriResolver:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.uriResolverStrings = URIResolverStrings.getInstance()
    self.extension = nil
end


function BasicUriResolver.new(extension)
    local self = setmetatable({}, BasicUriResolver)
    self:_init_fields()
        self.extension = extension
    return self
end


function BasicUriResolver:getExtension()
        return self.extension
end


-- throws TransformerException
function BasicUriResolver:resolve(href, base)
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.URLGLOBALS:getMainPath())
            stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH)
            stringBuffer:append(href)
            local abPath = AbFilePath.new(tostring(stringBuffer))
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().XMLLOGGING) then
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(self.uriResolverStrings.ATTEMPT)
                stringBuffer:append(href)
                stringBuffer:append(self.uriResolverStrings.BASE)
                stringBuffer:append(base)
                stringBuffer:append(self.uriResolverStrings.NEW_PATH)
                stringBuffer:append(tostring(abPath))
                stringBuffer:append(self.uriResolverStrings.NOTE)
                stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH)
                stringBuffer:append(self.uriResolverStrings.URL_GLOBAL)
                stringBuffer:append(self.uriResolverStrings.REQUIRED_EXTENSION)
                stringBuffer:append(self.extension)
                self.logUtil:putF(tostring(stringBuffer), self, self.uriResolverStrings.RESOLVE)
            end
            return StreamSource.new(CryptFileReader.new(TransformInfoTemplateData.getInstance().UNCRYPTED_EXTENSION, TransformInfoTemplateData.getInstance().ENCRYPTED_EXTENSION):getInputStream(abPath))
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


function BasicUriResolver:toString()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.URLGLOBALS:getMainPath())
            stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH)
            stringBuffer:append(self.uriResolverStrings.IMPORT_URL)
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            return "BasicUriResolver - Does not work without webapp path should be changed"
        end
end
BasicUriResolver.__tostring = function(self) return self:toString() end

return BasicUriResolver

