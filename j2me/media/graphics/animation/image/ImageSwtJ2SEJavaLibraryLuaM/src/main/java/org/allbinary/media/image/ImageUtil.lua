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

local ImageUtil = {}
package.loaded["org.allbinary.media.image.ImageUtil"] = ImageUtil

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

local SWT = java_lazy("org.eclipse.swt.SWT")
local Canvas = java_lazy("org.eclipse.swt.widgets.Canvas")
local Composite = java_lazy("org.eclipse.swt.widgets.Composite")
local GC = java_lazy("org.eclipse.swt.graphics.GC")
local ImageData = java_lazy("org.eclipse.swt.graphics.ImageData")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local PaintEvent = java_lazy("org.eclipse.swt.events.PaintEvent")
local PaintListener = java_lazy("org.eclipse.swt.events.PaintListener")
local Transform = java_lazy("org.eclipse.swt.graphics.Transform")
local Display = java_lazy("org.eclipse.swt.widgets.Display")
local BareMain = java_lazy("org.microemu.app.BareMain")
local Image = java_lazy("org.eclipse.swt.graphics.Image")

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

-- class table ImageUtil is declared before the requires
ImageUtil.__index = ImageUtil
ImageUtil.className = "ImageUtil"
ImageUtil.javaClassName = "org.allbinary.media.image.ImageUtil"

function ImageUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.IIOIMAGE_POOL_NAME = "IIOIMAGE_POOL_NAME"
    self.CREATE_BUFFERED_IMAGE = "createBufferedImage"
end


function ImageUtil.getInstance()
        return ImageUtil.instance_f
end


function ImageUtil._jinit(self)
    ImageUtil._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
        end
    return self
end

function ImageUtil.new(...)
    local self = setmetatable({}, ImageUtil)
    ImageUtil._jinit(self, ...)
    return self
end


function ImageUtil:create(width, height)
        local display = BareMain.shell:getDisplay()
        return Image.new(display, width, height)
end


