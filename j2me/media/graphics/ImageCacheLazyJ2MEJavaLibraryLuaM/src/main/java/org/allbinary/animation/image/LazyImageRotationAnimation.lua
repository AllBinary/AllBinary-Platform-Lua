-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.animation.image

local LazyImageRotationAnimation = {}
package.loaded["org.allbinary.animation.image.LazyImageRotationAnimation"] = LazyImageRotationAnimation

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

local GL = java_lazy("javax.microedition.khronos.opengles.GL")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local Image = java_lazy("javax.microedition.lcdui.Image")
local AnimationBehavior = java_lazy("org.allbinary.animation.AnimationBehavior")
local IndexedAnimation = java_lazy("org.allbinary.animation.IndexedAnimation")
local NullRotationAnimationFactory = java_lazy("org.allbinary.animation.NullRotationAnimationFactory")
local RotationAnimation = require("org.allbinary.animation.RotationAnimation")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local ImageCache = java_lazy("org.allbinary.image.ImageCache")
local ImageCacheFactory = java_lazy("org.allbinary.image.ImageCacheFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AngleFactory = java_lazy("org.allbinary.math.AngleFactory")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local CircularIndexUtil = java_lazy("org.allbinary.util.CircularIndexUtil")
local BaseImageAnimationFactory = java_lazy("org.allbinary.animation.image.BaseImageAnimationFactory")

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

-- class table LazyImageRotationAnimation is declared before the requires
LazyImageRotationAnimation.__index = LazyImageRotationAnimation
LazyImageRotationAnimation.className = "LazyImageRotationAnimation"
LazyImageRotationAnimation.javaClassName = "org.allbinary.animation.image.LazyImageRotationAnimation"
setmetatable(LazyImageRotationAnimation, {__index = RotationAnimation})

function LazyImageRotationAnimation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.layoutIndex == nil then self.layoutIndex = 0 end
    if self.instanceId == nil then self.instanceId = 0 end
    if self.animationInterfaceFactoryInterface == nil then self.animationInterfaceFactoryInterface = nil end
    if self.NULL_INDEX_ANIMATION == nil then self.NULL_INDEX_ANIMATION = nil end
    if self.animation == nil then self.animation = nil end
    self.scaleProperties = ScaleProperties.instance_f
end


function LazyImageRotationAnimation._jinit(self, layoutIndex, instanceId, scaleProperties, animationInterfaceFactoryInterface, animationBehavior)
    java_super_init(RotationAnimation, self, AngleInfo.getInstance(AngleFactory.getInstance().QUARTER_TOTAL_ANGLE), CircularIndexUtil.createInstance(4), animationBehavior)
    LazyImageRotationAnimation._init_fields(self)
        -- super(...) made self above
        self.layoutIndex = layoutIndex
        self.instanceId = instanceId
        self.animationInterfaceFactoryInterface = animationInterfaceFactoryInterface
        local imageCache = ImageCacheFactory.getInstance()
        imageCache:add(self)
        self.scaleProperties = scaleProperties
        self.NULL_INDEX_ANIMATION = NullRotationAnimationFactory.getFactoryInstance():getInstance(0)
        local ActualRotationAnimation = {}
        ActualRotationAnimation.__index = ActualRotationAnimation
        ActualRotationAnimation.className = "ActualRotationAnimation"
        ActualRotationAnimation.javaClassName = "org.allbinary.animation.image.LazyImageRotationAnimation$ActualRotationAnimation"
        setmetatable(ActualRotationAnimation, {__index = RotationAnimation})

        function ActualRotationAnimation:_init_fields()
            if self.lazyImageRotationAnimation == nil then self.lazyImageRotationAnimation = nil end
            if self.index == nil then self.index = 0 end
        end
        

        function ActualRotationAnimation._jinit(self, lazyImageRotationAnimation)
            java_super_init(RotationAnimation, self, AngleInfo.getInstance(AngleFactory.getInstance().QUARTER_TOTAL_ANGLE), CircularIndexUtil.createInstance(4), self.animationBehavior)
            ActualRotationAnimation._init_fields(self)
                -- super(...) made self above
                self.lazyImageRotationAnimation = lazyImageRotationAnimation
            return self
        end

        function ActualRotationAnimation.new(...)
            local self = setmetatable({}, ActualRotationAnimation)
            ActualRotationAnimation._jinit(self, ...)
            return self
        end
            function ActualRotationAnimation.newEnclosed(outer, ...)
                local self = setmetatable({__javaOuter = outer}, ActualRotationAnimation)
                ActualRotationAnimation._jinit(self, ...)
                return self
            end
        

        function ActualRotationAnimation:setFrame(index)
                self.index = index
        end
        java_overload(ActualRotationAnimation, "setFrame", 1, function(java_a1) return true and type(java_a1) == "number" end)
        

        function ActualRotationAnimation:getFrame()
                return self.index
        end
        java_overload(ActualRotationAnimation, "getFrame", 0)
        

        function ActualRotationAnimation:paintXY(graphics, x, y)
                local try_ok, try_error, try_value = pcall(function()
                    ImageCacheFactory.getInstance():insertFirst(self)
                    self.lazyImageRotationAnimation.animation = self.lazyImageRotationAnimation.NULL_INDEX_ANIMATION
                end)
                if not try_ok then
                    local e = try_error
                    if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                    local logUtil = LogUtil.getInstance()
                    logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
                end
        end
        java_overload(ActualRotationAnimation, "paintXY", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)
        

        function ActualRotationAnimation:paintThreedXYZ(graphics, x, y, z)
                local try_ok, try_error, try_value = pcall(function()
                    ImageCacheFactory.getInstance():insertFirst(self)
                    self.lazyImageRotationAnimation.animation = self.lazyImageRotationAnimation.NULL_INDEX_ANIMATION
                end)
                if not try_ok then
                    local e = try_error
                    if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                    local logUtil = LogUtil.getInstance()
                    logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
                end
        end
        java_overload(ActualRotationAnimation, "paintThreedXYZ", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)

        self.animation = ActualRotationAnimation.newEnclosed(self, self)
    return self
end

function LazyImageRotationAnimation.new(...)
    local self = setmetatable({}, LazyImageRotationAnimation)
    LazyImageRotationAnimation._jinit(self, ...)
    return self
end


function LazyImageRotationAnimation:setRealAnimation()
        local try_ok, try_error, try_value = pcall(function()
            local animation = self.animation
            self.animationInterfaceFactoryInterface:setInitialScale(self.scaleProperties)
            self.animation = self.animationInterfaceFactoryInterface:getInstance(self.instanceId)
            self.animation:setState(animation)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, LazyImageRotationAnimation.SET_REAL_ANIMATION, e)
        end
end
java_overload(LazyImageRotationAnimation, "setRealAnimation", 0)


function LazyImageRotationAnimation:setScale(scaleX, scaleY)
        self.animation:setScale(scaleX, scaleY)
end
java_overload(LazyImageRotationAnimation, "setScale", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function LazyImageRotationAnimation:getAnimationBehavior()
        return self.animation:getAnimationBehavior()
end
java_overload(LazyImageRotationAnimation, "getAnimationBehavior", 0)


-- throws Exception
function LazyImageRotationAnimation:set(gl)
        self.animation:set(gl)
end
java_overload(LazyImageRotationAnimation, "set", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GL")) end)


function LazyImageRotationAnimation:setAlpha(alpha)
        self.animation:setAlpha(alpha)
end
java_overload(LazyImageRotationAnimation, "setAlpha", 1, function(java_a1) return true and type(java_a1) == "number" end)


function LazyImageRotationAnimation:setDx(dx)
        self.animation:setDx(dx)
end
java_overload(LazyImageRotationAnimation, "setDx", 1, function(java_a1) return true and type(java_a1) == "number" end)


function LazyImageRotationAnimation:setDy(dy)
        self.animation:setDy(dy)
end
java_overload(LazyImageRotationAnimation, "setDy", 1, function(java_a1) return true and type(java_a1) == "number" end)


function LazyImageRotationAnimation:setMaxScale(maxScaleX, maxScaleY)
        self.animation:setMaxScale(maxScaleX, maxScaleY)
end
java_overload(LazyImageRotationAnimation, "setMaxScale", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function LazyImageRotationAnimation:nextRotation()
        local rotationAnimation = (self.animation)
        rotationAnimation:nextRotation()
end
java_overload(LazyImageRotationAnimation, "nextRotation", 0)


function LazyImageRotationAnimation:previousRotation()
        local rotationAnimation = (self.animation)
        rotationAnimation:previousRotation()
end
java_overload(LazyImageRotationAnimation, "previousRotation", 0)


function LazyImageRotationAnimation:nextRotationX()
        local rotationAnimation = (self.animation)
        rotationAnimation:nextRotationX()
end
java_overload(LazyImageRotationAnimation, "nextRotationX", 0)


function LazyImageRotationAnimation:previousRotationX()
        local rotationAnimation = (self.animation)
        rotationAnimation:previousRotationX()
end
java_overload(LazyImageRotationAnimation, "previousRotationX", 0)


function LazyImageRotationAnimation:nextRotationZ()
        local rotationAnimation = (self.animation)
        rotationAnimation:nextRotationZ()
end
java_overload(LazyImageRotationAnimation, "nextRotationZ", 0)


function LazyImageRotationAnimation:previousRotationZ()
        local rotationAnimation = (self.animation)
        rotationAnimation:previousRotationZ()
end
java_overload(LazyImageRotationAnimation, "previousRotationZ", 0)


function LazyImageRotationAnimation:changeBasicColor(basicColor)
        self.animation:changeBasicColor(basicColor)
end
java_overload(LazyImageRotationAnimation, "changeBasicColor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)


function LazyImageRotationAnimation:getBasicColorP()
        return self.animation:getBasicColorP()
end
java_overload(LazyImageRotationAnimation, "getBasicColorP", 0)


function LazyImageRotationAnimation:getChangeBasicColor()
        return self.animation:getChangeBasicColor()
end
java_overload(LazyImageRotationAnimation, "getChangeBasicColor", 0)


function LazyImageRotationAnimation:getChangeColor()
        return self.animation:getChangeColor()
end
java_overload(LazyImageRotationAnimation, "getChangeColor", 0)


function LazyImageRotationAnimation:getColor()
        return self.animation:getColor()
end
java_overload(LazyImageRotationAnimation, "getColor", 0)


function LazyImageRotationAnimation:getDx()
        return self.animation:getDx()
end
java_overload(LazyImageRotationAnimation, "getDx", 0)


function LazyImageRotationAnimation:getDy()
        return self.animation:getDy()
end
java_overload(LazyImageRotationAnimation, "getDy", 0)


function LazyImageRotationAnimation:isThreed()
        return self.animation:isThreed()
end
java_overload(LazyImageRotationAnimation, "isThreed", 0)


-- throws Exception
function LazyImageRotationAnimation:nextFrame()
        self.animation:nextFrame()
end
java_overload(LazyImageRotationAnimation, "nextFrame", 0)


function LazyImageRotationAnimation:reset()
        self.animation:reset()
end
java_overload(LazyImageRotationAnimation, "reset", 0)


function LazyImageRotationAnimation:setFrame(index)
        self.animation:setFrame(index)
end
java_overload(LazyImageRotationAnimation, "setFrame", 1, function(java_a1) return true and type(java_a1) == "number" end)


function LazyImageRotationAnimation:getFrame()
        return self.animation:getFrame()
end
java_overload(LazyImageRotationAnimation, "getFrame", 0)


-- throws Exception
function LazyImageRotationAnimation:getAnimationSize()
        return self.animation:getAnimationSize()
end
java_overload(LazyImageRotationAnimation, "getAnimationSize", 0)


function LazyImageRotationAnimation:getSize()
        return self.animation:getSize()
end
java_overload(LazyImageRotationAnimation, "getSize", 0)


function LazyImageRotationAnimation:previousFrame()
        self.animation:previousFrame()
end
java_overload(LazyImageRotationAnimation, "previousFrame", 0)


function LazyImageRotationAnimation:isLastFrame()
        return self.animation:isLastFrame()
end
java_overload(LazyImageRotationAnimation, "isLastFrame", 0)


function LazyImageRotationAnimation:setSequence(sequence)
        self.animation:setSequence(sequence)
end
java_overload(LazyImageRotationAnimation, "setSequence", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and (java_a1.jt == nil or java_a1.jt == "I") and (java_a1[1] == nil or math.type(java_a1[1]) == "integer"))) end)


function LazyImageRotationAnimation:getSequence()
        return self.animation:getSequence()
end
java_overload(LazyImageRotationAnimation, "getSequence", 0)


function LazyImageRotationAnimation:getWidth()
        return self.animation:getWidth()
end
java_overload(LazyImageRotationAnimation, "getWidth", 0)


function LazyImageRotationAnimation:paintXY(graphics, x, y)
        local try_ok, try_error, try_value = pcall(function()
            self.animation:paintXY(graphics, x, y)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
        end
end
java_overload(LazyImageRotationAnimation, "paintXY", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function LazyImageRotationAnimation:paintThreedXYZ(graphics, x, y, z)
        local try_ok, try_error, try_value = pcall(function()
            self.animation:paintThreedXYZ(graphics, x, y, z)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
        end
end
java_overload(LazyImageRotationAnimation, "paintThreedXYZ", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" and type(java_a4) == "number" end)


function LazyImageRotationAnimation:toString()
        local commonSeps = CommonSeps.getInstance()
        local image = self.animationInterfaceFactoryInterface:getImage()
        return tostring(StringMaker.new():append(tostring(RotationAnimation)):append(commonSeps.SPACE):append(image:getName()):append(commonSeps.SPACE):appendint(java_int(image:getWidth())):append(commonSeps.SPACE):appendint(java_int(image:getHeight())))
end
java_overload(LazyImageRotationAnimation, "toString", 0)
LazyImageRotationAnimation.__tostring = function(self) return self:toString() end

LazyImageRotationAnimation.SET_REAL_ANIMATION = "setRealAnimation"

return LazyImageRotationAnimation

