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

local ScrollCurrentSelectionForm = {}
package.loaded["org.allbinary.graphics.form.ScrollCurrentSelectionForm"] = ScrollCurrentSelectionForm

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
local Processor = java_lazy("org.allbinary.canvas.Processor")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local ABCustomItem = java_lazy("org.allbinary.graphics.form.item.ABCustomItem")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local FormType = java_lazy("org.allbinary.graphics.form.FormType")
local FormTypeFactory = java_lazy("org.allbinary.graphics.form.FormTypeFactory")
local HorizontalFormProcessor = java_lazy("org.allbinary.graphics.form.HorizontalFormProcessor")
local HorizontalItemIndexDx = java_lazy("org.allbinary.graphics.form.HorizontalItemIndexDx")
local ItemIndexDx = java_lazy("org.allbinary.graphics.form.ItemIndexDx")
local ItemPaintableFactory = java_lazy("org.allbinary.graphics.form.ItemPaintableFactory")
local TempHorizontalFormProcessor = java_lazy("org.allbinary.graphics.form.TempHorizontalFormProcessor")
local TempHorizontalItemIndexDx = java_lazy("org.allbinary.graphics.form.TempHorizontalItemIndexDx")
local VerticalFormProcessor = java_lazy("org.allbinary.graphics.form.VerticalFormProcessor")
local VerticalItemIndexDx = java_lazy("org.allbinary.graphics.form.VerticalItemIndexDx")

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

-- class table ScrollCurrentSelectionForm is declared before the requires
ScrollCurrentSelectionForm.__index = ScrollCurrentSelectionForm
ScrollCurrentSelectionForm.className = "ScrollCurrentSelectionForm"
ScrollCurrentSelectionForm.javaClassName = "org.allbinary.graphics.form.ScrollCurrentSelectionForm"
setmetatable(ScrollCurrentSelectionForm, {__index = ScrollSelectionForm})
ScrollCurrentSelectionForm.java_implements = " UpdateMyFontInterface "
ScrollCurrentSelectionForm.java_interfaces = function() return {UpdateMyFontInterface} end

function ScrollCurrentSelectionForm:_init_fields()
    if self.moveForSmallScreen == nil then self.moveForSmallScreen = false end
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    self.processor = Processor.getInstance()
    self.preItemIndexDx = ItemIndexDx.getInstance()
    if self.dx == nil then self.dx = 0 end
    if self.dy == nil then self.dy = 0 end
    self.maxWidth = 0
end


function ScrollCurrentSelectionForm._jinit(self, title, items, formPaintableFactory, border, adjustedExtraBorder, moveForSmallScreen, backgroundBasicColor, foregroundBasicColor)
    java_super_init(ScrollSelectionForm, self, title, items, formPaintableFactory, border, adjustedExtraBorder, backgroundBasicColor, foregroundBasicColor)
    ScrollCurrentSelectionForm._init_fields(self)
        -- super(...) made self above
        self.moveForSmallScreen = moveForSmallScreen
    return self
end

function ScrollCurrentSelectionForm.new(...)
    local self = setmetatable({}, ScrollCurrentSelectionForm)
    ScrollCurrentSelectionForm._jinit(self, ...)
    return self
end


-- throws Exception
function ScrollCurrentSelectionForm:init(rectangle, formType)
        java_super(ScrollSelectionForm, "init", 2)(self, rectangle, formType)
        local formTypeFactory = FormTypeFactory.getInstance()
        if rawequal(formType, formTypeFactory.TEMP_HORIZONTAL_FORM) then
            self.processor = TempHorizontalFormProcessor.new(self)
            self.preItemIndexDx = TempHorizontalItemIndexDx.new(self)
        elseif rawequal(formType, formTypeFactory.HORIZONTAL_FORM) then
            self.processor = HorizontalFormProcessor.new(self)
            self.preItemIndexDx = HorizontalItemIndexDx.new(self)
        elseif rawequal(formType, formTypeFactory.VERTICAL_CENTER_FORM) then
            self.processor = VerticalFormProcessor.new(self)
            self.preItemIndexDx = VerticalItemIndexDx.new(self)
        elseif rawequal(formType, formTypeFactory.NULL_FORM_TYPE) then
        else
            self.logUtil:putF(formTypeFactory.UNK, self, self.commonStrings.INIT)
        end
        self.myFontProcessor = self.updateMyFontProcessor
end
java_overload(ScrollCurrentSelectionForm, "init", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "Rectangle")) and (java_a2 == nil or java_is(java_a2, "FormType")) end)


function ScrollCurrentSelectionForm:updateMeasurement(graphics)
        self.myFontProcessor = MyFontProcessor.getInstance()
