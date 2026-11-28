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
-- package org.allbinary.animation

local FeaturedAnimationInterfaceFactoryInterfaceFactory = {}
package.loaded["org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory"] = FeaturedAnimationInterfaceFactoryInterfaceFactory

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

local FeatureResourceAnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.resource.FeatureResourceAnimationInterfaceFactoryInterface")
local GameConfigurationCentral = java_lazy("org.allbinary.game.configuration.GameConfigurationCentral")
local FeaturedResourceFactory = require("org.allbinary.game.resource.FeaturedResourceFactory")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local RectangleFactory = java_lazy("org.allbinary.graphics.RectangleFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local BasicAnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.BasicAnimationInterfaceFactoryInterface")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local ProceduralAnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")

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

-- class table FeaturedAnimationInterfaceFactoryInterfaceFactory is declared before the requires
FeaturedAnimationInterfaceFactoryInterfaceFactory.__index = FeaturedAnimationInterfaceFactoryInterfaceFactory
FeaturedAnimationInterfaceFactoryInterfaceFactory.className = "FeaturedAnimationInterfaceFactoryInterfaceFactory"
FeaturedAnimationInterfaceFactoryInterfaceFactory.javaClassName = "org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory"
setmetatable(FeaturedAnimationInterfaceFactoryInterfaceFactory, {__index = FeaturedResourceFactory})


function FeaturedAnimationInterfaceFactoryInterfaceFactory._jinit(self)
    java_super_init(FeaturedResourceFactory, self)
    return self
end

function FeaturedAnimationInterfaceFactoryInterfaceFactory.new(...)
    local self = setmetatable({}, FeaturedAnimationInterfaceFactoryInterfaceFactory)
    FeaturedAnimationInterfaceFactoryInterfaceFactory._jinit(self, ...)
    return self
end


function FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()
        return FeaturedAnimationInterfaceFactoryInterfaceFactory.INSTANCE
end


-- throws Exception
function FeaturedAnimationInterfaceFactoryInterfaceFactory:getRectangle(resource)
        return self:getRectangleXY(resource, 0, 0)
end
java_overload(FeaturedAnimationInterfaceFactoryInterfaceFactory, "getRectangle", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


-- throws Exception
function FeaturedAnimationInterfaceFactoryInterfaceFactory:getRectangleXY(resource, x, y)
        local pointFactory = PointFactory.getInstance()
        local list = self:getList()
        local scale = require("allbinary_java").number_value(GameConfigurationCentral.getInstance().SCALE:getValue(), "intValue")
        local size = self:getList():size()
        for index = 0, size - 1 do
            local featureInterface = list.objectArray[index + 1]
            if featureInterface:isFeature() then
                local rectangle = featureInterface:getRectangle(resource)
                if not rawequal(rectangle, RectangleFactory.SINGLETON) then
                    return Rectangle.new(pointFactory:createXY(x, y), ((((rectangle:getWidth() * scale)) // (1 << (1)))), ((((rectangle:getHeight() * scale)) // (1 << (1)))))
                end
            end
        end
        error(require("java.lang.Exception").new(tostring(StringMaker.new():append("No rectangle available for current feature selection or Resource: "):append(resource))), 0)
end
java_overload(FeaturedAnimationInterfaceFactoryInterfaceFactory, "getRectangleXY", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or type(java_a1) == "string") and type(java_a2) == "number" and type(java_a3) == "number" end)


-- throws Exception
function FeaturedAnimationInterfaceFactoryInterfaceFactory:getProcedural(resource)
        return self:getBasicAnimationInterfaceFactoryInstance(resource)
end
java_overload(FeaturedAnimationInterfaceFactoryInterfaceFactory, "getProcedural", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


-- throws Exception
function FeaturedAnimationInterfaceFactoryInterfaceFactory:get(resource)
        return self:getBasicAnimationInterfaceFactoryInstance(resource)
end
java_overload(FeaturedAnimationInterfaceFactoryInterfaceFactory, "get", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


-- throws Exception
function FeaturedAnimationInterfaceFactoryInterfaceFactory:getBasicAnimationInterfaceFactoryInstance(resource)
        local list = self:getList()
        local resourceTypeAvailableList = BasicArrayListD.new()
        local size = self:getList():size()
        local featureInterface = nil
        local animationInterfaceFactoryInterface = nil
        for index = 0, size - 1 do
            featureInterface = list.objectArray[index + 1]
            if featureInterface:isFeature() then
                resourceTypeAvailableList:add(featureInterface)
                animationInterfaceFactoryInterface = featureInterface:getBasicAnimationInterfaceFactoryInstance(resource)
                if not rawequal(animationInterfaceFactoryInterface, NullAnimationFactory.NULL_NOT_FOR_USE_ANIMATION_FACTORY) then
                    return animationInterfaceFactoryInterface
                end
            end
        end
        if resourceTypeAvailableList:size() > 0 then
            local NO_ANIMATION_AVAILABLE_FROM = "No animation available from: "
            local FOR_FACTORIES = " factories: "
            local FOR_RESOURCE = " for Resource: "
            local HAS_KEY = " has: "
            local RESOURCES_LABEL = " resources "
            local stringBuffer = StringMaker.new()
            stringBuffer:append(NO_ANIMATION_AVAILABLE_FROM)
            stringBuffer:appendint(resourceTypeAvailableList:size())
            stringBuffer:append(CommonSeps.getInstance().FORWARD_SLASH)
            stringBuffer:appendint(size)
            stringBuffer:append(FOR_FACTORIES)
            local size2 = resourceTypeAvailableList:size()
            for index = 0, size2 - 1 do
                stringBuffer:append(tostring(resourceTypeAvailableList:get(index)))
                stringBuffer:append(CommonSeps.getInstance().COMMA_SEP)
            end
            stringBuffer:append(FOR_RESOURCE)
            stringBuffer:append(resource)
            for index = 0, size - 1 do
                stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
                featureInterface = list.objectArray[index + 1]
                if featureInterface:isFeature() then
                    stringBuffer:append(StringUtil.getInstance():toString(featureInterface))
                    stringBuffer:append(HAS_KEY)
                    stringBuffer:appendint(featureInterface:getHashtable():size())
                    stringBuffer:append(RESOURCES_LABEL)
                end
            end
            error(require("java.lang.Exception").new(tostring(stringBuffer)), 0)
        else
            local stringBuffer = StringMaker.new()
            for index = 0, size - 1 do
                featureInterface = list.objectArray[index + 1]
                stringBuffer:append(tostring(featureInterface))
                stringBuffer:append(CommonSeps.getInstance().SPACE)
            end
            local result = tostring(stringBuffer)
            stringBuffer:delete(0, stringBuffer:length())
            error(require("java.lang.Exception").new(tostring(stringBuffer:append("No feature resource type available for Resource: "):append(resource):append(" Resource Factories Available: "):append(result))), 0)
        end
end
java_overload(FeaturedAnimationInterfaceFactoryInterfaceFactory, "getBasicAnimationInterfaceFactoryInstance", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)

FeaturedAnimationInterfaceFactoryInterfaceFactory.INSTANCE = FeaturedAnimationInterfaceFactoryInterfaceFactory.new()

return FeaturedAnimationInterfaceFactoryInterfaceFactory

