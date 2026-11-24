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
-- package taghelpers

local ViewHelperFactory = {}
package.loaded["taghelpers.ViewHelperFactory"] = ViewHelperFactory

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

local HashMap = java_lazy("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local HelperFactory = java_lazy("admin.taghelpers.HelperFactory")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")
local TagHelperFactoryInterface = java_lazy("admin.taghelpers.TagHelperFactoryInterface")

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

-- class table ViewHelperFactory is declared before the requires
ViewHelperFactory.__index = ViewHelperFactory
ViewHelperFactory.className = "ViewHelperFactory"
ViewHelperFactory.javaClassName = "taghelpers.ViewHelperFactory"
ViewHelperFactory.java_implements = " TagHelperFactoryInterface "
ViewHelperFactory.java_interfaces = function() return {TagHelperFactoryInterface} end


function ViewHelperFactory._jinit(self)
    return self
end

function ViewHelperFactory.new(...)
    local self = setmetatable({}, ViewHelperFactory)
    ViewHelperFactory._jinit(self, ...)
    return self
end


-- throws Exception, LicensingException
function ViewHelperFactory:getInstance(propertiesHashMap, pageContext)
        return HelperFactory.getInstance(ViewHelperFactory.FACTORYNAME, ViewHelperFactory.CLASSNAME, propertiesHashMap, pageContext)
end

ViewHelperFactory.CLASSNAME = "taghelpers.ViewHelper"
ViewHelperFactory.FACTORYNAME = "taghelpers.ViewHelperFactory"

return ViewHelperFactory

