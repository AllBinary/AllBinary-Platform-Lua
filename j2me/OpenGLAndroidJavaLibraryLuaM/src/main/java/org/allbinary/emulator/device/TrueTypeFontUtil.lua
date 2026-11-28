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

local File = java_lazy("java.io.File")
-- local FileOutputStream = require("java.io.FileOutputStream")
local GL10 = java_lazy("javax.microedition.khronos.opengles.GL10")
local Image = java_lazy("javax.microedition.lcdui.Image")
local Bitmap = java_lazy("android.graphics.Bitmap")
local Canvas = java_lazy("android.graphics.Canvas")
local Paint = java_lazy("android.graphics.Paint")
local Rect = java_lazy("android.graphics.Rect")
local Typeface = java_lazy("android.graphics.Typeface")
local ResourceUtil = java_lazy("org.allbinary.data.resource.ResourceUtil")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local PreResourceImageUtil = java_lazy("org.allbinary.image.PreResourceImageUtil")
local OpenGLESImage = java_lazy("org.allbinary.image.opengles.OpenGLESImage")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local AndroidImageInterface = java_lazy("org.microemu.android.device.AndroidImageInterface")
local AndroidImmutableImage = java_lazy("org.microemu.android.device.AndroidImmutableImage")
local TrueTypeFontUtilBase = require("org.allbinary.emulator.device.TrueTypeFontUtilBase")

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
    self.logUtil = LogUtil.getInstance()
    self.preResourceImageUtil = PreResourceImageUtil.getInstance()
    self.realFontSize = 18
    self.fontImage = OpenGLESImage.NULL_OPENGL_IMAGE
end


function TrueTypeFontUtil.getInstance()
        return TrueTypeFontUtil.instance_f
end


function TrueTypeFontUtil._jinit(self)
    java_super_init(TrueTypeFontUtilBase, self, 1)
    TrueTypeFontUtil._init_fields(self)
        -- super(...) made self above
    return self
end

function TrueTypeFontUtil.new(...)
    local self = setmetatable({}, TrueTypeFontUtil)
    TrueTypeFontUtil._jinit(self, ...)
    return self
end


function TrueTypeFontUtil:saveFontAtlasAsFile()
        local try_ok, try_error, try_value = pcall(function()
            local commonStrings = CommonStrings.getInstance()
            local file = ResourceUtil.getInstance():getContext():getFilesDir()
            local path = file:getAbsolutePath() + CanvasStrings.getInstance().FONT_ATLAS
            self.logUtil:putF(path, self, commonStrings.CONSTRUCTOR)
            local fos = FileOutputStream.new(path)
            local bitmap = (self.fontImage.openGLBitmap:getImage()):getBitmap()
            bitmap:compress(Bitmap.CompressFormat.PNG, 100, fos)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, self, commonStrings.EXCEPTION, e)
        end
end
java_overload(TrueTypeFontUtil, "saveFontAtlasAsFile", 0)


