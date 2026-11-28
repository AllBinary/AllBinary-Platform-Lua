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
-- package org.allbinary.emulator.device

local TrueTypeFontUtil = {}
package.loaded["org.allbinary.emulator.device.TrueTypeFontUtil"] = TrueTypeFontUtil

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

local GL10 = java_lazy("javax.microedition.khronos.opengles.GL10")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local Image = java_lazy("javax.microedition.lcdui.Image")
local SWT = java_lazy("org.eclipse.swt.SWT")
local ImageData = java_lazy("org.eclipse.swt.graphics.ImageData")
local ImageLoader = java_lazy("org.eclipse.swt.graphics.ImageLoader")
local PaletteData = java_lazy("org.eclipse.swt.graphics.PaletteData")
local AvianUtil = java_lazy("org.allbinary.AvianUtil")
local ResourceUtil = java_lazy("org.allbinary.data.resource.ResourceUtil")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local OpenGLCapabilities = java_lazy("org.allbinary.graphics.opengles.OpenGLCapabilities")
local PreResourceImageUtil = java_lazy("org.allbinary.image.PreResourceImageUtil")
local OpenGLESImage = java_lazy("org.allbinary.image.opengles.OpenGLESImage")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local TrueTypeFontUtilBase = require("org.allbinary.emulator.device.TrueTypeFontUtilBase")

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

--TTF
-- class table TrueTypeFontUtil is declared before the requires
TrueTypeFontUtil.__index = TrueTypeFontUtil
TrueTypeFontUtil.className = "TrueTypeFontUtil"
TrueTypeFontUtil.javaClassName = "org.allbinary.emulator.device.TrueTypeFontUtil"
setmetatable(TrueTypeFontUtil, {__index = TrueTypeFontUtilBase})

function TrueTypeFontUtil:_init_fields()
    self.preResourceImageUtil = PreResourceImageUtil.getInstance()
    if self.widthFloatArray == nil then self.widthFloatArray = nil end
    self.fontImage = OpenGLESImage.NULL_OPENGL_IMAGE
    if self.widthScale == nil then self.widthScale = 0.0 end
end


function TrueTypeFontUtil.getInstance()
        return TrueTypeFontUtil.instance_f
end


function TrueTypeFontUtil._jinit(self)
    java_super_init(TrueTypeFontUtilBase, self, 2)
    TrueTypeFontUtil._init_fields(self)
        -- super(...) made self above
        if AvianUtil.isAvian() then
            self.widthFloatArray = {jt = "F", 1504.0, 967.0, 527.0, 961.0, 957.0, 1087.0, 920.0, 954.0, 973.0, 961.0, 955.0, 1296.0, 1013.0, 1106.0, 1167.0, 815.0, 815.0, 1216.0, 1110.0, 170.0, 520.0, 1056.0, 815.0, 1448.0, 1142.0, 1345.0, 927.0, 1345.0, 1030.0, 920.0, 1096.0, 1119.0, 1219.0, 1841.0, 1166.0, 1147.0, 1005.0, 879.0, 965.0, 792.0, 964.0, 927.0, 753.0, 1034.0, 916.0, 196.0, 469.0, 877.0, 166.0, 1563.0, 916.0, 1007.0, 965.0, 964.0, 631.0, 777.0, 649.0, 917.0, 1026.0, 1548.0, 993.0, 1028.0, 795.0, 241.0, 798.0, 241.0, 905.0, 1477.0, 393.0, 961.0, 961.0, 961.0, 961.0, 555.0, 1029.0, 1010.0, 1378.0, 952.0, 952.0, 952.0, 952.0, 463.0, 463.0, 926.0, 961.0, 491.0, 930.0, 457.0, 457.0, 644.0, 643.0, 326.0, 186.0, 1219.0, 241.0, 1599.0, 961.0, 302.0, 711.0, 961.0, 961.0, 710.0, 141.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0}
        else
            self.widthFloatArray = {jt = "F", 1504.0, 967.0, 527.0, 961.0, 957.0, 1087.0, 920.0, 954.0, 973.0, 961.0, 955.0, 1296.0, 1013.0, 1106.0, 1167.0, 815.0, 815.0, 1216.0, 1110.0, 170.0, 520.0, 1056.0, 815.0, 1448.0, 1142.0, 1345.0, 927.0, 1345.0, 1030.0, 920.0, 1096.0, 1119.0, 1219.0, 1841.0, 1166.0, 1147.0, 1005.0, 879.0, 965.0, 792.0, 964.0, 927.0, 753.0, 1034.0, 916.0, 196.0, 469.0, 877.0, 166.0, 1563.0, 916.0, 1007.0, 965.0, 964.0, 631.0, 777.0, 649.0, 917.0, 1026.0, 1548.0, 993.0, 1028.0, 795.0, 241.0, 798.0, 241.0, 905.0, 1477.0, 393.0, 961.0, 555.0, 1029.0, 1010.0, 1378.0, 952.0, 463.0, 463.0, 926.0, 961.0, 491.0, 930.0, 457.0, 457.0, 644.0, 643.0, 326.0, 186.0, 1219.0, 241.0, 1599.0, 961.0, 302.0, 711.0, 961.0, 961.0, 710.0, 141.0, 1504.0, 1504.0}
        end
        self.widthScale = (function() if (rawequal(self.scale, 2)) then return 1.2 else return 1.0 end end)()
    return self
