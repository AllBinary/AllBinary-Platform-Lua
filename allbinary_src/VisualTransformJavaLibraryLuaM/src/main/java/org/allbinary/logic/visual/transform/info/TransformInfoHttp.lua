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

local TransformInfoHttp = {}
package.loaded["org.allbinary.logic.visual.transform.info.TransformInfoHttp"] = TransformInfoHttp

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
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local AbContext = java_lazy("org.allbinary.business.context.AbContext")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local FREEBLISKET_PATH_GLOBALS = java_lazy("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local RequestParams = java_lazy("org.allbinary.logic.communication.http.request.RequestParams")
local WeblisketSessionInterface = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlData = java_lazy("org.allbinary.logic.communication.sql.AbSqlData")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoObjectConfig = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransformInfo = require("org.allbinary.logic.visual.transform.info.TransformInfo")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")

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

-- class table TransformInfoHttp is declared before the requires
TransformInfoHttp.__index = TransformInfoHttp
TransformInfoHttp.className = "TransformInfoHttp"
TransformInfoHttp.javaClassName = "org.allbinary.logic.visual.transform.info.TransformInfoHttp"
setmetatable(TransformInfoHttp, {__index = TransformInfo})
TransformInfoHttp.java_implements = " TransformInfoHttpInterface "
TransformInfoHttp.java_interfaces = function() return {TransformInfoHttpInterface} end

function TransformInfoHttp:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.abContext == nil then self.abContext = nil end
end

function TransformInfoHttp._jinit(self, ...)
    local count = select("#", ...)
    if count == 3 then return TransformInfoHttp._new3(self, ...)
    elseif count == 2 then return TransformInfoHttp._new2(self, ...)
    elseif count == 1 then return TransformInfoHttp._new1(self, ...)
    end
    error("No constructor of TransformInfoHttp takes " .. count .. " arguments")
end

function TransformInfoHttp.new(...)
    local self = setmetatable({}, TransformInfoHttp)
    TransformInfoHttp._jinit(self, ...)
    return self
end

function TransformInfoHttp._new3(self, ...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or java_is(java_a1, "HashMap")) and (java_a2 == nil or java_is(java_a2, "PageContext")) and type(java_a3) == "boolean" then return TransformInfoHttp._new3_1(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "HttpServletRequest")) and (java_a2 == nil or java_is(java_a2, "HashMap")) and (java_a3 == nil or java_is(java_a3, "PageContext")) then return TransformInfoHttp._new3_2(self, ...) end
    return TransformInfoHttp._new3_3(self, ...)
end


function TransformInfoHttp._new3_1(self, propertiesHashMap, pageContext, crud)
    java_super_init(TransformInfo, self)
    TransformInfoHttp._init_fields(self)
        -- super(...) made self above
        self.abContext = AbContext.new(propertiesHashMap, pageContext)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("Properties HashMap: " .. tostring(propertiesHashMap), self, "Constructor(HashMap, PageContext, boolean)")
        end
        self:override(propertiesHashMap)
    return self
end


function TransformInfoHttp._new3_2(self, request, propertiesHashMap, pageContext)
    java_super_init(TransformInfo, self)
    TransformInfoHttp._init_fields(self)
        -- super(...) made self above
        self.abContext = AbContext.new(propertiesHashMap, pageContext)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("Properties HashMap: " .. tostring(propertiesHashMap), self, "Constructor(HttpServletRequest, HashMap, PageContext)")
        end
        self:set(RequestParams.new(request):toHashMap())
        self:override(propertiesHashMap)
    return self
end


function TransformInfoHttp._new3_3(self, databaseHashMap, propertiesHashMap, pageContext)
    java_super_init(TransformInfo, self)
    TransformInfoHttp._init_fields(self)
        -- super(...) made self above
        self.abContext = AbContext.new(propertiesHashMap, pageContext)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("Properties HashMap: " .. tostring(propertiesHashMap), self, "Constructor(HashMap, HashMap, PageContext)")
        end
        self:set(databaseHashMap)
    return self
