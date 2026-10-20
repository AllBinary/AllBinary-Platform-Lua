-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local J2MEUtil = require("org.allbinary.J2MEUtil")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
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

local MultipleScrollSelectionHorizontalForm = {}
MultipleScrollSelectionHorizontalForm.__index = MultipleScrollSelectionHorizontalForm
MultipleScrollSelectionHorizontalForm.className = "MultipleScrollSelectionHorizontalForm"
setmetatable(MultipleScrollSelectionHorizontalForm, {__index = ScrollSelectionForm})
local MultipleScrollSelectionFormHorizontalPaintable = {}
    MultipleScrollSelectionFormHorizontalPaintable.__index = MultipleScrollSelectionFormHorizontalPaintable
    MultipleScrollSelectionFormHorizontalPaintable.className = "MultipleScrollSelectionFormHorizontalPaintable"
    setmetatable(MultipleScrollSelectionFormHorizontalPaintable, {__index = ItemIndexPaintable})
    MultipleScrollSelectionHorizontalForm.MultipleScrollSelectionFormHorizontalPaintable = MultipleScrollSelectionFormHorizontalPaintable

    function MultipleScrollSelectionFormHorizontalPaintable:_init_fields()
        self.multipleScrollSelectionForm = nil
    end
    

    function MultipleScrollSelectionHorizontalForm.new(multipleScrollSelectionForm)
        local self = setmetatable(ItemIndexPaintable.new(), MultipleScrollSelectionHorizontalForm)
        self:_init_fields()
            self.multipleScrollSelectionForm = multipleScrollSelectionForm
        return self
    end
    

    -- throws Exception
    function MultipleScrollSelectionHorizontalForm:paint(graphics, index, item, dx, dy)
            return self.multipleScrollSelectionForm:paintHorizontal(graphics, index, item, dx, dy)
    end

local MultipleScrollSelectionFormVerticalPaintable = {}
    MultipleScrollSelectionFormVerticalPaintable.__index = MultipleScrollSelectionFormVerticalPaintable
    MultipleScrollSelectionFormVerticalPaintable.className = "MultipleScrollSelectionFormVerticalPaintable"
    setmetatable(MultipleScrollSelectionFormVerticalPaintable, {__index = ItemIndexPaintable})
    MultipleScrollSelectionHorizontalForm.MultipleScrollSelectionFormVerticalPaintable = MultipleScrollSelectionFormVerticalPaintable

    function MultipleScrollSelectionFormVerticalPaintable:_init_fields()
        self.multipleScrollSelectionForm = nil
    end
    

    function MultipleScrollSelectionHorizontalForm.new(multipleScrollSelectionForm)
        local self = setmetatable(ItemIndexPaintable.new(), MultipleScrollSelectionHorizontalForm)
        self:_init_fields()
            self.multipleScrollSelectionForm = multipleScrollSelectionForm
        return self
    end
    

    -- throws Exception
    function MultipleScrollSelectionHorizontalForm:paint(graphics, index, item, dx, dy)
            return self.multipleScrollSelectionForm:paintVertical(graphics, index, item, dx, dy)
    end


