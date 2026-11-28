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
-- package org.allbinary.image

local AnimationFactoryImageScaleUtil = {}
package.loaded["org.allbinary.image.AnimationFactoryImageScaleUtil"] = AnimationFactoryImageScaleUtil

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

local Image = java_lazy("javax.microedition.lcdui.Image")
local AnimationFactoryInitializationVisitor = java_lazy("org.allbinary.animation.image.AnimationFactoryInitializationVisitor")
local BaseImageAnimationFactory = java_lazy("org.allbinary.animation.image.BaseImageAnimationFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local ScaleProperties = java_lazy("org.allbinary.media.ScaleProperties")
local ImageJ2MEScaleUtil = java_lazy("org.allbinary.media.image.ImageJ2MEScaleUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table AnimationFactoryImageScaleUtil is declared before the requires
AnimationFactoryImageScaleUtil.__index = AnimationFactoryImageScaleUtil
AnimationFactoryImageScaleUtil.className = "AnimationFactoryImageScaleUtil"
AnimationFactoryImageScaleUtil.javaClassName = "org.allbinary.image.AnimationFactoryImageScaleUtil"

function AnimationFactoryImageScaleUtil:_init_fields()
    self.imageScaleUtil = ImageJ2MEScaleUtil.getInstance()
end

function AnimationFactoryImageScaleUtil._jinit(self)
    AnimationFactoryImageScaleUtil._init_fields(self)
    return self
end

function AnimationFactoryImageScaleUtil.new()
    return AnimationFactoryImageScaleUtil._jinit(setmetatable({}, AnimationFactoryImageScaleUtil))
end


function AnimationFactoryImageScaleUtil.getInstance()
        return AnimationFactoryImageScaleUtil.instance_f
end


-- throws Exception
function AnimationFactoryImageScaleUtil:createImage(image, width, height, scaleWidth, scaleHeight)
        local scaledImage = nil
        if not rawequal(scaleWidth, 0) and not rawequal(scaleHeight, 0) then
            local scaleX = ((scaleWidth + 0.0)) / ((width + 0.0))
            local scaleY = ((scaleHeight + 0.0)) / ((height + 0.0))
            if (rawequal(scaleX, 1.0) and rawequal(scaleY, 1.0)) or (rawequal(scaleX, 0.0) or rawequal(scaleY, 0.0)) then
                scaledImage = image
            else
                local scaledWidth = java_int((scaleX * (width + 0.0)))
                local scaledHeight = java_int((scaleY * (height + 0.0)))
                scaledImage = self.imageScaleUtil:scale(image, scaledWidth, scaledHeight)
            end
        else
            scaledImage = image
        end
        return scaledImage
end


-- throws Exception
function AnimationFactoryImageScaleUtil:processAdjust(baseImageAnimationFactory)
        local scaleProperties = baseImageAnimationFactory:getScalePropertiesP()
        if not rawequal(scaleProperties.scaleWidth, 0) and not rawequal(scaleProperties.scaleHeight, 0) then
            local animationFactoryInitializationVisitor = baseImageAnimationFactory:getAnimationFactoryInitializationVisitorP()
            local scaleX = ((scaleProperties.scaleWidth + 0.0)) / ((animationFactoryInitializationVisitor.width + 0.0))
            local scaleY = ((scaleProperties.scaleHeight + 0.0)) / ((animationFactoryInitializationVisitor.height + 0.0))
            if (rawequal(scaleX, 1.0) and rawequal(scaleY, 1.0)) or (rawequal(scaleX, 0.0) or rawequal(scaleY, 0.0)) then
            else
                animationFactoryInitializationVisitor.dx = java_int((animationFactoryInitializationVisitor.originalDx * scaleX))
                animationFactoryInitializationVisitor.dy = java_int((animationFactoryInitializationVisitor.originalDy * scaleY))
            end
        else
        end
end

AnimationFactoryImageScaleUtil.instance_f = AnimationFactoryImageScaleUtil.new()

return AnimationFactoryImageScaleUtil