end


function TransformInfoHttp._new2(self, propertiesHashMap, pageContext)
    java_super_init(TransformInfo, self)
    TransformInfoHttp._init_fields(self)
        -- super(...) made self above
        self.abContext = AbContext.new(propertiesHashMap, pageContext)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("Properties HashMap: " .. tostring(propertiesHashMap), self, "Constructor(HashMap, PageContext)")
        end
        self:set(propertiesHashMap)
    return self
end


function TransformInfoHttp._new1(self, parentViewOfThisTransformInfoInterface)
    java_super_init(TransformInfo, self)
    TransformInfoHttp._init_fields(self)
        -- super(...) made self above
        self.abContext = AbContext.new(parentViewOfThisTransformInfoInterface:getPropertiesHashMap(), parentViewOfThisTransformInfoInterface:getPageContext())
    return self
end


-- throws Exception
function TransformInfoHttp:set(hashMap)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF("Properties HashMap: " .. tostring(hashMap), self, "set()")
        end
        local transformInfoData = TransformInfoData.getInstance()
        self:setName(hashMap:get(transformInfoData.NAME))
        self:setStoreName(hashMap:get(StoreFrontData.getInstance().NAME))
        self:setObjectFile(hashMap:get(transformInfoData.OBJECTFILENAME))
        self:setObject(hashMap:get(transformInfoData.OBJECT))
        local stringValidationUtil = StringValidationUtil.getInstance()
        local objectConfigString = hashMap:get(transformInfoData.OBJECTCONFIG)
        if stringValidationUtil:isValidRequired(objectConfigString, 10, AbSqlData.MAXBLOB) then
            self:setObjectConfig(objectConfigString)
        else
            self:setObjectConfig(tostring(TransformInfoObjectConfig.new(self)))
        end
        if not stringValidationUtil:isEmpty(hashMap:get(transformInfoData.OBJECTCONFIGFILENAME)) then
            self:setObjectConfigFile(hashMap:get(transformInfoData.OBJECTCONFIGFILENAME))
        end
        self:setTemplateFile(hashMap:get(transformInfoData.TEMPLATEFILENAME))
        self:setTemplate(hashMap:get(transformInfoData.TEMPLATE))
        self:setDataFile(hashMap:get(transformInfoData.DATAFILENAME))
        self:setData(hashMap:get(transformInfoData.DATA))
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
            self.logUtil:putF(self:log(), self, "set()")
        end
end
java_overload(TransformInfoHttp, "set", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HashMap")) end)


function TransformInfoHttp:getWeblisketSession()
        return self.abContext:getWeblisketSession()
end
java_overload(TransformInfoHttp, "getWeblisketSession", 0)


function TransformInfoHttp:getPageContext()
        return self.abContext:getPageContext()
end
java_overload(TransformInfoHttp, "getPageContext", 0)


function TransformInfoHttp:getPropertiesHashMap()
        return self.abContext:getPropertiesHashMap()
end
java_overload(TransformInfoHttp, "getPropertiesHashMap", 0)


-- throws Exception
function TransformInfoHttp:getTemplateFilePath()
        return AbPath.new(URLGLOBALS.getMainPath() + FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH, self:getTemplateFile())
end
java_overload(TransformInfoHttp, "getTemplateFilePath", 0)


-- throws Exception
function TransformInfoHttp:getObjectConfigFilePath()
        return AbPath.new(URLGLOBALS.getMainPath() + FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH, self:getObjectConfigFile())
end
java_overload(TransformInfoHttp, "getObjectConfigFilePath", 0)


-- throws Exception
function TransformInfoHttp:getDataFilePath()
        return AbPath.new(URLGLOBALS.getMainPath() + FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH, self:getDataFile())
end
java_overload(TransformInfoHttp, "getDataFilePath", 0)

return TransformInfoHttp

