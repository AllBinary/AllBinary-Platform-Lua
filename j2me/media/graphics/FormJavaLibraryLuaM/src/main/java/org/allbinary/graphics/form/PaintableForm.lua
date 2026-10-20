-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form

local GPoint = require("org.allbinary.graphics.GPoint")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local RectangleFactory = require("org.allbinary.graphics.RectangleFactory")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local NullUtil = require("org.allbinary.logic.NullUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local ABCustomForm = require("org.allbinary.graphics.form.ABCustomForm")

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

local PaintableForm = {}
PaintableForm.__index = PaintableForm
PaintableForm.className = "PaintableForm"
setmetatable(PaintableForm, {__index = ABCustomForm})

function PaintableForm:_init_fields()
    self.canvasStrings = CanvasStrings.getInstance()
    self.rectangle = RectangleFactory.SINGLETON
    self.x = 0
    self.y = 0
    self.formType = FormTypeFactory.getInstance().NULL_FORM_TYPE
end


function PaintableForm.getNullPaintableForm()
        if PaintableForm.NULL_PAINTABLE_FORM == NullUtil.getInstance().NULL_OBJECT then
            PaintableForm.NULL_PAINTABLE_FORM = PaintableForm.new(StringUtil.getInstance().EMPTY_STRING, java_new_array(nil, 0), BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE)
        end
        return PaintableForm.NULL_PAINTABLE_FORM
end


function PaintableForm.new(title, items, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(ABCustomForm.new(title, items, backgroundBasicColor, foregroundBasicColor), PaintableForm)
    self:_init_fields()
        -- super(...) made self above
        self:setSelectedIndex(0)
    return self
end


-- throws Exception
function PaintableForm:init(rectangle, formType)
        self.rectangle = rectangle
        local point = self.rectangle:getPoint()
        self.x = point:getX()
        self.y = point:getY()
        self.formType = formType
end


function PaintableForm:getWidth()
        return self.rectangle:getWidth()
end

PaintableForm.NULL_PAINTABLE_FORM = NullUtil.getInstance().NULL_OBJECT

return PaintableForm