end

function TrueTypeFontUtil.new(...)
    local self = setmetatable({}, TrueTypeFontUtil)
    TrueTypeFontUtil._jinit(self, ...)
    return self
end


function TrueTypeFontUtil:getFontBitmapGL(gl, filename, cellSize, basicColor)
        local try_ok, try_error, try_value = pcall(function()
            if rawequal(self.fontImage, OpenGLESImage.NULL_OPENGL_IMAGE) then
                local canvasStrings = CanvasStrings.getInstance()
                local openGLCapabilities = OpenGLCapabilities.getInstance()
                if openGLCapabilities:isTextureSizeValid(1024) and rawequal(self.scale, 2) then
                    local FONT_ATLAS_1024 = "/font_1024.png"
                    local image = Image.createImageFromInputStream(ResourceUtil.getInstance():getResourceAsStream(FONT_ATLAS_1024))
                    image:setName(canvasStrings.FONT_ATLAS)
                    self.fontImage = self.preResourceImageUtil:encapsulate(image)
                elseif openGLCapabilities:isTextureSizeValid(512) then
                    local FONT_ATLAS_512 = "/font_512.png"
                    local image = Image.createImageFromInputStream(ResourceUtil.getInstance():getResourceAsStream(FONT_ATLAS_512))
                    image:setName(canvasStrings.FONT_ATLAS)
                    self.fontImage = self.preResourceImageUtil:encapsulate(image)
                else
                    local FONT_ATLAS_512 = "/font_512.png"
                    local image = Image.createImageFromInputStream(ResourceUtil.getInstance():getResourceAsStream(FONT_ATLAS_512))
                    image:setName(canvasStrings.FONT_ATLAS)
                    self.fontImage = self.preResourceImageUtil:encapsulate(image)
                end
                do return "__jreturn", self.fontImage end
            else
                do return "__jreturn", self.fontImage end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, self, commonStrings.EXCEPTION, e)
            error(require("java.lang.RuntimeException").new(), 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(TrueTypeFontUtil, "getFontBitmapGL", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "GL10")) and (java_a2 == nil or type(java_a2) == "string") and type(java_a3) == "number" and (java_a4 == nil or java_is(java_a4, "BasicColor")) end)