-- throws Exception
function ImageUtil:createBufferedImage(bufferedImageArray, percent, scale)
        local size = (bufferedImageArray.n or #bufferedImageArray)
        local scaledBufferedImageArray = java_new_array(nil, size)
        local bufferedImage = nil
        local imageData = nil
        for index = 0, size - 1 do
            bufferedImage = bufferedImageArray[index + 1]
            imageData = bufferedImage:getImageData()
            local newWidth = java_int((imageData.width * percent / 100))
            local newHeight = java_int((imageData.height * percent / 100))
            scaledBufferedImageArray[index + 1] = self:createBufferedImage5(bufferedImage, newWidth, newHeight, scale)
        end
        return scaledBufferedImageArray
end


-- throws Exception
function ImageUtil:createBufferedImage2(bufferedImageArray, percent, scale)
        local size = (bufferedImageArray.n or #bufferedImageArray)
        local scaledBufferedImageArray = java_new_array(nil, size)
        local bufferedImage = nil
        local imageData = nil
        for index = 0, size - 1 do
            bufferedImage = bufferedImageArray[index + 1]
            imageData = bufferedImage:getImageData()
            local newWidth = java_int((imageData.width * percent))
            local newHeight = java_int((imageData.height * percent))
            scaledBufferedImageArray[index + 1] = self:createBufferedImage5(bufferedImage, newWidth, newHeight, scale)
        end
        return scaledBufferedImageArray
end


-- throws Exception
function ImageUtil:createBufferedImage3(bufferedImageArray, width, height, scale)
        local size = (bufferedImageArray.n or #bufferedImageArray)
        local scaledBufferedImageArray = java_new_array(nil, size)
        for index = 0, size - 1 do
            scaledBufferedImageArray[index + 1] = self:createBufferedImage5(bufferedImageArray[index + 1], width, height, scale)
        end
        return scaledBufferedImageArray
end


-- throws Exception
function ImageUtil:createBufferedImage4(bufferedImage, newWidth, newHeight)
        return self:createBufferedImage5(bufferedImage, newWidth, newHeight, true)
end


-- throws Exception
function ImageUtil:createBufferedImage5(bufferedImage, newWidth, newHeight, scale)
        return self:createBufferedImage6(bufferedImage, newWidth, newHeight, scale, false)
end


-- throws Exception
function ImageUtil:createBufferedImage6(bufferedImage, newWidth, newHeight, scale, allowTranslate)
        local imageData = bufferedImage:getImageData()
        local width = imageData.width
        local height = imageData.height
        local d_newWidth = (newWidth + 0.0)
        local d_newHeight = (newHeight + 0.0)
        local widthRatio = d_newWidth / width
        local heightRatio = d_newHeight / height
        local ratioX = 1.0
        local ratioY = 1.0
        if scale then
            ratioX = widthRatio
            ratioY = heightRatio
        end
        self.logUtil:putF(tostring(StringMaker.new():appendfloat(width):append(self.commonSeps.FORWARD_SLASH):appendfloat(height):append(self.commonSeps.COLON):appendint(newWidth):append(self.commonSeps.FORWARD_SLASH):appendint(newHeight):append(self.commonSeps.COLON):appendfloat(widthRatio):append(self.commonSeps.FORWARD_SLASH):appendfloat(heightRatio)), self, self.CREATE_BUFFERED_IMAGE)
        local dx = 0.0
        local dy = 0.0
        if not (scale) and allowTranslate then
            dx = ((newWidth + 0.0) - width) / 2.0
            dy = ((newHeight + 0.0) - height) / 2.0
            self.logUtil:putF(tostring(StringMaker.new():append("Translate dx: "):appendfloat(dx):append(" dy: "):appendfloat(dy)), self, self.CREATE_BUFFERED_IMAGE)
        end
        local newBufferedImage = Image.new(BareMain.shell:getDisplay(), newWidth, newHeight)
        local gc = GC.new(newBufferedImage)
        local affineTransform = Transform.new(gc:getDevice())
        affineTransform:scale(ratioX, ratioY)
        affineTransform:translate(dx, dy)
        gc:setTransform(affineTransform)
        gc:setAntialias(SWT.ON)
        gc:setInterpolation(SWT.HIGH)
        gc:drawImage(bufferedImage, 0, 0, bufferedImage:getBounds().width, bufferedImage:getBounds().height, 0, 0, newWidth, newHeight)
        gc:dispose()
        return newBufferedImage
end


function ImageUtil:drawTransformedImage(image, parent, dx, dy, width, height)
        local imageCanvas = Canvas.new(parent, SWT.NONE)
        imageCanvas:addPaintListener((function()
            local o = PaintListener.new and PaintListener.new() or setmetatable({}, {__index = PaintListener})
            

            function o:paintControl(event)
                local gc = event.gc
                local affineTransform = Transform.new(gc:getDevice())
                affineTransform:translate(dx, dy)
                gc:setAntialias(SWT.ON)
                gc:setInterpolation(SWT.HIGH)
                gc:drawImage(image, 0, 0, image:getBounds().width, image:getBounds().height, 0, 0, width, height)
            end
            java_overload(o, "paintControl", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PaintEvent")) end)
            return o
        end)())
        return imageCanvas
end


function ImageUtil:toString(bufferedImage)
        local commonLabels = CommonLabels.getInstance()
        local stringBuffer = StringMaker.new()
        local imageData = bufferedImage:getImageData()
        stringBuffer:append(" org.eclipse.swt.graphics.Image: ")
        stringBuffer:append(commonLabels.WIDTH_LABEL)
        stringBuffer:appendint(java_int(imageData.width))
        stringBuffer:append(commonLabels.HEIGHT_LABEL)
        stringBuffer:appendint(java_int(imageData.height))
        stringBuffer:append(" Type: ")
        stringBuffer:appendint(java_int(imageData.type))
        return tostring(stringBuffer)
end

ImageUtil.instance_f = ImageUtil.new()

return ImageUtil

