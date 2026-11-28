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
-- package org.allbinary.game.layer.pickup

local CountedPickedUpLayerInterfaceFactory = {}
package.loaded["org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory"] = CountedPickedUpLayerInterfaceFactory

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

local Animation = java_lazy("org.allbinary.animation.Animation")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local PickedUpLayerInterfaceFactory = require("org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactory")
local CountedPickedUpLayerInterfaceFactoryInterface = require("org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactoryInterface")
local CountedPickedUpLayerInterfaceFactoryPool = java_lazy("org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactoryPool")
local IconLayer = java_lazy("org.allbinary.game.layer.pickup.IconLayer")
local PickedUpLayerType = java_lazy("org.allbinary.game.layer.pickup.PickedUpLayerType")
local PickedUpLayerTypeFactory = java_lazy("org.allbinary.game.layer.pickup.PickedUpLayerTypeFactory")

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

-- class table CountedPickedUpLayerInterfaceFactory is declared before the requires
CountedPickedUpLayerInterfaceFactory.__index = CountedPickedUpLayerInterfaceFactory
CountedPickedUpLayerInterfaceFactory.className = "CountedPickedUpLayerInterfaceFactory"
CountedPickedUpLayerInterfaceFactory.javaClassName = "org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory"
setmetatable(CountedPickedUpLayerInterfaceFactory, {__index = PickedUpLayerInterfaceFactory})
CountedPickedUpLayerInterfaceFactory.java_implements = " CountedPickedUpLayerInterfaceFactoryInterface "
CountedPickedUpLayerInterfaceFactory.java_interfaces = function() return {CountedPickedUpLayerInterfaceFactoryInterface} end

function CountedPickedUpLayerInterfaceFactory:_init_fields()
    if self.id == nil then self.id = 0 end
end


function CountedPickedUpLayerInterfaceFactory._jinit(self, pickeUpLayerType, iconLayer, animationInterface)
    java_super_init(PickedUpLayerInterfaceFactory, self, pickeUpLayerType, iconLayer, animationInterface)
    CountedPickedUpLayerInterfaceFactory._init_fields(self)
        -- super(...) made self above
        local list = CountedPickedUpLayerInterfaceFactoryPool.getInstance():getList()
        self.id = list:size()
        list:add(self)
    return self
end

function CountedPickedUpLayerInterfaceFactory.new(...)
    local self = setmetatable({}, CountedPickedUpLayerInterfaceFactory)
    CountedPickedUpLayerInterfaceFactory._jinit(self, ...)
    return self
end


-- throws Exception
function CountedPickedUpLayerInterfaceFactory:getNextInstance(hashtable, x, y, z)
        error(require("java.lang.Exception").new(CommonStrings.getInstance().NOT_IMPLEMENTED), 0)
end
java_overload(CountedPickedUpLayerInterfaceFactory, "getNextInstance", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "ABHashtable")) and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)


function CountedPickedUpLayerInterfaceFactory:getTotal()
        return -1
end
java_overload(CountedPickedUpLayerInterfaceFactory, "getTotal", 0)


function CountedPickedUpLayerInterfaceFactory:getId()
        return self.id
end
java_overload(CountedPickedUpLayerInterfaceFactory, "getId", 0)

CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY = CountedPickedUpLayerInterfaceFactory.new(PickedUpLayerTypeFactory.getInstance().NONE, IconLayer.NULL_ICON_LAYER, NullAnimationFactory.getFactoryInstance():getInstance(0))

return CountedPickedUpLayerInterfaceFactory

