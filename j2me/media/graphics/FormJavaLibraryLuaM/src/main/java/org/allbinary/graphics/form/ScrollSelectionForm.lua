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

local ScrollSelectionForm = {}
package.loaded["org.allbinary.graphics.form.ScrollSelectionForm"] = ScrollSelectionForm

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

local Canvas = java_lazy("javax.microedition.lcdui.Canvas")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local ABCustomItem = java_lazy("org.allbinary.graphics.form.item.ABCustomItem")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local RectangleCollisionUtil = java_lazy("org.allbinary.math.RectangleCollisionUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local PaintableForm = require("org.allbinary.graphics.form.PaintableForm")
local FormType = java_lazy("org.allbinary.graphics.form.FormType")
local FormTypeFactory = java_lazy("org.allbinary.graphics.form.FormTypeFactory")
local ItemIndexDx = java_lazy("org.allbinary.graphics.form.ItemIndexDx")
local ItemIndexPaintable = java_lazy("org.allbinary.graphics.form.ItemIndexPaintable")
local ItemPaintable = java_lazy("org.allbinary.graphics.form.ItemPaintable")
local ItemPaintableFactory = java_lazy("org.allbinary.graphics.form.ItemPaintableFactory")
local ScrollSelectionFormHorizontalDx = java_lazy("org.allbinary.graphics.form.ScrollSelectionFormHorizontalDx")
local ScrollSelectionFormHorizontalPaintable = java_lazy("org.allbinary.graphics.form.ScrollSelectionFormHorizontalPaintable")
local ScrollSelectionFormTempHorizontalDx = java_lazy("org.allbinary.graphics.form.ScrollSelectionFormTempHorizontalDx")
local ScrollSelectionFormTempHorizontalPaintable = java_lazy("org.allbinary.graphics.form.ScrollSelectionFormTempHorizontalPaintable")
local ScrollSelectionFormVericalDx = java_lazy("org.allbinary.graphics.form.ScrollSelectionFormVericalDx")
local ScrollSelectionFormVerticalPaintable = java_lazy("org.allbinary.graphics.form.ScrollSelectionFormVerticalPaintable")

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

-- class table ScrollSelectionForm is declared before the requires
ScrollSelectionForm.__index = ScrollSelectionForm
ScrollSelectionForm.className = "ScrollSelectionForm"
ScrollSelectionForm.javaClassName = "org.allbinary.graphics.form.ScrollSelectionForm"
setmetatable(ScrollSelectionForm, {__index = PaintableForm})

function ScrollSelectionForm:_init_fields()
    self.rectangleCollisionUtil = RectangleCollisionUtil.getInstance()
    if self.border == nil then self.border = 0 end
    if self.halfBorder == nil then self.halfBorder = 0 end
    if self.buttonBasicColor == nil then self.buttonBasicColor = nil end
    self.scrollSelectionFormFormTypeItemIndexPaintable = ItemIndexPaintable.getInstance()
    self.formTypeItemIndexDx = ItemIndexDx.getInstance()
    self.paintable = ItemPaintableFactory.getInstance()
    if self.adjustedExtraBorder == nil then self.adjustedExtraBorder = 0 end
end


function ScrollSelectionForm.createForm(title, items, formPaintableFactory, border, backgroundBasicColor, foregroundBasicColor)
        local try_ok, try_error, try_value = pcall(function()
            if rawequal(formPaintableFactory, ItemPaintableFactory.getInstance()) then
                do return "__jreturn", ScrollSelectionForm.new(title, items, formPaintableFactory, border, -3, backgroundBasicColor, foregroundBasicColor) end
            else
                local commonStrings = CommonStrings.getInstance()
                local logUtil = LogUtil.getInstance()
                logUtil:putF(commonStrings.EXCEPTION, logUtil, commonStrings.EXCEPTION)
                do return "__jreturn", PaintableForm.getNullPaintableForm() end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            local logUtil = LogUtil.getInstance()
            logUtil:put(commonStrings.EXCEPTION, logUtil, commonStrings.EXCEPTION, e)
            return PaintableForm.getNullPaintableForm()
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function ScrollSelectionForm.getNullScrollSelectionForm()
        if rawequal(ScrollSelectionForm.NULL_SCROLL_SELECTION_FORM, NullUtil.getInstance().NULL_OBJECT) then
            ScrollSelectionForm.NULL_SCROLL_SELECTION_FORM = ScrollSelectionForm.createForm(StringUtil.getInstance().EMPTY_STRING, java_new_array(nil, 0), ItemPaintableFactory.getInstance(), 0, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE)
        end
        return ScrollSelectionForm.NULL_SCROLL_SELECTION_FORM
end


function ScrollSelectionForm.getNullScrollSelectionFormHorizontal()
        if rawequal(ScrollSelectionForm.NULL_SCROLL_SELECTION_HORIZONTAL_FORM, NullUtil.getInstance().NULL_OBJECT) then
            ScrollSelectionForm.NULL_SCROLL_SELECTION_HORIZONTAL_FORM = ScrollSelectionForm.createForm(StringUtil.getInstance().EMPTY_STRING, java_new_array(nil, 0), ItemPaintableFactory.getInstance(), 0, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE)
        end
        return ScrollSelectionForm.NULL_SCROLL_SELECTION_HORIZONTAL_FORM
end


function ScrollSelectionForm._jinit(self, title, items, formPaintableFactory, border, adjustedExtraBorder, backgroundBasicColor, foregroundBasicColor)
    java_super_init(PaintableForm, self, title, items, backgroundBasicColor, foregroundBasicColor)
    ScrollSelectionForm._init_fields(self)
        -- super(...) made self above
        self.adjustedExtraBorder = adjustedExtraBorder
        self.buttonBasicColor = foregroundBasicColor
        self.border = border
        self.halfBorder = (((border) // (1 << (1))))
        self.paintable = formPaintableFactory:getInstanceItemPaintable(self)
    return self
end

function ScrollSelectionForm.new(...)
    local self = setmetatable({}, ScrollSelectionForm)
    ScrollSelectionForm._jinit(self, ...)
    return self
end


-- throws Exception
function ScrollSelectionForm:init(rectangle, formType)
        java_super(PaintableForm, "init", 2)(self, rectangle, formType)
        local formTypeFactory = FormTypeFactory.getInstance()
        if rawequal(formType, formTypeFactory.HORIZONTAL_FORM) then
            self.scrollSelectionFormFormTypeItemIndexPaintable = ScrollSelectionFormHorizontalPaintable.new(self)
            self.formTypeItemIndexDx = ScrollSelectionFormHorizontalDx.new(self)
        elseif rawequal(formType, formTypeFactory.VERTICAL_CENTER_FORM) then
            self.scrollSelectionFormFormTypeItemIndexPaintable = ScrollSelectionFormVerticalPaintable.new(self)
            self.formTypeItemIndexDx = ScrollSelectionFormVericalDx.new(self)
        elseif rawequal(formType, formTypeFactory.TEMP_HORIZONTAL_FORM) then
            self.scrollSelectionFormFormTypeItemIndexPaintable = ScrollSelectionFormTempHorizontalPaintable.new(self)
            self.formTypeItemIndexDx = ScrollSelectionFormTempHorizontalDx.new(self)
        elseif rawequal(formType, formTypeFactory.NULL_FORM_TYPE) then
        else
            error(require("java.lang.Exception").new(formTypeFactory.UNK), 0)
        end
end
java_overload(ScrollSelectionForm, "init", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "Rectangle")) and (java_a2 == nil or java_is(java_a2, "FormType")) end)


function ScrollSelectionForm:paintItemHorizontal(graphics, index, item, x, y)
        local width = item:getMinimumWidth()
        return x + width + self.border
end
java_overload(ScrollSelectionForm, "paintItemHorizontal", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and (java_a3 == nil or java_is(java_a3, "ABCustomItem")) and type(java_a4) == "number" and type(java_a5) == "number" end)


function ScrollSelectionForm:paintItemVertical(graphics, index, item, x, y)
        local height = item:getMinimumHeight()
        return y + height + self.border
end
java_overload(ScrollSelectionForm, "paintItemVertical", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and (java_a3 == nil or java_is(java_a3, "ABCustomItem")) and type(java_a4) == "number" and type(java_a5) == "number" end)


function ScrollSelectionForm:paintItemTempHorizontal(graphics, index, item, x, y)
        return 0
end
java_overload(ScrollSelectionForm, "paintItemTempHorizontal", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and (java_a3 == nil or java_is(java_a3, "ABCustomItem")) and type(java_a4) == "number" and type(java_a5) == "number" end)


function ScrollSelectionForm:getSelectedIndexForPointHorizontalDx(index, item, dx, dy)
        return dx - self.halfBorder
end
java_overload(ScrollSelectionForm, "getSelectedIndexForPointHorizontalDx", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "ABCustomItem")) and type(java_a3) == "number" and type(java_a4) == "number" end)