function MultipleScrollSelectionHorizontalForm:_init_fields()
    self.rectPaintable = NullPaintable.getInstance()
    self.multipleScrollSelectionHorizontalFormTypeItemIndexPaintable = ItemIndexPaintable.getInstance()
    self.backgroundColor = math.tointeger(BasicColorFactory.getInstance().TRANSPARENT_GREY // 1)
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.logged = false
    self.fontHeight = 0
end


-- throws Exception
function MultipleScrollSelectionHorizontalForm.createForm(title, items, rectangle, formType, border, backgroundBasicColor, foregroundBasicColor)
        local scrollSelectionForm = MultipleScrollSelectionHorizontalForm.new(title, items, ItemPaintableFactory.getInstance(), border, backgroundBasicColor, foregroundBasicColor)
        scrollSelectionForm:init(rectangle, formType)
        return scrollSelectionForm
end


function MultipleScrollSelectionHorizontalForm.new(title, items, formPaintableFactory, border, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(ScrollSelectionForm.new(title, items, formPaintableFactory, border, 3, backgroundBasicColor, foregroundBasicColor), MultipleScrollSelectionHorizontalForm)
    self:_init_fields()
        -- super(...) made self above
        if J2MEUtil.isJ2ME() or J2MEUtil.isHTML() then
        else
            local MPaintable = {}
            MPaintable.__index = MPaintable
            MPaintable.className = "MPaintable"
            setmetatable(MPaintable, {__index = Paintable})

            function MPaintable.new()
                local self = setmetatable(Paintable.new(), MPaintable)
                return self
            end
            

            function MultipleScrollSelectionHorizontalForm:paint(graphics)
                    self:fillRect(graphics)
            end

            self.rectPaintable = MPaintable.new()
        end
    return self
end


function MultipleScrollSelectionHorizontalForm:fillRect(graphics)
        graphics:setColor(self.backgroundColor)
        graphics:fillRect(self.x, self.y, self.rectangle:getWidth(), self.rectangle:getHeight())
end


-- throws Exception
function MultipleScrollSelectionHorizontalForm:init(rectangle, formType)
        ScrollSelectionForm.init(self, rectangle, formType)
        local formTypeFactory = FormTypeFactory.getInstance()
        if formType == formTypeFactory.HORIZONTAL_FORM then
            self.multipleScrollSelectionHorizontalFormTypeItemIndexPaintable = MultipleScrollSelectionFormHorizontalPaintable.new(self)
        elseif formType == formTypeFactory.VERTICAL_CENTER_FORM then
            self.multipleScrollSelectionHorizontalFormTypeItemIndexPaintable = MultipleScrollSelectionFormVerticalPaintable.new(self)
        elseif formType == formTypeFactory.NULL_FORM_TYPE then
        else
            error(java_exception("Exception", formTypeFactory.UNK), 0)
        end
end


function MultipleScrollSelectionHorizontalForm:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.fontHeight = font:getHeight()
        self.myFontProcessor = MyFontProcessor.getInstance()
end


-- throws Exception
function MultipleScrollSelectionHorizontalForm:paintHorizontal(graphics, index, item, dx, dy)
        local dx2 = self:paintItem(graphics, index, item, dx, dy) + self.border
        self.paintable:paint(graphics, index, dx, dy)
        dx = dx2
        return dx
end


-- throws Exception
function MultipleScrollSelectionHorizontalForm:paintVertical(graphics, index, item, dx, dy)
        self:paintItem(graphics, index, item, dx, dy)
        self.paintable:paint(graphics, index, dx, dy)
        return dx
end


function MultipleScrollSelectionHorizontalForm:getStartIndex()
        return self:getSelectedIndex()
end


function MultipleScrollSelectionHorizontalForm:paint(graphics)
        local try_ok, try_error = pcall(function()
            self.myFontProcessor:process(graphics)
            local start = self:getStartIndex()
            local size = self:size()
            local dx = self.x
            local dy = self.y
            self.rectPaintable:paint(graphics)
            graphics:drawString(self:getTitle(), self.x, self.y - self.fontHeight, 0)
            local item = nil
            for index = start, size - 1 do
                item = self:get(index)
                if dx >= self.rectangle:getMaxX() then
                    if self.logged then
                    else
                        self.logged = true
                        PreLogUtil.put(tostring(StringMaker.new():append("painting beyond maxx: "):appendint(java_int(self.rectangle:getMaxX()))), self, self.canvasStrings.PAINT)
                    end
                end
                dx = self.multipleScrollSelectionHorizontalFormTypeItemIndexPaintable:paint(graphics, index, item, dx, dy)
            end
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.put(self.commonStrings.EXCEPTION, self, self.canvasStrings.PAINT)
        end
end

return MultipleScrollSelectionHorizontalForm

