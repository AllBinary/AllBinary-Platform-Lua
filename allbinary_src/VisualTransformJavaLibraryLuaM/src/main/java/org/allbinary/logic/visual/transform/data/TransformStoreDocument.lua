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
-- package org.allbinary.logic.visual.transform.data

local TransformStoreDocument = {}
package.loaded["org.allbinary.logic.visual.transform.data.TransformStoreDocument"] = TransformStoreDocument

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

-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontViewFactory = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontViewFactory")
local RequestParams = java_lazy("org.allbinary.logic.communication.http.request.RequestParams")
local WeblisketSession = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local SearchRequest = java_lazy("org.allbinary.logic.control.search.SearchRequest")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransformHttpRequestDocument = require("org.allbinary.logic.visual.transform.data.TransformHttpRequestDocument")

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

-- class table TransformStoreDocument is declared before the requires
TransformStoreDocument.__index = TransformStoreDocument
TransformStoreDocument.className = "TransformStoreDocument"
TransformStoreDocument.javaClassName = "org.allbinary.logic.visual.transform.data.TransformStoreDocument"
setmetatable(TransformStoreDocument, {__index = TransformHttpRequestDocument})

function TransformStoreDocument:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function TransformStoreDocument._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return TransformStoreDocument._new2(self, ...)
    elseif count == 1 then return TransformStoreDocument._new1(self, ...)
    end
    error("No constructor of TransformStoreDocument takes " .. count .. " arguments")
end

function TransformStoreDocument.new(...)
    local self = setmetatable({}, TransformStoreDocument)
    TransformStoreDocument._jinit(self, ...)
    return self
end


function TransformStoreDocument._new2(self, pageContext, weblisketSession)
    java_super_init(TransformHttpRequestDocument, self, pageContext, weblisketSession)
    TransformStoreDocument._init_fields(self)
        -- super(...) made self above
        local try_ok, try_error, try_value = pcall(function()
            local storeName = weblisketSession:getStoreName()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF("Using Session StoreName: " .. storeName, self, self.commonStrings.CONSTRUCTOR)
            end
            self:getBaseNode():appendChild(StoreFrontViewFactory.getInstance(storeName):toXmlNode(self:getDoc()))
            self:getBaseNode():appendChild(RequestParams.new(pageContext:getRequest()):toXmlNode(self:getDoc()))
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(e, 0)
        end
    return self
end


function TransformStoreDocument._new1(self, searchRequest)
    java_super_init(TransformHttpRequestDocument, self, searchRequest)
    TransformStoreDocument._init_fields(self)
        -- super(...) made self above
        local try_ok, try_error, try_value = pcall(function()
            self:getBaseNode():appendChild(StoreFrontViewFactory.getInstance(searchRequest:getStoreFront():getName()):toXmlNode(self:getDoc()))
            self:getBaseNode():appendChild(searchRequest:getParams():getParamsNode(self:getDoc()))
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(e, 0)
        end
    return self
end

return TransformStoreDocument