function TrueTypeFontUtil:getFontBitmapGL(gl, filename, cellSize, basicColor)
        if rawequal(self.fontImage, OpenGLESImage.NULL_OPENGL_IMAGE) then
            local cellsPerRow2 = self.CELLS_PER_ROW * 2
            local cellsPerRow3 = self.CELLS_PER_ROW * 3
            local cellsPerRow4 = self.CELLS_PER_ROW * 4
            local cellsPerRow5 = self.CELLS_PER_ROW * 5
            local cellsPerRow6 = self.CELLS_PER_ROW * 6
            local cellsPerRow7 = self.CELLS_PER_ROW * 7
            local typeface = Typeface.DEFAULT
            local textureSize = self:getAsTextureSize(self.CELLS_PER_ROW * cellSize)
            local bitmap = Bitmap.createBitmap(textureSize, textureSize, Bitmap.Config.ARGB_8888)
            local canvas = Canvas.new(bitmap)
            local paint = Paint.new()
            paint:setTypeface(typeface)
            paint:setTextSize((self.realFontSize + 0.0))
            paint:setAlpha(java_int(basicColor.alpha))
            paint:setColor(math.tointeger(basicColor // 1))
            local biggestHeight = 0
            local bounds = Rect.new()
            local x = 0
            local y = 0
            for index = 0, self.size_f - 1 do
                self.characterArray[1] = self.pattern:charAt(index)
                paint:getTextBounds(self.characterArray, 0, 1, bounds)
                self._characterWidth[index + 1] = bounds.right
                if bounds.bottom - bounds.top > biggestHeight then
                    biggestHeight = bounds.bottom - bounds.top
                end
                x = (index % self.CELLS_PER_ROW) * cellSize
                x = x + ((((cellSize) // (1 << (1)))))
                x = x - ((((self._characterWidth[index + 1]) // (1 << (1)))))
                y = 0
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
                canvas:drawText(self.characterArray, 0, 1, (x + 0.0) - 3.0, (y + 0.0) - 6.0, paint)
            end
            canvas:save()
            local image = AndroidImmutableImage.create(bitmap)
            self.fontImage = self.preResourceImageUtil:encapsulate(image)
            return self.fontImage
        else
            return self.fontImage
        end
end
java_overload(TrueTypeFontUtil, "getFontBitmapGL", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "GL10")) and (java_a2 == nil or type(java_a2) == "string") and type(java_a3) == "number" and (java_a4 == nil or java_is(java_a4, "BasicColor")) end)


function TrueTypeFontUtil:getFontWidths(filename, fontSize)
        local typeface = Typeface.DEFAULT
        local paint = Paint.new()
        paint:setTypeface(typeface)
        paint:setTextSize((fontSize + 0.0))
        paint:setARGB(255, 255, 255, 255)
        local bounds = Rect.new()
        for index = 0, self.size_f - 1 do
            self.characterArray[1] = self.pattern:charAt(index)
            paint:getTextBounds(self.characterArray, 0, 1, bounds)
            if index < self.lastCapIndex then
                if rawequal(self.characterArray[1], "1") then
                    self._characterWidth[index + 1] = bounds.right + 3
                elseif rawequal(self.characterArray[1], "J") or rawequal(self.characterArray[1], "V") or rawequal(self.characterArray[1], "2") or rawequal(self.characterArray[1], "9") or rawequal(self.characterArray[1], "I") or rawequal(self.characterArray[1], "N") or rawequal(self.characterArray[1], "U") then
                    self._characterWidth[index + 1] = bounds.right + 1
                elseif rawequal(self.characterArray[1], "4") or rawequal(self.characterArray[1], "C") or rawequal(self.characterArray[1], "E") or rawequal(self.characterArray[1], "O") then
                    self._characterWidth[index + 1] = bounds.right - 2
                elseif rawequal(self.characterArray[1], "B") or rawequal(self.characterArray[1], "D") or rawequal(self.characterArray[1], "G") or rawequal(self.characterArray[1], "H") or rawequal(self.characterArray[1], "T") or rawequal(self.characterArray[1], "W") then
                    self._characterWidth[index + 1] = bounds.right - 3
                elseif rawequal(self.characterArray[1], "A") or rawequal(self.characterArray[1], "Q") or rawequal(self.characterArray[1], "R") then
                    self._characterWidth[index + 1] = bounds.right - 5
                elseif rawequal(self.characterArray[1], "M") then
                    self._characterWidth[index + 1] = bounds.right - 6
                elseif rawequal(self.characterArray[1], "m") then
                    self._characterWidth[index + 1] = bounds.right - 8
                else
                    self._characterWidth[index + 1] = bounds.right
                end
            else
                if rawequal(self.characterArray[1], " ") then
                    self._characterWidth[index + 1] = bounds.right + 10
                elseif rawequal(self.characterArray[1], "l") or rawequal(self.characterArray[1], "i") or rawequal(self.characterArray[1], "j") or rawequal(self.characterArray[1], ".") or rawequal(self.characterArray[1], "!") or rawequal(self.characterArray[1], "|") then
                    self._characterWidth[index + 1] = bounds.right + 6
                elseif rawequal(self.characterArray[1], "f") or rawequal(self.characterArray[1], "t") or rawequal(self.characterArray[1], "u") or rawequal(self.characterArray[1], "v") then
                    self._characterWidth[index + 1] = bounds.right + 1
                elseif rawequal(self.characterArray[1], "r") then
                    self._characterWidth[index + 1] = bounds.right + 2
                elseif rawequal(self.characterArray[1], "a") or rawequal(self.characterArray[1], "b") or rawequal(self.characterArray[1], "g") or rawequal(self.characterArray[1], "u") then
                    self._characterWidth[index + 1] = bounds.right - 1
                elseif rawequal(self.characterArray[1], "o") or rawequal(self.characterArray[1], "e") then
                    self._characterWidth[index + 1] = bounds.right - 2
                elseif rawequal(self.characterArray[1], "m") then
                    self._characterWidth[index + 1] = bounds.right - 7
                else
                    self._characterWidth[index + 1] = bounds.right
                end
            end
        end
        self._characterWidth[1] = (((fontSize) // (1 << (1)))) - 2
        return self._characterWidth
end
java_overload(TrueTypeFontUtil, "getFontWidths", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and type(java_a2) == "number" end)

TrueTypeFontUtil.instance_f = TrueTypeFontUtil.new()

return TrueTypeFontUtil

