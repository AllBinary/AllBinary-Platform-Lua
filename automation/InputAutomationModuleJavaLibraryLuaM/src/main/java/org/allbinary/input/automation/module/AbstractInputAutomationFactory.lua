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
-- package org.allbinary.input.automation.module

local AbstractInputAutomationFactory = {}
package.loaded["org.allbinary.input.automation.module.AbstractInputAutomationFactory"] = AbstractInputAutomationFactory

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

-- local URL = require("java.net.URL")
-- local HelpSet = require("javax.help.HelpSet")
-- local JPanel = require("javax.swing.JPanel")
local JavaHelpUtil = java_lazy("org.allbinary.logic.java.help.JavaHelpUtil")
local InputAutomationModuleFactoryInterface = require("org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface")

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

-- class table AbstractInputAutomationFactory is declared before the requires
AbstractInputAutomationFactory.__index = AbstractInputAutomationFactory
AbstractInputAutomationFactory.className = "AbstractInputAutomationFactory"
AbstractInputAutomationFactory.javaClassName = "org.allbinary.input.automation.module.AbstractInputAutomationFactory"
setmetatable(AbstractInputAutomationFactory, {__index = InputAutomationModuleFactoryInterface})

function AbstractInputAutomationFactory:_init_fields()
    if self.name_f == nil then self.name_f = nil end
    if self.jPanel == nil then self.jPanel = nil end
    if self.helpSet == nil then self.helpSet = nil end
end

function AbstractInputAutomationFactory._jinit(self, ...)
    local count = select("#", ...)
    if count == 3 then return AbstractInputAutomationFactory._new3(self, ...)
    elseif count == 2 then return AbstractInputAutomationFactory._new2(self, ...)
    end
    error("No constructor of AbstractInputAutomationFactory takes " .. count .. " arguments")
end

function AbstractInputAutomationFactory.new(...)
    local self = setmetatable({}, AbstractInputAutomationFactory)
    AbstractInputAutomationFactory._jinit(self, ...)
    return self
end


function AbstractInputAutomationFactory._new3(self, name, jPanel, helpSet)
    java_super_init(InputAutomationModuleFactoryInterface, self)
    AbstractInputAutomationFactory._init_fields(self)
        self.name_f = name
        self.jPanel = jPanel
        self.helpSet = helpSet
    return self
end


function AbstractInputAutomationFactory._new2(self, name, jPanel)
    java_super_init(InputAutomationModuleFactoryInterface, self)
    AbstractInputAutomationFactory._init_fields(self)
        self.name_f = name
        self.jPanel = jPanel
        local url = require("java.lang.ClassLoader").classResource(getmetatable(self), "/help/Help.hs", false)
        self.helpSet = JavaHelpUtil.getInstance():getHelpSet(url)
    return self
end


function AbstractInputAutomationFactory:getName()
        return self.name_f
end
java_overload(AbstractInputAutomationFactory, "getName", 0)


function AbstractInputAutomationFactory:getConfigurationJPanel()
        return self.jPanel
end
java_overload(AbstractInputAutomationFactory, "getConfigurationJPanel", 0)


function AbstractInputAutomationFactory:getHelpSet()
        return self.helpSet
end
java_overload(AbstractInputAutomationFactory, "getHelpSet", 0)

return AbstractInputAutomationFactory

