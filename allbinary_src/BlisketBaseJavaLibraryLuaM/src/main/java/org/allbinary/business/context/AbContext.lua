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
-- package org.allbinary.business.context

local AbContext = {}
package.loaded["org.allbinary.business.context.AbContext"] = AbContext

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
local WeblisketSession = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local WeblisketSessionInterface = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table AbContext is declared before the requires
AbContext.__index = AbContext
AbContext.className = "AbContext"
AbContext.javaClassName = "org.allbinary.business.context.AbContext"

function AbContext:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.propertiesHashMap == nil then self.propertiesHashMap = nil end
    if self.pageContext == nil then self.pageContext = nil end
end


function AbContext._jinit(self, propertiesHashMap, pageContext)
    AbContext._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("Properties HashMap: ") .. require("allbinary_java").to_string(tostring(propertiesHashMap)), self, self.commonStrings.CONSTRUCTOR)
        end
        self.propertiesHashMap = propertiesHashMap
        self.pageContext = pageContext
    return self
end

function AbContext.new(...)
    local self = setmetatable({}, AbContext)
    AbContext._jinit(self, ...)
    return self
end


function AbContext:getWeblisketSession()
        return WeblisketSession.new(self.propertiesHashMap, self.pageContext)
end


function AbContext:getPageContext()
        return self.pageContext
end


function AbContext:getPropertiesHashMap()
        return self.propertiesHashMap
end

return AbContext