function ScrollSelectionForm:getSelectedIndexForPointVerticalDx(index, item, dx, dy)
        return dx + self:getDiffX(item)
end
java_overload(ScrollSelectionForm, "getSelectedIndexForPointVerticalDx", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "ABCustomItem")) and type(java_a3) == "number" and type(java_a4) == "number" end)


function ScrollSelectionForm:getSelectedIndexForPointTempHorizontalDx(index, item, dx, dy)
        return dx + self:getDiffX(item)
end
java_overload(ScrollSelectionForm, "getSelectedIndexForPointTempHorizontalDx", 4, function(java_a1, java_a2, java_a3, java_a4) return true and type(java_a1) == "number" and (java_a2 == nil or java_is(java_a2, "ABCustomItem")) and type(java_a3) == "number" and type(java_a4) == "number" end)


function ScrollSelectionForm:append(item)
        return java_super(PaintableForm, "append", 1)(self, item)
end
java_overload(ScrollSelectionForm, "append", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ABCustomItem")) end)


-- throws Exception
function ScrollSelectionForm:getSelectedItem(point)
        local index = self:getSelectedIndexForPoint(point)
        if not rawequal(index, -1) then
            return self:get(index)
        else
            return ABCustomItem.getNullInstance()
        end
end
java_overload(ScrollSelectionForm, "getSelectedItem", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GPoint")) end)


-- throws Exception
function ScrollSelectionForm:getItemIndex(item)
        local nextItem = nil
        local size = self:size()
        for index = 0, size - 1 do
            nextItem = self:get(index)
            if rawequal(nextItem, item) then
                return index
            end
        end
        return -1
end
java_overload(ScrollSelectionForm, "getItemIndex", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ABCustomItem")) end)


function ScrollSelectionForm:getStartIndex()
        return 0
end
java_overload(ScrollSelectionForm, "getStartIndex", 0)


-- throws Exception
function ScrollSelectionForm:getSelectedIndexForPoint(point)
        local start = self:getStartIndex()
        local size = self:size()
        local dx = self:getDx()
        local dy = self:getDy()
        local formTypeFactory = FormTypeFactory.getInstance()
        local commonLabels = CommonLabels.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(commonLabels.START_LABEL)
        stringBuffer:appendint(start)
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(commonLabels.TOTAL_LABEL)
        stringBuffer:appendint(size)
        self.logUtil:putF(tostring(stringBuffer), self, ScrollSelectionForm.GET_SELECTED_INDEX)
        local item = nil
        local width = 0
        local height = 0
        local diffX = 0
        for index = start, size - 1 do
            item = self:get(index)
            width = item:getMinimumWidth()
            height = item:getMinimumHeight()
            diffX = self.formTypeItemIndexDx:getDx(index, item, dx, dy)
            if self.rectangleCollisionUtil:isInside(diffX, dy - self.halfBorder, diffX + width + self.border, dy + height + self.halfBorder + 1, point:getX(), point:getY()) then
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(commonLabels.ITEM_LABEL)
                stringBuffer:append(item:getLabel())
                stringBuffer:append(CommonSeps.getInstance().SPACE)
                stringBuffer:append(commonLabels.INDEX_LABEL)
                stringBuffer:appendint(index)
                self.logUtil:putF(tostring(stringBuffer), self, ScrollSelectionForm.GET_SELECTED_INDEX)
                return index
            end
            if rawequal(self.formType, formTypeFactory.HORIZONTAL_FORM) then
                dx = dx + width + self.border
                if dx > self.rectangle:getMaxX() then
                    break
                end
            elseif rawequal(self.formType, formTypeFactory.VERTICAL_CENTER_FORM) then
                dy = dy + height + self.border
                if dy > self.rectangle:getMaxY() then
                    break
                end
            elseif rawequal(self.formType, formTypeFactory.NULL_FORM_TYPE) then
            else
                error(require("java.lang.Exception").new(formTypeFactory.UNK), 0)
            end
        end
        return -1
end
java_overload(ScrollSelectionForm, "getSelectedIndexForPoint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GPoint")) end)


-- throws Exception
function ScrollSelectionForm:processInputKey(gameKeyCode)
        local formTypeFactory = FormTypeFactory.getInstance()
        if rawequal(self:size(), 0) then
            return -1
        end
        local index = self:getSelectedIndex()
        if rawequal(self.formType, formTypeFactory.HORIZONTAL_FORM) or rawequal(self.formType, formTypeFactory.TEMP_HORIZONTAL_FORM) then
            if rawequal(gameKeyCode, Canvas.RIGHT) then
                index = index + 1
            elseif rawequal(gameKeyCode, Canvas.LEFT) then
                index = index - 1
            end
        elseif rawequal(self.formType, formTypeFactory.VERTICAL_CENTER_FORM) then
            if rawequal(gameKeyCode, Canvas.DOWN) then
                index = index + 1
            elseif rawequal(gameKeyCode, Canvas.UP) then
                index = index - 1
            end
        elseif rawequal(self.formType, formTypeFactory.NULL_FORM_TYPE) then
        else
            error(require("java.lang.Exception").new(formTypeFactory.UNK), 0)
        end
        local max = self:size() - 1
        if index < 0 then
            self:setSelectedIndex(0)
        elseif index > max then
            self:setSelectedIndex(max)
        else
            self:setSelectedIndex(index)
        end
        return -1
end
java_overload(ScrollSelectionForm, "processInputKey", 1, function(java_a1) return true and type(java_a1) == "number" end)


function ScrollSelectionForm:isInForm(point)
        if self.rectangleCollisionUtil:isInside(self.x, self.y - self.halfBorder, self.rectangle:getMaxX() + self.border, self.rectangle:getMaxY() + self.border, point:getX(), point:getY()) then
            self.logUtil:putF(tostring(StringMaker.new():append(StringUtil.getInstance():toString(point)):append(ScrollSelectionForm.INSIDE_FORM)), self, ScrollSelectionForm.IS_IN_FORM)
            return true
        end
        return false
end
java_overload(ScrollSelectionForm, "isInForm", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GPoint")) end)


-- throws Exception
function ScrollSelectionForm:paintItem(graphics, index, item, x, y)
        item:paintXY(graphics, x, y)
        local width = item:getMinimumWidth()
        local height = item:getMinimumHeight()
        graphics:setColor(math.tointeger(self:getButtonBasicColor() // 1))
        local adjustedBorder = 3
        graphics:drawRect(x - self.halfBorder - adjustedBorder, y - self.halfBorder - adjustedBorder, width + self.border + self.adjustedExtraBorder, height + self.border + self.adjustedExtraBorder)
        return self.scrollSelectionFormFormTypeItemIndexPaintable:paint(graphics, index, item, x, y)
end
java_overload(ScrollSelectionForm, "paintItem", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and (java_a3 == nil or java_is(java_a3, "ABCustomItem")) and type(java_a4) == "number" and type(java_a5) == "number" end)


-- throws Exception
function ScrollSelectionForm:paintUnselectedItem(graphics, index, item, x, y)
        graphics:setColor(math.tointeger(self:getButtonBasicColor() // 1))
        item:paintUnselected(graphics, x, y)
        return self.scrollSelectionFormFormTypeItemIndexPaintable:paint(graphics, index, item, x, y)
end
java_overload(ScrollSelectionForm, "paintUnselectedItem", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and (java_a3 == nil or java_is(java_a3, "ABCustomItem")) and type(java_a4) == "number" and type(java_a5) == "number" end)


function ScrollSelectionForm:getDiffX(item)
        return 0
end
java_overload(ScrollSelectionForm, "getDiffX", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "ABCustomItem")) end)


function ScrollSelectionForm:getDx()
        return self.x
end
java_overload(ScrollSelectionForm, "getDx", 0)


function ScrollSelectionForm:getDy()
        return self.y
end
java_overload(ScrollSelectionForm, "getDy", 0)


function ScrollSelectionForm:setButtonBasicColor(buttonBasicColor)
        self.buttonBasicColor = buttonBasicColor
end
java_overload(ScrollSelectionForm, "setButtonBasicColor", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "BasicColor")) end)


function ScrollSelectionForm:getButtonBasicColor()
        return self.buttonBasicColor
end
java_overload(ScrollSelectionForm, "getButtonBasicColor", 0)

ScrollSelectionForm.NULL_SCROLL_SELECTION_FORM = NullUtil.getInstance().NULL_OBJECT
ScrollSelectionForm.NULL_SCROLL_SELECTION_HORIZONTAL_FORM = NullUtil.getInstance().NULL_OBJECT
ScrollSelectionForm.INSIDE_FORM = " inside form"
ScrollSelectionForm.IS_IN_FORM = "isInForm"
ScrollSelectionForm.GET_SELECTED_INDEX = "getSelectedIndexForPoint"

return ScrollSelectionForm

