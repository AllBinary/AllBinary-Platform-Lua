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

local TransformInfoHttpComposite = {}
package.loaded["org.allbinary.logic.visual.transform.info.TransformInfoHttpComposite"] = TransformInfoHttpComposite

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

-- class table TransformInfoHttpComposite is declared before the requires
TransformInfoHttpComposite.__index = TransformInfoHttpComposite
TransformInfoHttpComposite.className = "TransformInfoHttpComposite"
TransformInfoHttpComposite.javaClassName = "org.allbinary.logic.visual.transform.info.TransformInfoHttpComposite"

function TransformInfoHttpComposite:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.transformInfoInterface == nil then self.transformInfoInterface = nil end
end


function TransformInfoHttpComposite._jinit(self, transformInfoInterface)
    TransformInfoHttpComposite._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. transformInfoInterface:getName(), self, self.commonStrings.CONSTRUCTOR)
        end
        self.transformInfoInterface = transformInfoInterface
    return self
end

function TransformInfoHttpComposite.new(...)
    local self = setmetatable({}, TransformInfoHttpComposite)
    TransformInfoHttpComposite._jinit(self, ...)
    return self
end


-- throws Exception
function TransformInfoHttpComposite:getTransformInfoInterface()
        return self.transformInfoInterface
end


function TransformInfoHttpComposite:getWeblisketSession()
        return WeblisketSession.new(self:getPropertiesHashMap(), self:getPageContext())
end


function TransformInfoHttpComposite:getPageContext()
        return self.transformInfoInterface:getPageContext()
end


function TransformInfoHttpComposite:getPropertiesHashMap()
        return self.transformInfoInterface:getPropertiesHashMap()
end

return TransformInfoHttpComposite

