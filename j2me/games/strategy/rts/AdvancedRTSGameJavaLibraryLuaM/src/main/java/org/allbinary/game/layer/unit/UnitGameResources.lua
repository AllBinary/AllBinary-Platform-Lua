-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer.unit

local UnitGameResources = {}
package.loaded["org.allbinary.game.layer.unit.UnitGameResources"] = UnitGameResources

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

local BasicGameResources = require("org.allbinary.game.layer.resources.BasicGameResources")
local GameGraphicsResourceUtil = java_lazy("org.allbinary.game.layer.resources.GameGraphicsResourceUtil")
local AndroidUtil = java_lazy("org.allbinary.AndroidUtil")
local GraphicsFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.GraphicsFeatureFactory")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")

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

-- class table UnitGameResources is declared before the requires
UnitGameResources.__index = UnitGameResources
UnitGameResources.className = "UnitGameResources"
UnitGameResources.javaClassName = "org.allbinary.game.layer.unit.UnitGameResources"
setmetatable(UnitGameResources, {__index = BasicGameResources})

function UnitGameResources:_init_fields()
    self.NAME = StringUtil.getInstance().EMPTY_STRING
    self.RESOURCE_ICON_ANIMATION = StringUtil.getInstance().EMPTY_STRING
    self.RESOURCE_ICON_BUILD = StringUtil.getInstance().EMPTY_STRING
    self.RESOURCE_ICON = StringUtil.getInstance().EMPTY_STRING
    self.ICON_SIZE = "_64_by_64.png"
end


function UnitGameResources._jinit(self)
    java_super_init(BasicGameResources, self)
    UnitGameResources._init_fields(self)
    return self
end

function UnitGameResources.new(...)
    local self = setmetatable({}, UnitGameResources)
    UnitGameResources._jinit(self, ...)
    return self
end


-- throws Exception
function UnitGameResources:append(ROOT, sizeString)
        java_super(BasicGameResources, "append", 2)(self, ROOT, sizeString)
        local string_ = GameGraphicsResourceUtil.getInstance():getName()
        BasicGameResources.stringBuffer:delete(0, BasicGameResources.stringBuffer:length())
        BasicGameResources.stringBuffer:append(ROOT)
        BasicGameResources.stringBuffer:append(UnitGameResources.DESTROY)
        BasicGameResources.stringBuffer:append(string_)
        BasicGameResources.stringBuffer:append(sizeString)
        self.RESOURCE_DESTROY = tostring(BasicGameResources.stringBuffer)
        BasicGameResources.stringBuffer:delete(0, BasicGameResources.stringBuffer:length())
        BasicGameResources.stringBuffer:append(UnitGameResources.ICON)
        BasicGameResources.stringBuffer:append(ROOT)
        self.RESOURCE_ICON_ANIMATION = tostring(BasicGameResources.stringBuffer)
        BasicGameResources.stringBuffer:delete(0, BasicGameResources.stringBuffer:length())
        BasicGameResources.stringBuffer:append(ROOT)
        BasicGameResources.stringBuffer:append(UnitGameResources.ICON)
        BasicGameResources.stringBuffer:append(string_)
        BasicGameResources.stringBuffer:append(self.ICON_SIZE)
        self.RESOURCE_ICON = tostring(BasicGameResources.stringBuffer)
        BasicGameResources.stringBuffer:delete(0, BasicGameResources.stringBuffer:length())
        BasicGameResources.stringBuffer:append(ROOT)
        BasicGameResources.stringBuffer:append(UnitGameResources.ICON_BUILD)
        BasicGameResources.stringBuffer:append(string_)
        BasicGameResources.stringBuffer:append(self.ICON_SIZE)
        self.RESOURCE_ICON_BUILD = tostring(BasicGameResources.stringBuffer)
end
java_overload(UnitGameResources, "append", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") end)


-- throws Exception
function UnitGameResources:getString()
        if AndroidUtil.isAndroid() then
            return GameGraphicsResourceUtil.getInstance():getStringForFeature(GraphicsFeatureFactory.getInstance().SPRITE_QUARTER_ROTATION_GRAPHICS)
        else
            return java_super(BasicGameResources, "getString", 0)(self)
        end
end
java_overload(UnitGameResources, "getString", 0)

UnitGameResources.ICON = "_icon"
UnitGameResources.BUILD = "_build"
UnitGameResources.DESTROY = "_destroy"
UnitGameResources.ICON_BUILD = require("allbinary_java").to_string("_icon") .. require("allbinary_java").to_string(UnitGameResources.BUILD)

return UnitGameResources

