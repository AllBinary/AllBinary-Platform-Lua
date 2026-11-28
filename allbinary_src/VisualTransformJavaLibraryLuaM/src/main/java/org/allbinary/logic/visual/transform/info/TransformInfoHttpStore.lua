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

local TransformInfoHttpStore = {}
package.loaded["org.allbinary.logic.visual.transform.info.TransformInfoHttpStore"] = TransformInfoHttpStore

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
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local FREEBLISKET_PATH_GLOBALS = java_lazy("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransformInfoHttp = require("org.allbinary.logic.visual.transform.info.TransformInfoHttp")
local TransformInfoHttpStoreInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpStoreInterface")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table TransformInfoHttpStore is declared before the requires
TransformInfoHttpStore.__index = TransformInfoHttpStore
TransformInfoHttpStore.className = "TransformInfoHttpStore"
TransformInfoHttpStore.javaClassName = "org.allbinary.logic.visual.transform.info.TransformInfoHttpStore"
setmetatable(TransformInfoHttpStore, {__index = TransformInfoHttp})
TransformInfoHttpStore.java_implements = " TransformInfoHttpStoreInterface "
TransformInfoHttpStore.java_interfaces = function() return {TransformInfoHttpStoreInterface} end

function TransformInfoHttpStore:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function TransformInfoHttpStore._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return TransformInfoHttpStore._new2(self, ...)
    elseif count == 3 then return TransformInfoHttpStore._new3(self, ...)
    end
    error("No constructor of TransformInfoHttpStore takes " .. count .. " arguments")
end

function TransformInfoHttpStore.new(...)
    local self = setmetatable({}, TransformInfoHttpStore)
    TransformInfoHttpStore._jinit(self, ...)
    return self
end

function TransformInfoHttpStore._new3(self, ...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or java_is(java_a1, "HashMap")) and (java_a2 == nil or java_is(java_a2, "HashMap")) and (java_a3 == nil or java_is(java_a3, "PageContext")) then return TransformInfoHttpStore._new3_1(self, ...) end
    return TransformInfoHttpStore._new3_2(self, ...)
end


function TransformInfoHttpStore._new2(self, propertiesHashMap, pageContext)
    java_super_init(TransformInfoHttp, self, propertiesHashMap, pageContext, true)
    TransformInfoHttpStore._init_fields(self)
        -- super(...) made self above
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("Properties HashMap: ") .. require("allbinary_java").to_string(tostring(propertiesHashMap)), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function TransformInfoHttpStore._new3_1(self, databaseHashMap, propertiesHashMap, pageContext)
    java_super_init(TransformInfoHttp, self, databaseHashMap, propertiesHashMap, pageContext)
    TransformInfoHttpStore._init_fields(self)
        -- super(...) made self above
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Database HashMap: ")
            stringBuffer:append(tostring(databaseHashMap))
            stringBuffer:append("\nProperties HashMap: ")
            stringBuffer:append(tostring(propertiesHashMap))
            self.logUtil:putF(tostring(stringBuffer), self, "Constructor(HashMap, HashMap , PageContext)")
        end
        self:setStoreName(databaseHashMap:get(StoreFrontData.getInstance().NAME))
    return self
end


function TransformInfoHttpStore._new3_2(self, storeFrontInterface, propertiesHashMap, pageContext)
    java_super_init(TransformInfoHttp, self, propertiesHashMap, pageContext)
    TransformInfoHttpStore._init_fields(self)
        -- super(...) made self above
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("Properties HashMap: ") .. require("allbinary_java").to_string(tostring(propertiesHashMap)), self, self.commonStrings.CONSTRUCTOR)
        end
        self:setStoreName(storeFrontInterface:getName())
    return self
end


-- throws Exception
function TransformInfoHttpStore:getPath()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(URLGLOBALS.getMainPath())
        stringBuffer:append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH)
        stringBuffer:append(self:getStoreName())
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        return tostring(stringBuffer)
end
java_overload(TransformInfoHttpStore, "getPath", 0)


-- throws Exception
function TransformInfoHttpStore:getTemplateFilePath()
        return AbPath.new(self:getPath(), self:getTemplateFile())
end
java_overload(TransformInfoHttpStore, "getTemplateFilePath", 0)


-- throws Exception
function TransformInfoHttpStore:getObjectConfigFilePath()
        return AbPath.new(self:getPath(), self:getObjectConfigFile())
end
java_overload(TransformInfoHttpStore, "getObjectConfigFilePath", 0)


-- throws Exception
function TransformInfoHttpStore:getDataFilePath()
        return AbPath.new(self:getPath(), self:getDataFile())
end
java_overload(TransformInfoHttpStore, "getDataFilePath", 0)


function TransformInfoHttpStore:setStoreName(value)
        java_super(TransformInfoHttp, "setStoreName", 1)(self, value)
end
java_overload(TransformInfoHttpStore, "setStoreName", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TransformInfoHttpStore:getStoreName()
        return java_super(TransformInfoHttp, "getStoreName", 0)(self)
end
java_overload(TransformInfoHttpStore, "getStoreName", 0)

return TransformInfoHttpStore

