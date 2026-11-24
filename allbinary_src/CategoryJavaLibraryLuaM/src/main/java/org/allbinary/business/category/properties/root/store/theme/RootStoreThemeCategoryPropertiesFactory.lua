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
-- package org.allbinary.business.category.properties.root.store.theme

local RootStoreThemeCategoryPropertiesFactory = {}
package.loaded["org.allbinary.business.category.properties.root.store.theme.RootStoreThemeCategoryPropertiesFactory"] = RootStoreThemeCategoryPropertiesFactory

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
local CategoryPropertiesFactoryInterface = java_lazy("org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface")
local CategoryPropertiesInterface = java_lazy("org.allbinary.business.category.properties.CategoryPropertiesInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local RootStoreThemeCategoryProperties = java_lazy("org.allbinary.business.category.properties.root.store.theme.RootStoreThemeCategoryProperties")

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

-- class table RootStoreThemeCategoryPropertiesFactory is declared before the requires
RootStoreThemeCategoryPropertiesFactory.__index = RootStoreThemeCategoryPropertiesFactory
RootStoreThemeCategoryPropertiesFactory.className = "RootStoreThemeCategoryPropertiesFactory"
RootStoreThemeCategoryPropertiesFactory.javaClassName = "org.allbinary.business.category.properties.root.store.theme.RootStoreThemeCategoryPropertiesFactory"
RootStoreThemeCategoryPropertiesFactory.java_implements = " CategoryPropertiesFactoryInterface "
RootStoreThemeCategoryPropertiesFactory.java_interfaces = function() return {CategoryPropertiesFactoryInterface} end

function RootStoreThemeCategoryPropertiesFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.categoryPropertiesInterface == nil then self.categoryPropertiesInterface = nil end
end

function RootStoreThemeCategoryPropertiesFactory._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return RootStoreThemeCategoryPropertiesFactory._new1(self, ...)
    elseif count == 2 then return RootStoreThemeCategoryPropertiesFactory._new2(self, ...)
    end
    error("No constructor of RootStoreThemeCategoryPropertiesFactory takes " .. count .. " arguments")
end

function RootStoreThemeCategoryPropertiesFactory.new(...)
    local self = setmetatable({}, RootStoreThemeCategoryPropertiesFactory)
    RootStoreThemeCategoryPropertiesFactory._jinit(self, ...)
    return self
end

function RootStoreThemeCategoryPropertiesFactory._new2(self, ...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "TransformInfoInterface")) and (java_a2 == nil or java_is(java_a2, "AbPath")) then return RootStoreThemeCategoryPropertiesFactory._new2_1(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "TransformInfoInterface")) and (java_a2 == nil or java_is(java_a2, "Node")) then return RootStoreThemeCategoryPropertiesFactory._new2_2(self, ...) end
    return RootStoreThemeCategoryPropertiesFactory._new2_3(self, ...)
end


function RootStoreThemeCategoryPropertiesFactory._new1(self, transformInfoInterface)
    RootStoreThemeCategoryPropertiesFactory._init_fields(self)
        self.categoryPropertiesInterface = RootStoreThemeCategoryProperties.new(transformInfoInterface)
    return self
end


function RootStoreThemeCategoryPropertiesFactory._new2_1(self, transformInfoInterface, abPath)
    RootStoreThemeCategoryPropertiesFactory._init_fields(self)
        self.categoryPropertiesInterface = RootStoreThemeCategoryProperties.new(transformInfoInterface, abPath)
    return self
end


function RootStoreThemeCategoryPropertiesFactory._new2_2(self, transformInfoInterface, node)
    RootStoreThemeCategoryPropertiesFactory._init_fields(self)
        self.categoryPropertiesInterface = RootStoreThemeCategoryProperties.new(transformInfoInterface, node)
    return self
end


function RootStoreThemeCategoryPropertiesFactory._new2_3(self, transformInfoInterface, categoryPropertiesHashMap)
    RootStoreThemeCategoryPropertiesFactory._init_fields(self)
        self.categoryPropertiesInterface = RootStoreThemeCategoryProperties.new(transformInfoInterface, categoryPropertiesHashMap)
    return self
end


function RootStoreThemeCategoryPropertiesFactory:getInstance()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self.categoryPropertiesInterface end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return RootStoreThemeCategoryPropertiesFactory

