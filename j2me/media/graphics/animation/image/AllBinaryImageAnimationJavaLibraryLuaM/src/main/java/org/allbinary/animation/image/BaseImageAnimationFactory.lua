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
-- package org.allbinary.animation.image

local BaseImageAnimationFactory = {}
package.loaded["org.allbinary.animation.image.BaseImageAnimationFactory"] = BaseImageAnimationFactory

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

-- local Image = require("javax.microedition.lcdui.Image")
local Animation = java_lazy("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = java_lazy("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local AnimationFactoryImageScaleUtil = java_lazy("org.allbinary.image.AnimationFactoryImageScaleUtil")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local AnimationFactoryInitializationVisitor = java_lazy("org.allbinary.animation.image.AnimationFactoryInitializationVisitor")

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

-- class table BaseImageAnimationFactory is declared before the requires
BaseImageAnimationFactory.__index = BaseImageAnimationFactory
BaseImageAnimationFactory.className = "BaseImageAnimationFactory"
BaseImageAnimationFactory.javaClassName = "org.allbinary.animation.image.BaseImageAnimationFactory"
BaseImageAnimationFactory.java_implements = " AnimationInterfaceFactoryInterface "
BaseImageAnimationFactory.java_interfaces = function() return {AnimationInterfaceFactoryInterface} end

function BaseImageAnimationFactory:_init_fields()
    self.animationFactoryImageScaleUtil = AnimationFactoryImageScaleUtil.getInstance()
    if self.image == nil then self.image = nil end
    if self.animationBehaviorFactory == nil then self.animationBehaviorFactory = nil end
    if self.sequenceArray == nil then self.sequenceArray = nil end
    if self.animationFactoryInitializationVisitor == nil then self.animationFactoryInitializationVisitor = nil end
    self.scaleProperties = ScaleProperties.instance_f
end


-- throws Exception
function BaseImageAnimationFactory.createFactoryBase(image, sequenceArray, width, height, animationBehaviorFactory)
        return BaseImageAnimationFactory.new(image, sequenceArray, width, height, 0, 0, animationBehaviorFactory)
end


function BaseImageAnimationFactory._jinit(self, image, sequenceArray, width, height, dx, dy, animationBehaviorFactory)
    BaseImageAnimationFactory._init_fields(self)
        self.animationFactoryInitializationVisitor = AnimationFactoryInitializationVisitor.new()
        self.image = image
        self.animationFactoryInitializationVisitor.width = width
        self.animationFactoryInitializationVisitor.height = height
        self.animationBehaviorFactory = animationBehaviorFactory
        self.sequenceArray = sequenceArray
        self.animationFactoryInitializationVisitor.dx = dx
        self.animationFactoryInitializationVisitor.dy = dy
    return self
end

function BaseImageAnimationFactory.new(...)
    local self = setmetatable({}, BaseImageAnimationFactory)
    BaseImageAnimationFactory._jinit(self, ...)
    return self
end


-- throws Exception
function BaseImageAnimationFactory:getInstance(instanceId)
        return NullAnimationFactory.getFactoryInstance():getInstance(instanceId)
end


function BaseImageAnimationFactory:getImage()
        return self.image
end


function BaseImageAnimationFactory:getSequenceArray()
        return self.sequenceArray
end


function BaseImageAnimationFactory:setInitialScale(scaleProperties)
        self.scaleProperties = scaleProperties
        if self.scaleProperties.shouldScale then
            self.scaleProperties.scaleWidth = java_int((self.animationFactoryInitializationVisitor.width * self.scaleProperties.scaleX))
            self.scaleProperties.scaleHeight = java_int((self.animationFactoryInitializationVisitor.height * self.scaleProperties.scaleY))
        else
        end
end


function BaseImageAnimationFactory:getAnimationFactoryInitializationVisitorP()
        return self.animationFactoryInitializationVisitor
end


function BaseImageAnimationFactory:getScalePropertiesP()
        return self.scaleProperties
end


function BaseImageAnimationFactory:toString()
        local commonSeps = CommonSeps.getInstance()
        local commonLabels = CommonLabels.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.className)
        stringBuffer:append(commonLabels.HEIGHT_LABEL)
        stringBuffer:appendint(java_int(self.image:getHeight()))
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(tostring(self.animationFactoryInitializationVisitor))
        return tostring(stringBuffer)
end
BaseImageAnimationFactory.__tostring = function(self) return self:toString() end

return BaseImageAnimationFactory

