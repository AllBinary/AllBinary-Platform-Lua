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
-- package org.allbinary.media.image

local ImageModifierUtil = {}
package.loaded["org.allbinary.media.image.ImageModifierUtil"] = ImageModifierUtil

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

local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local Image = java_lazy("javax.microedition.lcdui.Image")
local Anchor = java_lazy("org.allbinary.graphics.Anchor")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local PlaynImage = java_lazy("org.microemu.device.playn.PlaynImage")
local ResourceCallbackStrings = java_lazy("org.microemu.device.ResourceCallbackStrings")
local Canvas = java_lazy("playn.core.Canvas")
local CanvasImage = java_lazy("playn.core.CanvasImage")
local Callback = java_lazy("playn.core.util.Callback")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table ImageModifierUtil is declared before the requires
ImageModifierUtil.__index = ImageModifierUtil
ImageModifierUtil.className = "ImageModifierUtil"
ImageModifierUtil.javaClassName = "org.allbinary.media.image.ImageModifierUtil"

function ImageModifierUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.resourceCallbackStrings = ResourceCallbackStrings.getInstance()
    if self.alphaArray == nil then self.alphaArray = nil end
end

function ImageModifierUtil._jinit(self)
    ImageModifierUtil._init_fields(self)
    return self
end

function ImageModifierUtil.new()
    return ImageModifierUtil._jinit(setmetatable({}, ImageModifierUtil))
end


function ImageModifierUtil.getInstanceOrCreate()
        return ImageModifierUtil.new()
end


function ImageModifierUtil:setColor(unusedOriginalImage, image, imageIndex, basicColor)
end


function ImageModifierUtil:changeColor(unusedOriginalImage, image, imageIndex, basicColor)
end


function ImageModifierUtil:setAlpha(originalImage, image, imageIndex, alpha)
        local alphaF = (alpha + 0.0)
        local alphaFloat = alphaF / 255.0
        self:setAlphaF(originalImage, image, imageIndex, alphaFloat)
end


function ImageModifierUtil:setAlphaF(originalImage, image, imageIndex, alpha)
        if self.alphaArray[imageIndex + 1] then
            self.alphaArray[imageIndex + 1] = false
            self:setAlpha2(originalImage, image, imageIndex, alpha)
        end
end


function ImageModifierUtil:setAlpha2(originalImage, image, imageIndex, alpha)
        local htmlImage = image
        local canvasImage = htmlImage:getImage()
        local originalPlaynImage = (originalImage):getImage()
        local canvas = canvasImage:canvas()
        canvas:clear()
        canvas:setAlpha(alpha)
        canvas:drawImage(originalPlaynImage, 0, 0)
end


function ImageModifierUtil:setAlpha3(image, alpha)
        local alphaF = alpha
        local alphaFloat = alphaF / 255.0
        local htmlImage = image
        local canvasImage = htmlImage:getImage()
        local canvas = canvasImage:canvas()
        canvas:setAlpha(alphaFloat)
end


function ImageModifierUtil:getImageArray(originalImageArray)
        local size = (originalImageArray.n or #originalImageArray)
        self.alphaArray = java_new_array(false, size)
        local imageArray = java_new_array(nil, size)
        for index = 0, size - 1 do
            imageArray[index + 1] = originalImageArray[index + 1]
            self:handleImage(imageArray, index, originalImageArray[index + 1])
        end
        return imageArray
end


function ImageModifierUtil:handleImage(imageArray, index, image)
        local image3 = (image):getImage()
        if not rawequal(image3, nil) then
            if image3:isReady() or image3:width() + image3:height() <= 0 or rawequal(image:getName(), self.resourceCallbackStrings.FROM_DATA) then
                self:copy(imageArray, index, image, image3)
            else
                local callback = (function()
                    local java_outer_self = self
                local o = Callback.new and Callback.new() or setmetatable({}, {__index = Callback})
                    

                    function o:onSuccess(resource)
                        local logUtil = LogUtil.getInstance()
                        logUtil:putF(require("allbinary_java").to_string(self.resourceCallbackStrings.DONE) .. require("allbinary_java").to_string(image:getName()), self, self.resourceCallbackStrings.HANDLE_IMAGE)
                        ;(self.copy and self or java_outer_self):copy(imageArray, index, image, image3)
            
                    end
                    java_overload(o, "onSuccess", 1)
                    

                    function o:onFailure(e)
                        local logUtil = LogUtil.getInstance()
                        logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.EXCEPTION_LABEL):append(self.resourceCallbackStrings.ERROR):append(image:getName())), self, self.resourceCallbackStrings.HANDLE_IMAGE)
                    end
                    java_overload(o, "onFailure", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Throwable")) end)
                    return o
                end)()
                image3:addCallback(callback)
            end
        else
            self.logUtil:putF(self.resourceCallbackStrings.NULL + image:isMutable(), self, self.resourceCallbackStrings.HANDLE_IMAGE)
        end
end


function ImageModifierUtil:copy(imageArray, index, image, image3)
        local try_ok, try_error, try_value = pcall(function()
            local image2 = Image.createImage(image3:width(), image3:height())
            local graphics = image2:getGraphics()
            graphics:drawImage(image, 0, 0, Anchor.TOP_LEFT)
            imageArray[index + 1] = image2
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:putF(self.commonStrings.EXCEPTION_LABEL + self.resourceCallbackStrings.DONE, self, self.resourceCallbackStrings.HANDLE_IMAGE)
        end
end


function ImageModifierUtil:reset()
        local size = (self.alphaArray.n or #self.alphaArray)
        for index = 0, size - 1 do
            self.alphaArray[index + 1] = true
        end
end

return ImageModifierUtil

