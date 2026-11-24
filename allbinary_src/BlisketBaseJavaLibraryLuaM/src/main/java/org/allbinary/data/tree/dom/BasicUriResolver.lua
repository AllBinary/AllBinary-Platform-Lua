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

local BasicUriResolver = {}
package.loaded["org.allbinary.data.tree.dom.BasicUriResolver"] = BasicUriResolver

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local Source = require("javax.xml.transform.Source")
-- local TransformerException = require("javax.xml.transform.TransformerException")
-- local URIResolver = require("javax.xml.transform.URIResolver")
-- local StreamSource = require("javax.xml.transform.stream.StreamSource")
local FREEBLISKET_PATH_GLOBALS = java_lazy("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CryptFileReader = java_lazy("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbFilePath = java_lazy("org.allbinary.logic.io.path.AbFilePath")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local TransformInfoTemplateData = java_lazy("org.allbinary.logic.visual.transform.info.template.TransformInfoTemplateData")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local URIResolverStrings = java_lazy("org.allbinary.data.tree.dom.URIResolverStrings")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table BasicUriResolver is declared before the requires
BasicUriResolver.__index = BasicUriResolver
BasicUriResolver.className = "BasicUriResolver"
BasicUriResolver.javaClassName = "org.allbinary.data.tree.dom.BasicUriResolver"
BasicUriResolver.java_implements = " URIResolver "
BasicUriResolver.java_interfaces = function() return {URIResolver} end

function BasicUriResolver:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.uriResolverStrings = URIResolverStrings.getInstance()
    if self.extension == nil then self.extension = nil end
end


function BasicUriResolver._jinit(self, extension)
    BasicUriResolver._init_fields(self)
        self.extension = extension
    return self
end

function BasicUriResolver.new(...)
    local self = setmetatable({}, BasicUriResolver)
    BasicUriResolver._jinit(self, ...)
    return self
end


function BasicUriResolver:getExtension()
        return self.extension
end


-- throws TransformerException
function BasicUriResolver:resolve(href, base)
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(URLGLOBALS.getMainPath())
            stringBuffer:append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH)
            stringBuffer:append(href)
            local abPath = AbFilePath.new(tostring(stringBuffer))
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().XMLLOGGING) then
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(self.uriResolverStrings.ATTEMPT)
                stringBuffer:append(href)
                stringBuffer:append(self.uriResolverStrings.BASE)
                stringBuffer:append(base)
                stringBuffer:append(self.uriResolverStrings.NEW_PATH)
                stringBuffer:append(tostring(abPath))
                stringBuffer:append(self.uriResolverStrings.NOTE)
                stringBuffer:append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH)
                stringBuffer:append(self.uriResolverStrings.URL_GLOBAL)
                stringBuffer:append(self.uriResolverStrings.REQUIRED_EXTENSION)
                stringBuffer:append(self.extension)
                self.logUtil:putF(tostring(stringBuffer), self, self.uriResolverStrings.RESOLVE)
            end
            do return "__jreturn", StreamSource.new(CryptFileReader.new(TransformInfoTemplateData.getInstance().UNCRYPTED_EXTENSION, TransformInfoTemplateData.getInstance().ENCRYPTED_EXTENSION):getInputStream(abPath)) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function BasicUriResolver:toString()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(URLGLOBALS.getMainPath())
            stringBuffer:append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH)
            stringBuffer:append(self.uriResolverStrings.IMPORT_URL)
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            return "BasicUriResolver - Does not work without webapp path should be changed"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
BasicUriResolver.__tostring = function(self) return self:toString() end

return BasicUriResolver

