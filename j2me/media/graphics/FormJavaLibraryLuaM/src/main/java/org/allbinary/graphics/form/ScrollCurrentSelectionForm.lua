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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Processor = require("org.allbinary.canvas.Processor")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ScrollCurrentSelectionForm = {}
ScrollCurrentSelectionForm.__index = ScrollCurrentSelectionForm
ScrollCurrentSelectionForm.className = "ScrollCurrentSelectionForm"
setmetatable(ScrollCurrentSelectionForm, {__index = ScrollSelectionForm})
local TempHorizontalFormProcessor = {}
    TempHorizontalFormProcessor.__index = TempHorizontalFormProcessor
    TempHorizontalFormProcessor.className = "TempHorizontalFormProcessor"
    setmetatable(TempHorizontalFormProcessor, {__index = Processor})
    ScrollCurrentSelectionForm.TempHorizontalFormProcessor = TempHorizontalFormProcessor

    function TempHorizontalFormProcessor:_init_fields()
        self.scrollCurrentSelectionForm = nil
    end
    

    function ScrollCurrentSelectionForm.new(scrollCurrentSelectionForm)
        local self = setmetatable(Processor.new(), ScrollCurrentSelectionForm)
        self:_init_fields()
            self.scrollCurrentSelectionForm = scrollCurrentSelectionForm
        return self
    end
    

    -- throws Exception
    function ScrollCurrentSelectionForm:process()
            self.scrollCurrentSelectionForm:processTempHorizontalForm()
            self.scrollCurrentSelectionForm.processor = Processor.getInstance()
    end

local HorizontalFormProcessor = {}
    HorizontalFormProcessor.__index = HorizontalFormProcessor
    HorizontalFormProcessor.className = "HorizontalFormProcessor"
    setmetatable(HorizontalFormProcessor, {__index = Processor})
    ScrollCurrentSelectionForm.HorizontalFormProcessor = HorizontalFormProcessor

    function HorizontalFormProcessor:_init_fields()
        self.scrollCurrentSelectionForm = nil
    end
    

    function ScrollCurrentSelectionForm.new(scrollCurrentSelectionForm)
        local self = setmetatable(Processor.new(), ScrollCurrentSelectionForm)
        self:_init_fields()
            self.scrollCurrentSelectionForm = scrollCurrentSelectionForm
        return self
    end
    

    -- throws Exception
    function ScrollCurrentSelectionForm:process()
            self.scrollCurrentSelectionForm:processHorizontalForm()
            self.scrollCurrentSelectionForm.processor = Processor.getInstance()
    end

local VerticalFormProcessor = {}
    VerticalFormProcessor.__index = VerticalFormProcessor
    VerticalFormProcessor.className = "VerticalFormProcessor"
    setmetatable(VerticalFormProcessor, {__index = Processor})
    ScrollCurrentSelectionForm.VerticalFormProcessor = VerticalFormProcessor

    function VerticalFormProcessor:_init_fields()
        self.scrollCurrentSelectionForm = nil
    end
    

    function ScrollCurrentSelectionForm.new(scrollCurrentSelectionForm)
        local self = setmetatable(Processor.new(), ScrollCurrentSelectionForm)
        self:_init_fields()
            self.scrollCurrentSelectionForm = scrollCurrentSelectionForm
        return self
    end
    

    -- throws Exception
    function ScrollCurrentSelectionForm:process()
            self.scrollCurrentSelectionForm:processVerticalForm()
            self.scrollCurrentSelectionForm.processor = Processor.getInstance()
    end

local TempHorizontalItemIndexDx = {}
    TempHorizontalItemIndexDx.__index = TempHorizontalItemIndexDx
    TempHorizontalItemIndexDx.className = "TempHorizontalItemIndexDx"
    setmetatable(TempHorizontalItemIndexDx, {__index = ItemIndexDx})
    ScrollCurrentSelectionForm.TempHorizontalItemIndexDx = TempHorizontalItemIndexDx

    function TempHorizontalItemIndexDx:_init_fields()
        self.scrollCurrentSelectionForm = nil
    end
    

    function ScrollCurrentSelectionForm.new(scrollCurrentSelectionForm)
        local self = setmetatable(ItemIndexDx.new(), ScrollCurrentSelectionForm)
        self:_init_fields()
            self.scrollCurrentSelectionForm = scrollCurrentSelectionForm
        return self
    end
    

    -- throws Exception
    function ScrollCurrentSelectionForm:getDx(index, item, dx, dy)
            return self.scrollCurrentSelectionForm:getXTempHorizontalForm(index, item, dx, dy)
    end

local HorizontalItemIndexDx = {}
    HorizontalItemIndexDx.__index = HorizontalItemIndexDx
    HorizontalItemIndexDx.className = "HorizontalItemIndexDx"
    setmetatable(HorizontalItemIndexDx, {__index = ItemIndexDx})
    ScrollCurrentSelectionForm.HorizontalItemIndexDx = HorizontalItemIndexDx

    function HorizontalItemIndexDx:_init_fields()
        self.scrollCurrentSelectionForm = nil
    end
    

    function ScrollCurrentSelectionForm.new(scrollCurrentSelectionForm)
        local self = setmetatable(ItemIndexDx.new(), ScrollCurrentSelectionForm)
        self:_init_fields()
            self.scrollCurrentSelectionForm = scrollCurrentSelectionForm
        return self
    end
    

    -- throws Exception
    function ScrollCurrentSelectionForm:getDx(index, item, dx, dy)
            return self.scrollCurrentSelectionForm:getXHorizontalForm(index, item, dx, dy)
    end

