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
-- package org.allbinary.graphics.form

local CommandCurrentSelectionForm = {}
package.loaded["org.allbinary.graphics.form.CommandCurrentSelectionForm"] = CommandCurrentSelectionForm

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

-- local Command = require("javax.microedition.lcdui.Command")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local Animation = java_lazy("org.allbinary.animation.Animation")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local RectangleAdjustedAnimation = java_lazy("org.allbinary.animation.vector.RectangleAdjustedAnimation")
local RectangleFilledAdjustedAnimation = java_lazy("org.allbinary.animation.vector.RectangleFilledAdjustedAnimation")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local CommandTextItem = java_lazy("org.allbinary.graphics.form.item.CommandTextItem")
local ABCustomItem = java_lazy("org.allbinary.graphics.form.item.ABCustomItem")
local ScrollCurrentSelectionForm = require("org.allbinary.graphics.form.ScrollCurrentSelectionForm")
local ItemPaintableFactory = java_lazy("org.allbinary.graphics.form.ItemPaintableFactory")

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

-- class table CommandCurrentSelectionForm is declared before the requires
CommandCurrentSelectionForm.__index = CommandCurrentSelectionForm
CommandCurrentSelectionForm.className = "CommandCurrentSelectionForm"
CommandCurrentSelectionForm.javaClassName = "org.allbinary.graphics.form.CommandCurrentSelectionForm"
setmetatable(CommandCurrentSelectionForm, {__index = ScrollCurrentSelectionForm})
CommandCurrentSelectionForm.java_implements = " UpdateMyFontInterface "
CommandCurrentSelectionForm.java_interfaces = function() return {UpdateMyFontInterface} end

function CommandCurrentSelectionForm:_init_fields()
    self.selectedAnimationArray = java_new_array(nil, 16)
    self.unSelectedAnimationArray = java_new_array(nil, 16)
end


function CommandCurrentSelectionForm._jinit(self, title, items, border, moveForSmallScreen, backgroundBasicColor, foregroundBasicColor)
    java_super_init(ScrollCurrentSelectionForm, self, title, items, ItemPaintableFactory.getInstance(), border, -3, moveForSmallScreen, backgroundBasicColor, foregroundBasicColor)
    CommandCurrentSelectionForm._init_fields(self)
        -- super(...) made self above
        self:initAnimations()
        self:addAll(items)
    return self
end

function CommandCurrentSelectionForm.new(...)
    local self = setmetatable({}, CommandCurrentSelectionForm)
    CommandCurrentSelectionForm._jinit(self, ...)
    return self
end


function CommandCurrentSelectionForm:updateMeasurement(graphics)
        self:updateAll(graphics, self:getAllitems())
        java_super(ScrollCurrentSelectionForm, "updateMeasurement", 1)(self, graphics)
end
java_overload(CommandCurrentSelectionForm, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function CommandCurrentSelectionForm:initAnimations()
        local nullAnimation = NullAnimationFactory.getFactoryInstance():getInstance(0)
        do
            local index = (self.selectedAnimationArray.n or #self.selectedAnimationArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.selectedAnimationArray[index + 1] = nullAnimation
            end
        end
        do
            local index = (self.unSelectedAnimationArray.n or #self.unSelectedAnimationArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.unSelectedAnimationArray[index + 1] = nullAnimation
            end
        end
end
java_overload(CommandCurrentSelectionForm, "initAnimations", 0)


function CommandCurrentSelectionForm:addAll(items)
        do
            local index = (items.n or #items)
            while (function() index = index - 1 return index end)() >= 0 do
            self:addAt(index, items[index + 1])
            end
        end
end
java_overload(CommandCurrentSelectionForm, "addAll", 1, function(java_a1) return true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and java_a1.jt == nil and (java_a1[1] == nil or type(java_a1[1]) == "table"))) end)


function CommandCurrentSelectionForm:addAt(index, item)
        local basicColorFactory = BasicColorFactory.getInstance()
        local buttonColor = basicColorFactory.TRANSPARENT_GREY
        local selectedButtonColor = basicColorFactory.TRANSPARENT_RED
        local width = item:getMinimumWidth()
        local height = item:getMinimumHeight()
        local adjustedBorder = 3
        local offset = -self.halfBorder + adjustedBorder
        local rectWidth = width + self.border - adjustedBorder
        local rectHeight = height + self.border - adjustedBorder
        if J2MEUtil.isJ2ME() or J2MEUtil.isHTML() then
            self.selectedAnimationArray[index + 1] = RectangleAdjustedAnimation.new(rectWidth, rectHeight, offset, offset, selectedButtonColor)
        else
            self.selectedAnimationArray[index + 1] = RectangleFilledAdjustedAnimation.new(rectWidth, rectHeight, offset, offset, selectedButtonColor)
        end
        adjustedBorder = 4
        if J2MEUtil.isJ2ME() or J2MEUtil.isHTML() then
            self.unSelectedAnimationArray[index + 1] = RectangleAdjustedAnimation.new(rectWidth, rectHeight, offset, offset, buttonColor)
        else
            self.unSelectedAnimationArray[index + 1] = RectangleFilledAdjustedAnimation.new(rectWidth, rectHeight, offset, offset, buttonColor)
        end
end
java_overload(CommandCurrentSelectionForm, "addAt", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "ABCustomItem")) end)


