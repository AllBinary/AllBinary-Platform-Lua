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
-- package org.allbinary.game.displayable.canvas

local StartIntermissionPaintable = {}
package.loaded["org.allbinary.game.displayable.canvas.StartIntermissionPaintable"] = StartIntermissionPaintable

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

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Anchor = java_lazy("org.allbinary.graphics.Anchor")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local BasicColorSetUtil = java_lazy("org.allbinary.graphics.color.BasicColorSetUtil")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local FontDebugFactory = java_lazy("org.allbinary.graphics.font.FontDebugFactory")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local InitUpdatePaintable = require("org.allbinary.graphics.paint.InitUpdatePaintable")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")

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

-- class table StartIntermissionPaintable is declared before the requires
StartIntermissionPaintable.__index = StartIntermissionPaintable
StartIntermissionPaintable.className = "StartIntermissionPaintable"
StartIntermissionPaintable.javaClassName = "org.allbinary.game.displayable.canvas.StartIntermissionPaintable"
setmetatable(StartIntermissionPaintable, {__index = InitUpdatePaintable})
StartIntermissionPaintable.java_implements = " UpdateMyFontInterface "
StartIntermissionPaintable.java_interfaces = function() return {UpdateMyFontInterface} end

function StartIntermissionPaintable:_init_fields()
    self.fontDebugFactory = FontDebugFactory.getInstance()
    self.basicSetColorUtil = BasicColorSetUtil.getInstance()
    if self.gameCanvas == nil then self.gameCanvas = nil end
    if self.stringArray == nil then self.stringArray = nil end
    if self.fontSize == nil then self.fontSize = nil end
    if self.font == nil then self.font = nil end
    if self.lastWidth == nil then self.lastWidth = nil end
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    self.basicColor = BasicColorFactory.getInstance().BLACK
    if self.color == nil then self.color = nil end
    self.lineYOffsetArray = NullUtil.getInstance().NULL_INT_ARRAY
    self.hasChanged = true
    self.anchor = Anchor.TOP_LEFT
    if self.fontHeightP == nil then self.fontHeightP = 0 end
    self.BEGIN_LEVEL = "Begin Level "
    self.EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
end


function StartIntermissionPaintable._jinit(self, gameCanvas, stringArray, basicColor, font)
    java_super_init(InitUpdatePaintable, self)
    StartIntermissionPaintable._init_fields(self)
        self.gameCanvas = gameCanvas
        self.stringArray = stringArray
        self.lastWidth = java_typed_array("I", java_new_array(0, (self.stringArray.n or #self.stringArray)))
        self:setBasicColorP(basicColor)
        self.color = math.tointeger(basicColor // 1)
        self.fontSize = font:getSize()
        self.font = font
    return self
end

function StartIntermissionPaintable.new(...)
    local self = setmetatable({}, StartIntermissionPaintable)
    StartIntermissionPaintable._jinit(self, ...)
    return self
end


function StartIntermissionPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.fontHeightP = font:getHeight()
        self.myFontProcessor = MyFontProcessor.getInstance()
end
java_overload(StartIntermissionPaintable, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function StartIntermissionPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        local existingFont = graphics:getFont()
        self.fontDebugFactory:setFont(self.font, graphics)
        local displayInfo = DisplayInfoSingleton.getInstance()
        self.basicSetColorUtil:setBasicColorP3(graphics, self.basicColor, self.color)
        local beginWidth = 0
        for index = (self.lineYOffsetArray.n or #self.lineYOffsetArray) - 1, 0, -1 do
            if self.hasChanged then
                self.lastWidth[index + 1] = (((graphics:getFont():stringWidth(self.stringArray[index + 1])) // (1 << (1))))
            end
            beginWidth = self.lastWidth[index + 1]
            graphics:drawString(self.stringArray[index + 1], displayInfo:getLastHalfWidth() - beginWidth, displayInfo:getLastHalfHeight() - self.lineYOffsetArray[index + 1], self.anchor)
        end
        self.hasChanged = false
        self.fontDebugFactory:setFont(existingFont, graphics)
end
java_overload(StartIntermissionPaintable, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function StartIntermissionPaintable:update()
        local level = self.gameCanvas:getLayerManager():getGameInfo():getCurrentLevel()
        self.stringArray[1] = tostring(StringMaker.new():append(self.BEGIN_LEVEL):appendint(level))
        for index = (self.stringArray.n or #self.stringArray) - 1, 1, -1 do
            self.stringArray[index + 1] = self.EMPTY_STRING
        end
end
java_overload(StartIntermissionPaintable, "update", 0)


function StartIntermissionPaintable:setBasicColorP(basicColor)
        self.basicColor = basicColor
end
java_overload(StartIntermissionPaintable, "setBasicColorP", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)


function StartIntermissionPaintable:getBasicColorP()
        return self.basicColor
end
java_overload(StartIntermissionPaintable, "getBasicColorP", 0)

return StartIntermissionPaintable