local VerticalItemIndexDx = {}
    VerticalItemIndexDx.__index = VerticalItemIndexDx
    VerticalItemIndexDx.className = "VerticalItemIndexDx"
    setmetatable(VerticalItemIndexDx, {__index = ItemIndexDx})
    ScrollCurrentSelectionForm.VerticalItemIndexDx = VerticalItemIndexDx

    function VerticalItemIndexDx:_init_fields()
        self.scrollCurrentSelectionForm = nil
    end
    

    function ScrollCurrentSelectionForm.new(scrollCurrentSelectionForm)
        local self = setmetatable(ItemIndexDx.new(), ScrollCurrentSelectionForm)
        self:_init_fields()
            self.scrollCurrentSelectionForm = scrollCurrentSelectionForm
        return self
    end
    

    -- throws Exception
    function ScrollCurrentSelectionForm:getDx(index, item, dx, dy)
            return self.scrollCurrentSelectionForm:getXVerticalForm(index, item, dx, dy)
    end


function ScrollCurrentSelectionForm:_init_fields()
    self.moveForSmallScreen = nil
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    self.processor = Processor.getInstance()
    self.preItemIndexDx = ItemIndexDx.getInstance()
    self.dx = 0
    self.dy = 0
    self.maxWidth = 0
end


function ScrollCurrentSelectionForm.new(title, items, formPaintableFactory, border, adjustedExtraBorder, moveForSmallScreen, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(ScrollSelectionForm.new(title, items, formPaintableFactory, border, adjustedExtraBorder, backgroundBasicColor, foregroundBasicColor), ScrollCurrentSelectionForm)
    self:_init_fields()
        -- super(...) made self above
        self.moveForSmallScreen = moveForSmallScreen
    return self
end


-- throws Exception
function ScrollCurrentSelectionForm:init(rectangle, formType)
        ScrollSelectionForm.init(self, rectangle, formType)
        local formTypeFactory = FormTypeFactory.getInstance()
        if formType == formTypeFactory.TEMP_HORIZONTAL_FORM then
            self.processor = TempHorizontalFormProcessor.new(self)
            self.preItemIndexDx = TempHorizontalItemIndexDx.new(self)
        elseif formType == formTypeFactory.HORIZONTAL_FORM then
            self.processor = HorizontalFormProcessor.new(self)
            self.preItemIndexDx = HorizontalItemIndexDx.new(self)
        elseif formType == formTypeFactory.VERTICAL_CENTER_FORM then
            self.processor = VerticalFormProcessor.new(self)
            self.preItemIndexDx = VerticalItemIndexDx.new(self)
        elseif formType == formTypeFactory.NULL_FORM_TYPE then
        else
            self.logUtil:putF(formTypeFactory.UNK, self, self.commonStrings.INIT)
        end
        self.myFontProcessor = self.updateMyFontProcessor
end


function ScrollCurrentSelectionForm:updateMeasurement(graphics)
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function ScrollCurrentSelectionForm:processTempHorizontalForm()
        self.dx = self.x - 30 + (((self.rectangle:getWidth()) // (1 << (1))))
        self.dy = self.y
end


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


function ScrollCurrentSelectionForm:getXTempHorizontalForm(index, item, dx, dy)
        return self:getDiffX(item)
end


function ScrollCurrentSelectionForm:getXHorizontalForm(index, item, dx, dy)
        return 0
end


function ScrollCurrentSelectionForm:getXVerticalForm(index, item, dx, dy)
        return self:getDiffX(item) + self.halfBorder
end


function ScrollCurrentSelectionForm:getDiffX(item)
        return ((((self.maxWidth - item:getMinimumWidth())) // (1 << (1))))
end


function ScrollCurrentSelectionForm:getDx()
        return self.dx
end


function ScrollCurrentSelectionForm:getDy()
        return self.dy
end


function ScrollCurrentSelectionForm:paint(graphics)
        local try_ok, try_error = pcall(function()
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
                if index == self:getSelectedIndex() then
                    delta = self:paintItem(graphics, index, item, deltaX + diffX, deltaY)
                    self.paintable:paint(graphics, index, deltaX + diffX, deltaY)
                else
                    delta = self:paintUnselectedItem(graphics, index, item, deltaX + diffX, deltaY)
                    self.paintable:paint(graphics, index, deltaX + diffX, deltaY)
                end
                if self.formType == formTypeFactory.TEMP_HORIZONTAL_FORM then
                elseif self.formType == formTypeFactory.HORIZONTAL_FORM then
                    deltaX = delta
                elseif self.formType == formTypeFactory.VERTICAL_CENTER_FORM then
                    deltaY = delta
                else
                    error(java_exception("Exception", formTypeFactory.UNK), 0)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.canvasStrings.PAINT, e)
        end
end

return ScrollCurrentSelectionForm