function CommandCurrentSelectionForm:updateAll(graphics, items)
        do
            local index = (items.n or #items)
            while (function() index = index - 1 return index end)() >= 0 do
            items[index + 1]:preMeasurement(graphics)
            self:updateAt(index, items[index + 1])
            end
        end
end
java_overload(CommandCurrentSelectionForm, "updateAll", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and (java_a2 == nil or (type(java_a2) == "table" and getmetatable(java_a2) == nil and java_a2.jt == nil and (java_a2[1] == nil or type(java_a2[1]) == "table"))) end)


function CommandCurrentSelectionForm:updateAt(index, item)
        local basicColorFactory = BasicColorFactory.getInstance()
        local buttonColor = basicColorFactory.TRANSPARENT_GREY
        local selectedButtonColor = basicColorFactory.TRANSPARENT_RED
        local width = item:getMinimumWidth()
        local height = item:getMinimumHeight()
        local adjustedBorder = 3
        local offset = -self.halfBorder + adjustedBorder
        local rectWidth = width + self.border - adjustedBorder
        local rectHeight = height + self.border - adjustedBorder
        if J2MEUtil.isJ2ME() or J2MEUtil.isHTML() then
            local rectangleAdjustedAnimation = self.selectedAnimationArray[index + 1]
            rectangleAdjustedAnimation:setWidth(rectWidth)
            rectangleAdjustedAnimation:setHeight(rectHeight)
            rectangleAdjustedAnimation:setOffsetX(offset)
            rectangleAdjustedAnimation:setOffsetY(offset)
            rectangleAdjustedAnimation:setBasicColorP(selectedButtonColor)
        else
            local rectangleAdjustedAnimation = self.selectedAnimationArray[index + 1]
            rectangleAdjustedAnimation:setWidth(rectWidth)
            rectangleAdjustedAnimation:setHeight(rectHeight)
            rectangleAdjustedAnimation:setOffsetX(offset)
            rectangleAdjustedAnimation:setOffsetY(offset)
            rectangleAdjustedAnimation:setBasicColorP(selectedButtonColor)
        end
        adjustedBorder = 4
        if J2MEUtil.isJ2ME() or J2MEUtil.isHTML() then
            local rectangleAdjustedAnimation = self.unSelectedAnimationArray[index + 1]
            rectangleAdjustedAnimation:setWidth(rectWidth)
            rectangleAdjustedAnimation:setHeight(rectHeight)
            rectangleAdjustedAnimation:setOffsetX(offset)
            rectangleAdjustedAnimation:setOffsetY(offset)
            rectangleAdjustedAnimation:setBasicColorP(buttonColor)
        else
            local rectangleAdjustedAnimation = self.unSelectedAnimationArray[index + 1]
            rectangleAdjustedAnimation:setWidth(rectWidth)
            rectangleAdjustedAnimation:setHeight(rectHeight)
            rectangleAdjustedAnimation:setOffsetX(offset)
            rectangleAdjustedAnimation:setOffsetY(offset)
            rectangleAdjustedAnimation:setBasicColorP(buttonColor)
        end
end
java_overload(CommandCurrentSelectionForm, "updateAt", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "ABCustomItem")) end)


function CommandCurrentSelectionForm:getSelectedCommand()
        local index = java_super(ScrollCurrentSelectionForm, "getSelectedIndex", 0)(self)
        local commandTextItem = self:get(index)
        return commandTextItem:getCommand()
end
java_overload(CommandCurrentSelectionForm, "getSelectedCommand", 0)


function CommandCurrentSelectionForm:append(item)
        local result = java_super(ScrollCurrentSelectionForm, "append", 1)(self, item)
        self:addAt(result, item)
        return result
end
java_overload(CommandCurrentSelectionForm, "append", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ABCustomItem")) end)


function CommandCurrentSelectionForm:delete(itemNum)
        java_super(ScrollCurrentSelectionForm, "delete", 1)(self, itemNum)
end
java_overload(CommandCurrentSelectionForm, "delete", 1, function(java_a1) return true and type(java_a1) == "number" end)


function CommandCurrentSelectionForm:deleteAll()
        self:initAnimations()
        java_super(ScrollCurrentSelectionForm, "deleteAll", 0)(self)
end
java_overload(CommandCurrentSelectionForm, "deleteAll", 0)


function CommandCurrentSelectionForm:insert(itemNum, item)
        java_super(ScrollCurrentSelectionForm, "insert", 2)(self, itemNum, item)
end
java_overload(CommandCurrentSelectionForm, "insert", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "ABCustomItem")) end)


function CommandCurrentSelectionForm:set(itemNum, item)
        java_super(ScrollCurrentSelectionForm, "set", 2)(self, itemNum, item)
end
java_overload(CommandCurrentSelectionForm, "set", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "ABCustomItem")) end)


function CommandCurrentSelectionForm:paint(graphics)
        self.myFontProcessor:process(graphics)
        java_super(ScrollCurrentSelectionForm, "paint", 1)(self, graphics)
end
java_overload(CommandCurrentSelectionForm, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


-- throws Exception
function CommandCurrentSelectionForm:paintItem(graphics, index, item, x, y)
        self.selectedAnimationArray[index + 1]:paintXY(graphics, x, y)
        return java_super(ScrollCurrentSelectionForm, "paintItem", 5)(self, graphics, index, item, x, y)
end
java_overload(CommandCurrentSelectionForm, "paintItem", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and (java_a3 == nil or java_is(java_a3, "ABCustomItem")) and type(java_a4) == "number" and type(java_a5) == "number" end)


-- throws Exception
function CommandCurrentSelectionForm:paintUnselectedItem(graphics, index, item, x, y)
        self.unSelectedAnimationArray[index + 1]:paintXY(graphics, x, y)
        return java_super(ScrollCurrentSelectionForm, "paintUnselectedItem", 5)(self, graphics, index, item, x, y)
end
java_overload(CommandCurrentSelectionForm, "paintUnselectedItem", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and (java_a3 == nil or java_is(java_a3, "ABCustomItem")) and type(java_a4) == "number" and type(java_a5) == "number" end)

return CommandCurrentSelectionForm

