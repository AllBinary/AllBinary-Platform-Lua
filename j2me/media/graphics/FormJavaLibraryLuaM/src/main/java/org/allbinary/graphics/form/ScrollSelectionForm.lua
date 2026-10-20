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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local GPoint = require("org.allbinary.graphics.GPoint")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local RectangleCollisionUtil = require("org.allbinary.math.RectangleCollisionUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local PaintableForm = require("org.allbinary.graphics.form.PaintableForm")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ScrollSelectionForm = {}
ScrollSelectionForm.__index = ScrollSelectionForm
ScrollSelectionForm.className = "ScrollSelectionForm"
setmetatable(ScrollSelectionForm, {__index = PaintableForm})
local ScrollSelectionFormHorizontalPaintable = {}
    ScrollSelectionFormHorizontalPaintable.__index = ScrollSelectionFormHorizontalPaintable
    ScrollSelectionFormHorizontalPaintable.className = "ScrollSelectionFormHorizontalPaintable"
    setmetatable(ScrollSelectionFormHorizontalPaintable, {__index = ItemIndexPaintable})
    ScrollSelectionForm.ScrollSelectionFormHorizontalPaintable = ScrollSelectionFormHorizontalPaintable

    function ScrollSelectionFormHorizontalPaintable:_init_fields()
        self.scrollSelectionForm = nil
    end
    

    function ScrollSelectionForm.new(scrollSelectionForm)
        local self = setmetatable(ItemIndexPaintable.new(), ScrollSelectionForm)
        self:_init_fields()
            self.scrollSelectionForm = scrollSelectionForm
        return self
    end
    

    -- throws Exception
    function ScrollSelectionForm:paint(graphics, index, item, dx, dy)
            return self.scrollSelectionForm:paintItemHorizontal(graphics, index, item, dx, dy)
    end

local ScrollSelectionFormVerticalPaintable = {}
    ScrollSelectionFormVerticalPaintable.__index = ScrollSelectionFormVerticalPaintable
    ScrollSelectionFormVerticalPaintable.className = "ScrollSelectionFormVerticalPaintable"
    setmetatable(ScrollSelectionFormVerticalPaintable, {__index = ItemIndexPaintable})
    ScrollSelectionForm.ScrollSelectionFormVerticalPaintable = ScrollSelectionFormVerticalPaintable

    function ScrollSelectionFormVerticalPaintable:_init_fields()
        self.scrollSelectionForm = nil
    end
    

    function ScrollSelectionForm.new(scrollSelectionForm)
        local self = setmetatable(ItemIndexPaintable.new(), ScrollSelectionForm)
        self:_init_fields()
            self.scrollSelectionForm = scrollSelectionForm
        return self
    end
    

    -- throws Exception
    function ScrollSelectionForm:paint(graphics, index, item, dx, dy)
            return self.scrollSelectionForm:paintItemVertical(graphics, index, item, dx, dy)
    end

local ScrollSelectionFormTempHorizontalPaintable = {}
    ScrollSelectionFormTempHorizontalPaintable.__index = ScrollSelectionFormTempHorizontalPaintable
    ScrollSelectionFormTempHorizontalPaintable.className = "ScrollSelectionFormTempHorizontalPaintable"
    setmetatable(ScrollSelectionFormTempHorizontalPaintable, {__index = ItemIndexPaintable})
    ScrollSelectionForm.ScrollSelectionFormTempHorizontalPaintable = ScrollSelectionFormTempHorizontalPaintable

    function ScrollSelectionFormTempHorizontalPaintable:_init_fields()
        self.scrollSelectionForm = nil
    end
    

    function ScrollSelectionForm.new(scrollSelectionForm)
        local self = setmetatable(ItemIndexPaintable.new(), ScrollSelectionForm)
        self:_init_fields()
            self.scrollSelectionForm = scrollSelectionForm
        return self
    end
    

    -- throws Exception
    function ScrollSelectionForm:paint(graphics, index, item, dx, dy)
            return self.scrollSelectionForm:paintItemTempHorizontal(graphics, index, item, dx, dy)
    end

local ScrollSelectionFormHorizontalDx = {}
    ScrollSelectionFormHorizontalDx.__index = ScrollSelectionFormHorizontalDx
    ScrollSelectionFormHorizontalDx.className = "ScrollSelectionFormHorizontalDx"
    setmetatable(ScrollSelectionFormHorizontalDx, {__index = ItemIndexDx})
    ScrollSelectionForm.ScrollSelectionFormHorizontalDx = ScrollSelectionFormHorizontalDx

    function ScrollSelectionFormHorizontalDx:_init_fields()
        self.scrollSelectionForm = nil
    end
    

    function ScrollSelectionForm.new(multipleScrollSelectionForm)
        local self = setmetatable(ItemIndexDx.new(), ScrollSelectionForm)
        self:_init_fields()
            self.scrollSelectionForm = multipleScrollSelectionForm
        return self
    end
    

    -- throws Exception
    function ScrollSelectionForm:getDx(index, item, dx, dy)
            return self.scrollSelectionForm:getSelectedIndexForPointHorizontalDx(index, item, dx, dy)
    end

local ScrollSelectionFormVericalDx = {}
    ScrollSelectionFormVericalDx.__index = ScrollSelectionFormVericalDx
    ScrollSelectionFormVericalDx.className = "ScrollSelectionFormVericalDx"
    setmetatable(ScrollSelectionFormVericalDx, {__index = ItemIndexDx})
    ScrollSelectionForm.ScrollSelectionFormVericalDx = ScrollSelectionFormVericalDx

    function ScrollSelectionFormVericalDx:_init_fields()
        self.scrollSelectionForm = nil
    end
    

    function ScrollSelectionForm.new(multipleScrollSelectionForm)
        local self = setmetatable(ItemIndexDx.new(), ScrollSelectionForm)
        self:_init_fields()
            self.scrollSelectionForm = multipleScrollSelectionForm
        return self
    end
    

    -- throws Exception
    function ScrollSelectionForm:getDx(index, item, dx, dy)
            return self.scrollSelectionForm:getSelectedIndexForPointVerticalDx(index, item, dx, dy)
    end

local ScrollSelectionFormTempHorizontalDx = {}
    ScrollSelectionFormTempHorizontalDx.__index = ScrollSelectionFormTempHorizontalDx
    ScrollSelectionFormTempHorizontalDx.className = "ScrollSelectionFormTempHorizontalDx"
    setmetatable(ScrollSelectionFormTempHorizontalDx, {__index = ItemIndexDx})
    ScrollSelectionForm.ScrollSelectionFormTempHorizontalDx = ScrollSelectionFormTempHorizontalDx

    function ScrollSelectionFormTempHorizontalDx:_init_fields()
        self.scrollSelectionForm = nil
    end
    

    function ScrollSelectionForm.new(multipleScrollSelectionForm)
        local self = setmetatable(ItemIndexDx.new(), ScrollSelectionForm)
        self:_init_fields()
            self.scrollSelectionForm = multipleScrollSelectionForm
        return self
    end
    

    -- throws Exception
    function ScrollSelectionForm:getDx(index, item, dx, dy)
            return self.scrollSelectionForm:getSelectedIndexForPointTempHorizontalDx(index, item, dx, dy)
    end


function ScrollSelectionForm:_init_fields()
    self.rectangleCollisionUtil = RectangleCollisionUtil.getInstance()
    self.border = nil
    self.halfBorder = nil
    self.buttonBasicColor = nil
    self.scrollSelectionFormFormTypeItemIndexPaintable = ItemIndexPaintable.getInstance()
    self.formTypeItemIndexDx = ItemIndexDx.getInstance()
    self.paintable = ItemPaintableFactory.getInstance()
    self.adjustedExtraBorder = nil
end


function ScrollSelectionForm.createForm(title, items, formPaintableFactory, border, backgroundBasicColor, foregroundBasicColor)
        local try_ok, try_error = pcall(function()
            if formPaintableFactory == ItemPaintableFactory.getInstance() then
                return ScrollSelectionForm.new(title, items, formPaintableFactory, border, -3, backgroundBasicColor, foregroundBasicColor)
            else
                local commonStrings = CommonStrings.getInstance()
                local logUtil = LogUtil.getInstance()
                logUtil:putF(commonStrings.EXCEPTION, logUtil, commonStrings.EXCEPTION)
                return PaintableForm.getNullPaintableForm()
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            local logUtil = LogUtil.getInstance()
            logUtil:put(commonStrings.EXCEPTION, logUtil, commonStrings.EXCEPTION, e)
            return PaintableForm.getNullPaintableForm()
        end
end


function ScrollSelectionForm.getNullScrollSelectionForm()
        if ScrollSelectionForm.NULL_SCROLL_SELECTION_FORM == NullUtil.getInstance().NULL_OBJECT then
            ScrollSelectionForm.NULL_SCROLL_SELECTION_FORM = ScrollSelectionForm.createForm(StringUtil.getInstance().EMPTY_STRING, java_new_array(nil, 0), ItemPaintableFactory.getInstance(), 0, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE)
        end
        return ScrollSelectionForm.NULL_SCROLL_SELECTION_FORM
end


function ScrollSelectionForm.getNullScrollSelectionFormHorizontal()
        if ScrollSelectionForm.NULL_SCROLL_SELECTION_HORIZONTAL_FORM == NullUtil.getInstance().NULL_OBJECT then
            ScrollSelectionForm.NULL_SCROLL_SELECTION_HORIZONTAL_FORM = ScrollSelectionForm.createForm(StringUtil.getInstance().EMPTY_STRING, java_new_array(nil, 0), ItemPaintableFactory.getInstance(), 0, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE)
        end
        return ScrollSelectionForm.NULL_SCROLL_SELECTION_HORIZONTAL_FORM
end


function ScrollSelectionForm.new(title, items, formPaintableFactory, border, adjustedExtraBorder, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(PaintableForm.new(title, items, backgroundBasicColor, foregroundBasicColor), ScrollSelectionForm)
    self:_init_fields()
        -- super(...) made self above
        self.adjustedExtraBorder = adjustedExtraBorder
        self.buttonBasicColor = foregroundBasicColor
        self.border = border
        self.halfBorder = (((border) // (1 << (1))))
        self.paintable = formPaintableFactory:getInstanceItemPaintable(self)
    return self
end


-- throws Exception
function ScrollSelectionForm:init(rectangle, formType)
        PaintableForm.init(self, rectangle, formType)
        local formTypeFactory = FormTypeFactory.getInstance()
        if formType == formTypeFactory.HORIZONTAL_FORM then
            self.scrollSelectionFormFormTypeItemIndexPaintable = ScrollSelectionFormHorizontalPaintable.new(self)
            self.formTypeItemIndexDx = ScrollSelectionFormHorizontalDx.new(self)
        elseif formType == formTypeFactory.VERTICAL_CENTER_FORM then
            self.scrollSelectionFormFormTypeItemIndexPaintable = ScrollSelectionFormVerticalPaintable.new(self)
            self.formTypeItemIndexDx = ScrollSelectionFormVericalDx.new(self)
        elseif formType == formTypeFactory.TEMP_HORIZONTAL_FORM then
            self.scrollSelectionFormFormTypeItemIndexPaintable = ScrollSelectionFormTempHorizontalPaintable.new(self)
            self.formTypeItemIndexDx = ScrollSelectionFormTempHorizontalDx.new(self)
        elseif formType == formTypeFactory.NULL_FORM_TYPE then
        else
            error(java_exception("Exception", formTypeFactory.UNK), 0)
        end
end


function ScrollSelectionForm:paintItemHorizontal(graphics, index, item, x, y)
        local width = item:getMinimumWidth()
        return x + width + self.border
end


function ScrollSelectionForm:paintItemVertical(graphics, index, item, x, y)
        local height = item:getMinimumHeight()
        return y + height + self.border
end


function ScrollSelectionForm:paintItemTempHorizontal(graphics, index, item, x, y)
        return 0
end


function ScrollSelectionForm:getSelectedIndexForPointHorizontalDx(index, item, dx, dy)
        return dx - self.halfBorder
end


function ScrollSelectionForm:getSelectedIndexForPointVerticalDx(index, item, dx, dy)
        return dx + self:getDiffX(item)
end


function ScrollSelectionForm:getSelectedIndexForPointTempHorizontalDx(index, item, dx, dy)
        return dx + self:getDiffX(item)
end


function ScrollSelectionForm:append(item)
        return PaintableForm.append(self, item)
end


-- throws Exception
function ScrollSelectionForm:getSelectedItem(point)
        local index = self:getSelectedIndexForPoint(point)
        if index ~= -1 then
            return self:get(index)
        else
            return ABCustomItem.getNullInstance()
        end
end


-- throws Exception
function ScrollSelectionForm:getItemIndex(item)
        local nextItem = nil
        local size = self:size()
        for index = 0, size - 1 do
            nextItem = self:get(index)
            if nextItem == item then
                return index
            end
        end
        return -1
end


function ScrollSelectionForm:getStartIndex()
        return 0
end


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
            if self.formType == formTypeFactory.HORIZONTAL_FORM then
                dx = dx + width + self.border
                if dx > self.rectangle:getMaxX() then
                    break
                end
            elseif self.formType == formTypeFactory.VERTICAL_CENTER_FORM then
                dy = dy + height + self.border
                if dy > self.rectangle:getMaxY() then
                    break
                end
            elseif self.formType == formTypeFactory.NULL_FORM_TYPE then
            else
                error(java_exception("Exception", formTypeFactory.UNK), 0)
            end
        end
        return -1
end


-- throws Exception
function ScrollSelectionForm:processInputKey(gameKeyCode)
        local formTypeFactory = FormTypeFactory.getInstance()
        if self:size() == 0 then
            return -1
        end
        local index = self:getSelectedIndex()
        if self.formType == formTypeFactory.HORIZONTAL_FORM or self.formType == formTypeFactory.TEMP_HORIZONTAL_FORM then
            if gameKeyCode == Canvas.RIGHT then
                index = index + 1
            elseif gameKeyCode == Canvas.LEFT then
                index = index - 1
            end
        elseif self.formType == formTypeFactory.VERTICAL_CENTER_FORM then
            if gameKeyCode == Canvas.DOWN then
                index = index + 1
            elseif gameKeyCode == Canvas.UP then
                index = index - 1
            end
        elseif self.formType == formTypeFactory.NULL_FORM_TYPE then
        else
            error(java_exception("Exception", formTypeFactory.UNK), 0)
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


function ScrollSelectionForm:isInForm(point)
        if self.rectangleCollisionUtil:isInside(self.x, self.y - self.halfBorder, self.rectangle:getMaxX() + self.border, self.rectangle:getMaxY() + self.border, point:getX(), point:getY()) then
            self.logUtil:putF(tostring(StringMaker.new():append(StringUtil.getInstance():toString(point)):append(ScrollSelectionForm.INSIDE_FORM)), self, ScrollSelectionForm.IS_IN_FORM)
            return true
        end
        return false
end


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


-- throws Exception
function ScrollSelectionForm:paintUnselectedItem(graphics, index, item, x, y)
        graphics:setColor(math.tointeger(self:getButtonBasicColor() // 1))
        item:paintUnselected(graphics, x, y)
        return self.scrollSelectionFormFormTypeItemIndexPaintable:paint(graphics, index, item, x, y)
end


function ScrollSelectionForm:getDiffX(item)
        return 0
end


function ScrollSelectionForm:getDx()
        return self.x
end


function ScrollSelectionForm:getDy()
        return self.y
end


function ScrollSelectionForm:setButtonBasicColor(buttonBasicColor)
        self.buttonBasicColor = buttonBasicColor
end


function ScrollSelectionForm:getButtonBasicColor()
        return self.buttonBasicColor
end

ScrollSelectionForm.NULL_SCROLL_SELECTION_FORM = NullUtil.getInstance().NULL_OBJECT
ScrollSelectionForm.NULL_SCROLL_SELECTION_HORIZONTAL_FORM = NullUtil.getInstance().NULL_OBJECT
ScrollSelectionForm.INSIDE_FORM = " inside form"
ScrollSelectionForm.IS_IN_FORM = "isInForm"
ScrollSelectionForm.GET_SELECTED_INDEX = "getSelectedIndexForPoint"

return ScrollSelectionForm

