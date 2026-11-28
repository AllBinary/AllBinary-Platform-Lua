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
-- package org.allbinary.animation.text

local TextAnimation = {}
package.loaded["org.allbinary.animation.text.TextAnimation"] = TextAnimation

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

local Font = java_lazy("javax.microedition.lcdui.Font")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local AnimationBehavior = java_lazy("org.allbinary.animation.AnimationBehavior")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local Anchor = java_lazy("org.allbinary.graphics.Anchor")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local SWTJOGLProcessor = java_lazy("org.allbinary.graphics.threed.SWTJOGLProcessor")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local TextChangeListener = java_lazy("org.allbinary.animation.text.TextChangeListener")

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

-- class table TextAnimation is declared before the requires
TextAnimation.__index = TextAnimation
TextAnimation.className = "TextAnimation"
TextAnimation.javaClassName = "org.allbinary.animation.text.TextAnimation"
setmetatable(TextAnimation, {__index = IndexedAnimation})
TextAnimation.java_implements = " UpdateMyFontInterface "
TextAnimation.java_interfaces = function() return {UpdateMyFontInterface} end

function TextAnimation:_init_fields()
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    self.textArrayP = StringUtil.getInstance().ONE_EMPTY_STRING_ARRAY
    self.anchor = Anchor.TOP_LEFT
    self.fontHeight = 0
    self.offsetY = 0
    self.textChangeListener = TextChangeListener.getInstance()
end


function TextAnimation._jinit(self, text, animationBehavior)
    java_super_init(IndexedAnimation, self, animationBehavior)
    TextAnimation._init_fields(self)
        -- super(...) made self above
        self:setText(text)
    return self
end

function TextAnimation.new(...)
    local self = setmetatable({}, TextAnimation)
    TextAnimation._jinit(self, ...)
    return self
end


function TextAnimation:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.fontHeight = font:getHeight()
        local adjustedFontHeight = java_int(-(self.fontHeight + 0.0) * 2.00)
        self.offsetY = (function() if SWTJOGLProcessor.getInstance():isJOGL() then return adjustedFontHeight else return 0 end end)()
        self.textChangeListener:onMeasure()
        self.textChangeListener = TextChangeListener.getInstance()
        self.myFontProcessor = MyFontProcessor.getInstance()
end
java_overload(TextAnimation, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


-- throws Exception
function TextAnimation:nextFrame()
end
java_overload(TextAnimation, "nextFrame", 0)


function TextAnimation:paintXY(graphics, x, y)
        self.myFontProcessor:process(graphics)
        self:paintXYNoUpdate(graphics, x, y)
end
java_overload(TextAnimation, "paintXY", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function TextAnimation:paintXYNoUpdate(graphics, x, y)
        self.basicSetColorUtil:setBasicColorP3(graphics, self:getBasicColorP(), self:getColor())
        local size = (self.textArrayP.n or #self.textArrayP)
        for index = 0, size - 1 do
            graphics:drawString(self.textArrayP[index + 1], x, y + self.offsetY + (index * self.fontHeight), self.anchor)
        end
end
java_overload(TextAnimation, "paintXYNoUpdate", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and type(java_a3) == "number" end)


function TextAnimation:setTextWithOnMeasure(text, textChangeListener)
        self:setText(text)
        self.textChangeListener = textChangeListener
end
java_overload(TextAnimation, "setTextWithOnMeasure", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or java_is(java_a2, "TextChangeListener")) end)


function TextAnimation:setText(text)
        local list = BasicArrayListD.new()
        if #text > 0 then
            local index = 0
            local startIndex = 0
            local endIndex = 0
            while index >= 0 do
                startIndex = index
                index = ((string.find(text, "\n", (startIndex) + 1, true) or 0) - 1)
                endIndex = index
                if index < 0 then
                    endIndex = #text
                end
                list:add(string.sub(text, (startIndex) + 1, endIndex))
                if index < 0 then
                    break
                end
                index = index + 1
            end
        end
        if list:size() > 0 then
            local textArray = java_new_array(nil, list:size())
            local size = list:size()
            for index = 0, size - 1 do
                textArray[index + 1] = list:get(index)
            end
            self.textArrayP = textArray
        else
            self.textArrayP = StringUtil.getInstance().ONE_EMPTY_STRING_ARRAY
        end
        self.myFontProcessor = self.updateMyFontProcessor
end
java_overload(TextAnimation, "setText", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function TextAnimation:getTextArray()
        return self.textArrayP
end
java_overload(TextAnimation, "getTextArray", 0)


function TextAnimation:getFontHeight()
        return self.fontHeight
end
java_overload(TextAnimation, "getFontHeight", 0)

return TextAnimation

