-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form

local MultipleScrollSelectionHorizontalForm = {}
package.loaded["org.allbinary.graphics.form.MultipleScrollSelectionHorizontalForm"] = MultipleScrollSelectionHorizontalForm

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
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = java_lazy("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = java_lazy("org.allbinary.graphics.font.UpdateMyFontProcessor")
local ABCustomItem = java_lazy("org.allbinary.graphics.form.item.ABCustomItem")
local NullPaintable = java_lazy("org.allbinary.graphics.paint.NullPaintable")
local Paintable = java_lazy("org.allbinary.graphics.paint.Paintable")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local ScrollSelectionForm = require("org.allbinary.graphics.form.ScrollSelectionForm")
local FormType = java_lazy("org.allbinary.graphics.form.FormType")
local FormTypeFactory = java_lazy("org.allbinary.graphics.form.FormTypeFactory")
local ItemIndexPaintable = java_lazy("org.allbinary.graphics.form.ItemIndexPaintable")
local ItemPaintableFactory = java_lazy("org.allbinary.graphics.form.ItemPaintableFactory")
local MultipleScrollSelectionFormHorizontalPaintable = java_lazy("org.allbinary.graphics.form.MultipleScrollSelectionFormHorizontalPaintable")
local MultipleScrollSelectionFormRectPaintable = java_lazy("org.allbinary.graphics.form.MultipleScrollSelectionFormRectPaintable")
local MultipleScrollSelectionFormVerticalPaintable = java_lazy("org.allbinary.graphics.form.MultipleScrollSelectionFormVerticalPaintable")

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

-- class table MultipleScrollSelectionHorizontalForm is declared before the requires
MultipleScrollSelectionHorizontalForm.__index = MultipleScrollSelectionHorizontalForm
MultipleScrollSelectionHorizontalForm.className = "MultipleScrollSelectionHorizontalForm"
MultipleScrollSelectionHorizontalForm.javaClassName = "org.allbinary.graphics.form.MultipleScrollSelectionHorizontalForm"
setmetatable(MultipleScrollSelectionHorizontalForm, {__index = ScrollSelectionForm})
MultipleScrollSelectionHorizontalForm.java_implements = " UpdateMyFontInterface "
MultipleScrollSelectionHorizontalForm.java_interfaces = function() return {UpdateMyFontInterface} end

function MultipleScrollSelectionHorizontalForm:_init_fields()
    self.rectPaintable = NullPaintable.getInstance()
    self.multipleScrollSelectionHorizontalFormTypeItemIndexPaintable = ItemIndexPaintable.getInstance()
    self.backgroundColor = require("allbinary_java").number_value(BasicColorFactory.getInstance().TRANSPARENT_GREY, "intValue")
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


function MultipleScrollSelectionHorizontalForm._jinit(self, title, items, formPaintableFactory, border, backgroundBasicColor, foregroundBasicColor)
    java_super_init(ScrollSelectionForm, self, title, items, formPaintableFactory, border, 3, backgroundBasicColor, foregroundBasicColor)
    MultipleScrollSelectionHorizontalForm._init_fields(self)
        -- super(...) made self above
        if J2MEUtil.isJ2ME() or J2MEUtil.isHTML() then
        else
            self.rectPaintable = MultipleScrollSelectionFormRectPaintable.new(self)
        end
    return self
end

function MultipleScrollSelectionHorizontalForm.new(...)
    local self = setmetatable({}, MultipleScrollSelectionHorizontalForm)
    MultipleScrollSelectionHorizontalForm._jinit(self, ...)
    return self
end


function MultipleScrollSelectionHorizontalForm:fillRect(graphics)
        graphics:setColor(self.backgroundColor)
        graphics:fillRect(self.x, self.y, self.rectangle:getWidth(), self.rectangle:getHeight())
end
java_overload(MultipleScrollSelectionHorizontalForm, "fillRect", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


-- throws Exception
function MultipleScrollSelectionHorizontalForm:init(rectangle, formType)
        java_super(ScrollSelectionForm, "init", 2)(self, rectangle, formType)
        local formTypeFactory = FormTypeFactory.getInstance()
        if rawequal(formType, formTypeFactory.HORIZONTAL_FORM) then
            self.multipleScrollSelectionHorizontalFormTypeItemIndexPaintable = MultipleScrollSelectionFormHorizontalPaintable.new(self)
        elseif rawequal(formType, formTypeFactory.VERTICAL_CENTER_FORM) then
            self.multipleScrollSelectionHorizontalFormTypeItemIndexPaintable = MultipleScrollSelectionFormVerticalPaintable.new(self)
        elseif rawequal(formType, formTypeFactory.NULL_FORM_TYPE) then
        else
            error(require("java.lang.Exception").new(formTypeFactory.UNK), 0)
        end
end
java_overload(MultipleScrollSelectionHorizontalForm, "init", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "Rectangle")) and (java_a2 == nil or java_is(java_a2, "FormType")) end)


function MultipleScrollSelectionHorizontalForm:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.fontHeight = font:getHeight()
        self.myFontProcessor = MyFontProcessor.getInstance()
end
java_overload(MultipleScrollSelectionHorizontalForm, "updateMeasurement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


-- throws Exception
function MultipleScrollSelectionHorizontalForm:paintHorizontal(graphics, index, item, dx, dy)
        local dx2 = self:paintItem(graphics, index, item, dx, dy) + self.border
        self.paintable:paint(graphics, index, dx, dy)
        dx = dx2
        return dx
end
java_overload(MultipleScrollSelectionHorizontalForm, "paintHorizontal", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and (java_a3 == nil or java_is(java_a3, "ABCustomItem")) and type(java_a4) == "number" and type(java_a5) == "number" end)


-- throws Exception
function MultipleScrollSelectionHorizontalForm:paintVertical(graphics, index, item, dx, dy)
        self:paintItem(graphics, index, item, dx, dy)
        self.paintable:paint(graphics, index, dx, dy)
        return dx
end
java_overload(MultipleScrollSelectionHorizontalForm, "paintVertical", 5, function(java_a1, java_a2, java_a3, java_a4, java_a5) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) and type(java_a2) == "number" and (java_a3 == nil or java_is(java_a3, "ABCustomItem")) and type(java_a4) == "number" and type(java_a5) == "number" end)


function MultipleScrollSelectionHorizontalForm:getStartIndex()
        return self:getSelectedIndex()
end
java_overload(MultipleScrollSelectionHorizontalForm, "getStartIndex", 0)


function MultipleScrollSelectionHorizontalForm:paint(graphics)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.put(self.commonStrings.EXCEPTION, self, self.canvasStrings.PAINT)
        end
end
java_overload(MultipleScrollSelectionHorizontalForm, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)

return MultipleScrollSelectionHorizontalForm

