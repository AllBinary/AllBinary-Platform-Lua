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
-- package org.allbinary.image.sprite

local AnimationFactorySpriteScaleUtil = {}
package.loaded["org.allbinary.image.sprite.AnimationFactorySpriteScaleUtil"] = AnimationFactorySpriteScaleUtil

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
local Sprite = java_lazy("javax.microedition.lcdui.game.Sprite")
local SpriteFactory = java_lazy("org.allbinary.game.layer.SpriteFactory")
local OpenGLUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLUtil")
local ImageCache = java_lazy("org.allbinary.image.ImageCache")
local ImageCacheFactory = java_lazy("org.allbinary.image.ImageCacheFactory")
local OpenGLESImageExclusionUtil = java_lazy("org.allbinary.image.opengles.OpenGLESImageExclusionUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local J2SEMath = java_lazy("org.allbinary.logic.math.J2SEMath")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local ImageScaleUtil = java_lazy("org.allbinary.media.image.ImageScaleUtil")
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

-- class table AnimationFactorySpriteScaleUtil is declared before the requires
AnimationFactorySpriteScaleUtil.__index = AnimationFactorySpriteScaleUtil
AnimationFactorySpriteScaleUtil.className = "AnimationFactorySpriteScaleUtil"
AnimationFactorySpriteScaleUtil.javaClassName = "org.allbinary.image.sprite.AnimationFactorySpriteScaleUtil"

function AnimationFactorySpriteScaleUtil:_init_fields()
    self.imageCache = ImageCacheFactory.getInstance()
    self.imageScaleUtil = ImageScaleUtil.getInstance()
    self.openGLUtil = OpenGLUtil.getInstance()
    self.j2seMath = J2SEMath.getInstance()
    self.openGLESImageExclusionUtil = OpenGLESImageExclusionUtil.getInstance()
end

function AnimationFactorySpriteScaleUtil._jinit(self)
    AnimationFactorySpriteScaleUtil._init_fields(self)
    return self
end

function AnimationFactorySpriteScaleUtil.new()
    return AnimationFactorySpriteScaleUtil._jinit(setmetatable({}, AnimationFactorySpriteScaleUtil))
end


function AnimationFactorySpriteScaleUtil.getInstance()
        return AnimationFactorySpriteScaleUtil.instance_f
end


-- throws Exception
function AnimationFactorySpriteScaleUtil:createImage(image, width, height, scaleWidth, scaleHeight)
        local spriteFactory = SpriteFactory.getInstance()
        local sprite = nil
        local scaledImage = nil
        if not rawequal(scaleWidth, 0) and not rawequal(scaleHeight, 0) then
            local scaleX = ((scaleWidth + 0.0)) / ((width + 0.0))
            local scaleY = ((scaleHeight + 0.0)) / ((height + 0.0))
            if (rawequal(scaleX, 1.0) and rawequal(scaleY, 1.0)) or (rawequal(scaleX, 0.0) or rawequal(scaleY, 0.0)) then
                scaledImage = self.openGLUtil:addImage(image)
                sprite = spriteFactory:createSprite(scaledImage, width, height)
            else
                if self.openGLESImageExclusionUtil:isCustomScaling(image) then
                    local width2 = self.j2seMath:round(((scaleWidth) + 0.0) - 0.5)
                    local height2 = self.j2seMath:round(((scaleHeight) + 0.0) - 0.5)
                    local multiplesOf16Width = java_idiv(width2, 16)
                    local by16Width = multiplesOf16Width * 16
                    scaleX = ((by16Width + 0.0)) / (width + 0.0)
                    local multiplesOf16Height = java_idiv(height2, 16)
                    local by16Height = multiplesOf16Height * 16
                    scaleY = ((by16Height + 0.0)) / (height + 0.0)
                    if scaleWidth < width then
                        scaleX = scaleX * 2.35
                    end
                    if scaleHeight < height then
                        scaleY = scaleY * 2.35
                    end
                end
                scaledImage = self.imageScaleUtil:createImage2(self.imageCache, image, scaleX, 1.0, scaleY, 1.0, true)
                sprite = spriteFactory:createSprite(scaledImage, java_int(((width + 0.0) * scaleX)), java_int(((height + 0.0) * scaleY)))
            end
        else
            scaledImage = self.openGLUtil:addImage(image)
            sprite = spriteFactory:createSprite(scaledImage, width, height)
        end
        return sprite
end

AnimationFactorySpriteScaleUtil.instance_f = AnimationFactorySpriteScaleUtil.new()

return AnimationFactorySpriteScaleUtil

