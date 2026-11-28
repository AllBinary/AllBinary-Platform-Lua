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

local TransformInfoHttpContext = {}
package.loaded["org.allbinary.logic.visual.transform.info.TransformInfoHttpContext"] = TransformInfoHttpContext

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
local FREEBLISKET_PATH_GLOBALS = java_lazy("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransformInfoHttp = require("org.allbinary.logic.visual.transform.info.TransformInfoHttp")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table TransformInfoHttpContext is declared before the requires
TransformInfoHttpContext.__index = TransformInfoHttpContext
TransformInfoHttpContext.className = "TransformInfoHttpContext"
TransformInfoHttpContext.javaClassName = "org.allbinary.logic.visual.transform.info.TransformInfoHttpContext"
setmetatable(TransformInfoHttpContext, {__index = TransformInfoHttp})

function TransformInfoHttpContext:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function TransformInfoHttpContext._jinit(self, ...)
    local count = select("#", ...)
    if count == 3 then return TransformInfoHttpContext._new3(self, ...)
    elseif count == 2 then return TransformInfoHttpContext._new2(self, ...)
    end
    error("No constructor of TransformInfoHttpContext takes " .. count .. " arguments")
end

function TransformInfoHttpContext.new(...)
    local self = setmetatable({}, TransformInfoHttpContext)
    TransformInfoHttpContext._jinit(self, ...)
    return self
end


function TransformInfoHttpContext._new3(self, databaseHashMap, propertiesHashMap, pageContext)
    java_super_init(TransformInfoHttp, self, databaseHashMap, propertiesHashMap, pageContext)
    TransformInfoHttpContext._init_fields(self)
        -- super(...) made self above
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Database HashMap: ")
            stringBuffer:append(tostring(databaseHashMap))
            stringBuffer:append("\nProperties HashMap: ")
            stringBuffer:append(tostring(propertiesHashMap))
            self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.CONSTRUCTOR)
        end
        self:setStoreName(StringUtil.getInstance().EMPTY_STRING)
    return self
end


function TransformInfoHttpContext._new2(self, propertiesHashMap, pageContext)
    java_super_init(TransformInfoHttp, self, propertiesHashMap, pageContext)
    TransformInfoHttpContext._init_fields(self)
        -- super(...) made self above
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("Properties HashMap: ") .. require("allbinary_java").to_string(tostring(propertiesHashMap)), self, self.commonStrings.CONSTRUCTOR)
        end
        self:setStoreName(StringUtil.getInstance().EMPTY_STRING)
    return self
end


-- throws Exception
function TransformInfoHttpContext:getPath()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(URLGLOBALS.getMainPath())
        stringBuffer:append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH)
        stringBuffer:append(FREEBLISKET_PATH_GLOBALS.getInstance().INSTALLPATH)
        stringBuffer:append(self:getStoreName())
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        return tostring(stringBuffer)
end
java_overload(TransformInfoHttpContext, "getPath", 0)


-- throws Exception
function TransformInfoHttpContext:getTemplateFilePath()
        return AbPath.new(self:getPath(), self:getTemplateFile())
end
java_overload(TransformInfoHttpContext, "getTemplateFilePath", 0)


-- throws Exception
function TransformInfoHttpContext:getObjectConfigFilePath()
        return AbPath.new(self:getPath(), self:getObjectConfigFile())
end
java_overload(TransformInfoHttpContext, "getObjectConfigFilePath", 0)


-- throws Exception
function TransformInfoHttpContext:getDataFilePath()
        return AbPath.new(self:getPath(), self:getDataFile())
end
java_overload(TransformInfoHttpContext, "getDataFilePath", 0)

return TransformInfoHttpContext

