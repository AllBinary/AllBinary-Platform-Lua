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
-- package org.allbinary.media.image

local ImageRotationUtil = {}
package.loaded["org.allbinary.media.image.ImageRotationUtil"] = ImageRotationUtil

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
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local OpenGLFeatureFactory = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local OpenGLESImage = java_lazy("org.allbinary.image.opengles.OpenGLESImage")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local GC = java_lazy("org.eclipse.swt.graphics.GC")
local SwtImmutableImage = java_lazy("org.microemu.device.swt.SwtImmutableImage")
local SwtMutableImage = java_lazy("org.microemu.device.swt.SwtMutableImage")
local ImageSwtRotationUtil = java_lazy("org.allbinary.media.image.ImageSwtRotationUtil")
local SwtOpenGLESImageBridge = java_lazy("org.allbinary.media.image.SwtOpenGLESImageBridge")

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

-- class table ImageRotationUtil is declared before the requires
ImageRotationUtil.__index = ImageRotationUtil
ImageRotationUtil.className = "ImageRotationUtil"
ImageRotationUtil.javaClassName = "org.allbinary.media.image.ImageRotationUtil"

function ImageRotationUtil:_init_fields()
    self.imageSwtRotationUtil = ImageSwtRotationUtil.getInstance()
    self.features = Features.getInstance()
end


function ImageRotationUtil.getInstance()
        return ImageRotationUtil.instance_f
end


function ImageRotationUtil._jinit(self)
    ImageRotationUtil._init_fields(self)
    return self
end

function ImageRotationUtil.new(...)
    local self = setmetatable({}, ImageRotationUtil)
    ImageRotationUtil._jinit(self, ...)
    return self
end


function ImageRotationUtil:rotateImage(originalImage, image, totalAngle)
        local originalImage2 = originalImage
        if self.features:isFeature(OpenGLFeatureFactory.getInstance().OPENGL) then
            if image:getType() >= OpenGLESImage.TYPE then
                local openGLESImage = SwtOpenGLESImageBridge.getOpenGLESImage(image)
                openGLESImage.openGLESImageProperties.angle = totalAngle
                return
            else
                PreLogUtil.put(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("OpenGL but image is: ") .. require("allbinary_java").to_string(image)) .. require("allbinary_java").to_string(" type: ")) .. require("allbinary_java").to_string(image:getType()), self, "rotateImage")
            end
        end
        local originalSwtImage = (originalImage2:getImage())
        local gc = nil
        local copySwtImage = nil
        if image:isMutable() then
            local swtImage = image
            copySwtImage = swtImage:getImage()
            gc = swtImage:getGc()
            self.imageSwtRotationUtil:rotateImage(originalSwtImage, copySwtImage, gc, totalAngle)
        else
            PreLogUtil.put(require("allbinary_java").to_string("No rotation for: ") .. require("allbinary_java").to_string(tostring(image)), self, "rotateImage")
        end
end


-- throws Exception
function ImageRotationUtil:createRotatedImage(originalImage, rotationInDegrees)
        return originalImage
end

ImageRotationUtil.instance_f = ImageRotationUtil.new()

return ImageRotationUtil