function TrueTypeFontUtil:saveFontAtlasAsFile()
        local image = self:getFontBitmap(nil, self.cellSize, BasicColorFactory.getInstance().WHITE)
        local imageLoader = ImageLoader.new()
        local width = image:getWidth()
        local height = image:getHeight()
        local pixels = java_typed_array("I", java_new_array(0, width * height))
        image:getRGB(pixels, 0, width, 0, 0, width, height)
        local imageData = ImageData.new(width, height, 32, PaletteData.new(0xFF0000, 0xFF00, 0xFF))
        for index = 0, (pixels.n or #pixels) - 1 do
            pixels[index + 1] = pixels[index + 1] & (0xFFFFFF)
        end
        for row = 0, height - 1 do
            imageData:setPixels(0, row, width, pixels, row * width)
        end
        imageData.transparentPixel = imageData:getPixel(0, 0)
        imageLoader.data = {imageData}
        imageLoader:save(CommonSeps.getInstance().PERIOD + CanvasStrings.getInstance().FONT_ATLAS, SWT.IMAGE_PNG)
end
java_overload(TrueTypeFontUtil, "saveFontAtlasAsFile", 0)


function TrueTypeFontUtil:getFontBitmap(filename, cellSize, basicColor)
        local cellsPerRow2 = self.CELLS_PER_ROW * 2
        local cellsPerRow3 = self.CELLS_PER_ROW * 3
        local cellsPerRow4 = self.CELLS_PER_ROW * 4
        local cellsPerRow5 = self.CELLS_PER_ROW * 5
        local cellsPerRow6 = self.CELLS_PER_ROW * 6
        local cellsPerRow7 = self.CELLS_PER_ROW * 7
        local image = Image.createImage(self.textureSize, self.textureSize)
        local graphics = image:getGraphics()
        graphics:setColor(require("allbinary_java").number_value(basicColor, "intValue"))
        local biggestHeight = 0
        local bounds = Rectangle.new(PointFactory.getInstance():createXY(0, 0), cellSize, cellSize)
        local x = 0
        local y = 0
        for index = 0, self.size_f - 1 do
            self.characterArray[1] = self.pattern:charAt(index)
            self._characterWidth[index + 1] = bounds:getMaxX()
            if bounds:getMaxY() - bounds:getPoint():getX() > biggestHeight then
                biggestHeight = bounds:getMaxY() - bounds:getPoint():getX()
            end
            x = (index % self.CELLS_PER_ROW) * cellSize
            x = x + ((((cellSize) // (1 << (1)))))
            x = x - ((((self._characterWidth[index + 1]) // (1 << (1)))))
            y = -((cellSize) // (1 << (1)))
            if index >= self.CELLS_PER_ROW then
                y = y + (cellSize)
            end
            if index >= cellsPerRow2 then
                y = y + (cellSize)
            end
            if index >= cellsPerRow3 then
                y = y + (cellSize)
            end
            if index >= cellsPerRow4 then
                y = y + (cellSize)
            end
            if index >= cellsPerRow5 then
                y = y + (cellSize)
            end
            if index >= cellsPerRow6 then
                y = y + (cellSize)
            end
            if index >= cellsPerRow7 then
                y = y + (cellSize)
            end
            y = y + (cellSize)
            y = y - ((((cellSize) // (1 << (2)))))
            graphics:drawChar(self.characterArray[1], x, y, 0)
        end
        return image
end
java_overload(TrueTypeFontUtil, "getFontBitmap", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or type(java_a1) == "string") and type(java_a2) == "number" and (java_a3 == nil or java_is(java_a3, "BasicColor")) end)


function TrueTypeFontUtil:getFontWidths(filename, fontSize)
        local commonStrings = CommonStrings.getInstance()
        for index = 0, self.size_f - 1 do
            self.characterArray[1] = self.pattern:charAt(index)
            if rawequal(self.characterArray[1], " ") then
                self._characterWidth[index + 1] = (java_idiv(fontSize, 4))
            else
                local shortPatternIndex = self.shortPattern:indexOf(self.characterArray[1])
                local w = java_int((self.widthFloatArray[shortPatternIndex + 1] / 75.0)) + 19
                self._characterWidth[index + 1] = w
                if rawequal(self.characterArray[1], ".") or rawequal(self.characterArray[1], "1") then
                    self._characterWidth[index + 1] = self._characterWidth[index + 1] + (4)
                end
                if self.characterArray[1] >= "a" and self.characterArray[1] < "k" then
                    self._characterWidth[index + 1] = self._characterWidth[index + 1] - (2)
                end
                if self.characterArray[1] >= "k" and self.characterArray[1] < "v" then
                    self._characterWidth[index + 1] = self._characterWidth[index + 1] - (4)
                end
                if self.characterArray[1] >= "v" and self.characterArray[1] < "z" then
                    self._characterWidth[index + 1] = self._characterWidth[index + 1] - (8)
                end
                if rawequal(self.characterArray[1], "D") then
                    self._characterWidth[index + 1] = self._characterWidth[index + 1] - (4)
                end
                if self.characterArray[1] >= "A" and self.characterArray[1] <= "Z" then
                    self._characterWidth[index + 1] = self._characterWidth[index + 1] - (2)
                end
            end
            self._characterWidth[index + 1] = java_int((self._characterWidth[index + 1] * self.widthScale))
        end
        return self._characterWidth
end
java_overload(TrueTypeFontUtil, "getFontWidths", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and type(java_a2) == "number" end)

TrueTypeFontUtil.instance_f = TrueTypeFontUtil.new()

return TrueTypeFontUtil

