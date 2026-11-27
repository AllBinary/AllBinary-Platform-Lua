-- Generated Code Do Not Modify
-- package org.allbinary.animation

local FillAnimation = {}
package.loaded["org.allbinary.animation.FillAnimation"] = FillAnimation

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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local AnimationBehavior = java_lazy("org.allbinary.animation.AnimationBehavior")

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

-- class table FillAnimation is declared before the requires
FillAnimation.__index = FillAnimation
FillAnimation.className = "FillAnimation"
FillAnimation.javaClassName = "org.allbinary.animation.FillAnimation"
setmetatable(FillAnimation, {__index = IndexedAnimation})

function FillAnimation:_init_fields()
    if self.pixelBuffer == nil then self.pixelBuffer = nil end
    if self.width == nil then self.width = nil end
    if self.height == nil then self.height = nil end
end


function FillAnimation._jinit(self, pixelBuffer, width, height, animationBehavior)
    java_super_init(IndexedAnimation, self, animationBehavior)
    FillAnimation._init_fields(self)
        -- super(...) made self above
        self.width = 100
        self.height = 100
        self.pixelBuffer = pixelBuffer
    return self
end

function FillAnimation.new(...)
    local self = setmetatable({}, FillAnimation)
    FillAnimation._jinit(self, ...)
    return self
end


function FillAnimation:setBasicColorP(basicColor)
        local changed = false
        if self:getBasicColorP() == nil or math.tointeger(self:getBasicColorP() // 1) ~= math.tointeger(basicColor // 1) then
            changed = true
        end
        java_super(IndexedAnimation, "setBasicColorP", 1)(self, basicColor)
        if changed then
            self:updateModifiers()
        end
end
java_overload(FillAnimation, "setBasicColorP", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)


function FillAnimation:changeBasicColor(basicColor)
        local changed = false
        if self:getChangeBasicColor() == nil or math.tointeger(self:getChangeBasicColor() // 1) ~= math.tointeger(basicColor // 1) then
            changed = true
        end
        java_super(IndexedAnimation, "changeBasicColor", 1)(self, basicColor)
        if changed then
            self:updateModifiers()
        end
end
java_overload(FillAnimation, "changeBasicColor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)


function FillAnimation:setAlpha(alpha)
        local changed = false
        if self.alphaP ~= alpha then
            changed = true
        end
        java_super(IndexedAnimation, "setAlpha", 1)(self, alpha)
        if changed then
            self:updateModifiers()
        end
end
java_overload(FillAnimation, "setAlpha", 1, function(java_a1) return true and type(java_a1) == "number" end)


function FillAnimation:setScale(scaleX, scaleY)
end
java_overload(FillAnimation, "setScale", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function FillAnimation:setMaxScale(maxScaleX, maxScaleY)
end
java_overload(FillAnimation, "setMaxScale", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function FillAnimation:updateModifiers()
end
java_overload(FillAnimation, "updateModifiers", 0)


function FillAnimation:paint(g)
        g:drawRGB(self.pixelBuffer, 0, self.width, 0, 0, self.width, self.height, true)
end
java_overload(FillAnimation, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return FillAnimation