end
java_overload(ScrollCurrentSelectionForm, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function ScrollCurrentSelectionForm:processTempHorizontalForm()
        self.dx = self.x - 30 + (((self.rectangle:getWidth()) // (1 << (1))))
        self.dy = self.y
end
java_overload(ScrollCurrentSelectionForm, "processTempHorizontalForm", 0)


function ScrollCurrentSelectionForm:processHorizontalForm()
        local size = self:size()
        local totalWidth = 0
        local item = nil
        for index = 0, size - 1 do
            item = self:get(index)
            totalWidth = totalWidth + (item:getMinimumWidth() + self.border)
        end
        self.dx = self.x + (((self.rectangle:getWidth()) // (1 << (1)))) - (((totalWidth) // (1 << (1))))
        self.dy = self.y + (((self.rectangle:getHeight()) // (1 << (1))))
        if self.moveForSmallScreen then
            local maxTitleHeight = 175
            if self.dy < maxTitleHeight then
                self.dy = maxTitleHeight
            end
        end
end
java_overload(ScrollCurrentSelectionForm, "processHorizontalForm", 0)


function ScrollCurrentSelectionForm:processVerticalForm()
        local totalHeight = 0
        local size = self:size()
        local item2 = nil
        for index = 0, size - 1 do
            item2 = self:get(index)
            if self.maxWidth < item2:getMinimumWidth() then
                self.maxWidth = item2:getMinimumWidth()
            end
            totalHeight = totalHeight + (item2:getMinimumHeight() + self.border)
        end
        self.dx = ((self.rectangle:getWidth() - self.maxWidth) / 2)
        if self:size() > 0 then
            self.dy = self.y + ((self.rectangle:getHeight() - totalHeight) / 2)
            if self.moveForSmallScreen then
                local maxTitleHeight = 175
                if self.dy < maxTitleHeight then
                    self.dy = maxTitleHeight
                end
            end
        else
            self.dy = self.y
        end
end
java_overload(ScrollCurrentSelectionForm, "processVerticalForm", 0)


function ScrollCurrentSelectionForm:getXTempHorizontalForm(index, item, dx, dy)
        return self:getDiffX(item)
end
java_overload(ScrollCurrentSelectionForm, "getXTempHorizontalForm", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "ABCustomItem")) and type(java_a3) == "number" and type(java_a4) == "number" end)


function ScrollCurrentSelectionForm:getXHorizontalForm(index, item, dx, dy)
        return 0
end
java_overload(ScrollCurrentSelectionForm, "getXHorizontalForm", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "ABCustomItem")) and type(java_a3) == "number" and type(java_a4) == "number" end)


function ScrollCurrentSelectionForm:getXVerticalForm(index, item, dx, dy)
        return self:getDiffX(item) + self.halfBorder
end
java_overload(ScrollCurrentSelectionForm, "getXVerticalForm", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "ABCustomItem")) and type(java_a3) == "number" and type(java_a4) == "number" end)


function ScrollCurrentSelectionForm:getDiffX(item)
        return ((((self.maxWidth - item:getMinimumWidth())) // (1 << (1))))
end
java_overload(ScrollCurrentSelectionForm, "getDiffX", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ABCustomItem")) end)


function ScrollCurrentSelectionForm:getDx()
        return self.dx
end
java_overload(ScrollCurrentSelectionForm, "getDx", 0)


function ScrollCurrentSelectionForm:getDy()
        return self.dy
end
java_overload(ScrollCurrentSelectionForm, "getDy", 0)


function ScrollCurrentSelectionForm:paint(graphics)
        local try_ok, try_error, try_value = pcall(function()
            self.processor:process()
            local delta = 0
            local deltaX = self:getDx()
            local deltaY = self:getDy()
            local size = self:size()
            local formTypeFactory = FormTypeFactory.getInstance()
            local item = nil
            for index = 0, size - 1 do
                item = self:get(index)
                local diffX = self.preItemIndexDx:getDx(index, item, self.dx, self.dy)
                if rawequal(index, self:getSelectedIndex()) then
                    delta = self:paintItem(graphics, index, item, deltaX + diffX, deltaY)
                    self.paintable:paint(graphics, index, deltaX + diffX, deltaY)
                else
                    delta = self:paintUnselectedItem(graphics, index, item, deltaX + diffX, deltaY)
                    self.paintable:paint(graphics, index, deltaX + diffX, deltaY)
                end
                if rawequal(self.formType, formTypeFactory.TEMP_HORIZONTAL_FORM) then
                elseif rawequal(self.formType, formTypeFactory.HORIZONTAL_FORM) then
                    deltaX = delta
                elseif rawequal(self.formType, formTypeFactory.VERTICAL_CENTER_FORM) then
                    deltaY = delta
                else
                    error(require("java.lang.Exception").new(formTypeFactory.UNK), 0)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.canvasStrings.PAINT, e)
        end
end
java_overload(ScrollCurrentSelectionForm, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return ScrollCurrentSelectionForm

