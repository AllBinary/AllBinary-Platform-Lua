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
-- package org.allbinary.game.health

local HealthBarAnimation = {}
package.loaded["org.allbinary.game.health.HealthBarAnimation"] = HealthBarAnimation

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

local Animation = require("org.allbinary.animation.Animation")
local BasicHudFactory = java_lazy("org.allbinary.game.graphics.hud.BasicHudFactory")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

-- class table HealthBarAnimation is declared before the requires
HealthBarAnimation.__index = HealthBarAnimation
HealthBarAnimation.className = "HealthBarAnimation"
HealthBarAnimation.javaClassName = "org.allbinary.game.health.HealthBarAnimation"
setmetatable(HealthBarAnimation, {__index = Animation})

function HealthBarAnimation:_init_fields()
    self.basicColorFactory = BasicColorFactory.getInstance()
    if self.x2 == nil then self.x2 = 0 end
    if self.thickness == nil then self.thickness = 0 end
    if self.location == nil then self.location = nil end
    if self.allbinaryLayer == nil then self.allbinaryLayer = nil end
end


function HealthBarAnimation._jinit(self, layerInterface, location)
    java_super_init(Animation, self)
    HealthBarAnimation._init_fields(self)
        self.allbinaryLayer = layerInterface
        self.location = location
        local basicHudFactory = BasicHudFactory.getInstance()
        if self.location ~= basicHudFactory.TOPLEFT and self.location ~= basicHudFactory.BOTTOMLEFT then
            error(require("java.lang.Exception").new("Location Not Valid"), 0)
        end
        if layerInterface:getWidth() > 40 then
            self.thickness = 3
        elseif layerInterface:getWidth() > 20 then
            self.thickness = 2
        else
            self.thickness = 1
        end
    return self
end

function HealthBarAnimation.new(...)
    local self = setmetatable({}, HealthBarAnimation)
    HealthBarAnimation._jinit(self, ...)
    return self
end


function HealthBarAnimation:onHealthChange(newX2)
        self.x2 = newX2
        local quarter = (((self.allbinaryLayer:getWidth()) // (1 << (2))))
        if self.x2 > quarter * 3 then
            self.basicColor = self.basicColorFactory.GREEN
            self.colorP = math.tointeger(self.basicColor // 1)
        elseif self.x2 > quarter * 2 then
            self.basicColor = self.basicColorFactory.YELLOW
            self.colorP = math.tointeger(self.basicColor // 1)
        elseif self.x2 > quarter then
            self.basicColor = self.basicColorFactory.ORANGE
            self.colorP = math.tointeger(self.basicColor // 1)
        else
            self.basicColor = self.basicColorFactory.RED
            self.colorP = math.tointeger(self.basicColor // 1)
        end
end
java_overload(HealthBarAnimation, "onHealthChange", 1, function(java_a1) return true and type(java_a1) == "number" end)


function HealthBarAnimation:getY()
        local basicHudFactory = BasicHudFactory.getInstance()
        if self.location == basicHudFactory.TOPLEFT then
            return self.allbinaryLayer:getViewPosition():getY() - 4
        elseif self.location == basicHudFactory.BOTTOMLEFT then
            return self.allbinaryLayer:getViewPosition():getY2() + 4
        end
        return -1
end
java_overload(HealthBarAnimation, "getY", 0)

return HealthBarAnimation

