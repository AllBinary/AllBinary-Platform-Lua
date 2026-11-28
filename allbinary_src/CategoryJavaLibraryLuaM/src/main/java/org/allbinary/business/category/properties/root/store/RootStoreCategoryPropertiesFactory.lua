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
-- package org.allbinary.business.category.properties.root.store

local RootStoreCategoryPropertiesFactory = {}
package.loaded["org.allbinary.business.category.properties.root.store.RootStoreCategoryPropertiesFactory"] = RootStoreCategoryPropertiesFactory

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
local RootStoreCategoryProperties = java_lazy("org.allbinary.business.category.properties.root.store.RootStoreCategoryProperties")

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

-- class table RootStoreCategoryPropertiesFactory is declared before the requires
RootStoreCategoryPropertiesFactory.__index = RootStoreCategoryPropertiesFactory
RootStoreCategoryPropertiesFactory.className = "RootStoreCategoryPropertiesFactory"
RootStoreCategoryPropertiesFactory.javaClassName = "org.allbinary.business.category.properties.root.store.RootStoreCategoryPropertiesFactory"
RootStoreCategoryPropertiesFactory.java_implements = " CategoryPropertiesFactoryInterface "
RootStoreCategoryPropertiesFactory.java_interfaces = function() return {CategoryPropertiesFactoryInterface} end

function RootStoreCategoryPropertiesFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.categoryPropertiesInterface == nil then self.categoryPropertiesInterface = nil end
end

function RootStoreCategoryPropertiesFactory._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return RootStoreCategoryPropertiesFactory._new1(self, ...)
    elseif count == 2 then return RootStoreCategoryPropertiesFactory._new2(self, ...)
    end
    error("No constructor of RootStoreCategoryPropertiesFactory takes " .. count .. " arguments")
end

function RootStoreCategoryPropertiesFactory.new(...)
    local self = setmetatable({}, RootStoreCategoryPropertiesFactory)
    RootStoreCategoryPropertiesFactory._jinit(self, ...)
    return self
end

function RootStoreCategoryPropertiesFactory._new2(self, ...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "TransformInfoInterface")) and (java_a2 == nil or java_is(java_a2, "AbPath")) then return RootStoreCategoryPropertiesFactory._new2_1(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "TransformInfoInterface")) and (java_a2 == nil or java_is(java_a2, "Node")) then return RootStoreCategoryPropertiesFactory._new2_2(self, ...) end
    return RootStoreCategoryPropertiesFactory._new2_3(self, ...)
end


function RootStoreCategoryPropertiesFactory._new1(self, transformInfoInterface)
    RootStoreCategoryPropertiesFactory._init_fields(self)
        self.categoryPropertiesInterface = RootStoreCategoryProperties.new(transformInfoInterface)
    return self
end


function RootStoreCategoryPropertiesFactory._new2_1(self, transformInfoInterface, abPath)
    RootStoreCategoryPropertiesFactory._init_fields(self)
        self.categoryPropertiesInterface = RootStoreCategoryProperties.new(transformInfoInterface, abPath)
    return self
end


function RootStoreCategoryPropertiesFactory._new2_2(self, transformInfoInterface, node)
    RootStoreCategoryPropertiesFactory._init_fields(self)
        self.categoryPropertiesInterface = RootStoreCategoryProperties.new(transformInfoInterface, node)
    return self
end


function RootStoreCategoryPropertiesFactory._new2_3(self, transformInfoInterface, categoryPropertiesHashMap)
    RootStoreCategoryPropertiesFactory._init_fields(self)
        self.categoryPropertiesInterface = RootStoreCategoryProperties.new(transformInfoInterface, categoryPropertiesHashMap)
    return self
end


function RootStoreCategoryPropertiesFactory:getInstance()
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

return RootStoreCategoryPropertiesFactory

