-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form.item

local ABCustomItem = {}
package.loaded["org.allbinary.graphics.form.item.ABCustomItem"] = ABCustomItem

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
local Screen = java_lazy("javax.microedition.lcdui.Screen")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")

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

-- class table ABCustomItem is declared before the requires
ABCustomItem.__index = ABCustomItem
ABCustomItem.className = "ABCustomItem"
ABCustomItem.javaClassName = "org.allbinary.graphics.form.item.ABCustomItem"


function ABCustomItem.getNullInstance()
        if rawequal(ABCustomItem.NULL_CUSTOM_ITEM, NullUtil.getInstance().NULL_OBJECT) then
            ABCustomItem.NULL_CUSTOM_ITEM = ABCustomItem.new(StringUtil.getInstance().EMPTY_STRING, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE)
        end
        return ABCustomItem.NULL_CUSTOM_ITEM
end


function ABCustomItem._jinit(self, label, backgroundBasicColor, foregroundBasicColor)
    return self
end

function ABCustomItem.new(...)
    local self = setmetatable({}, ABCustomItem)
    ABCustomItem._jinit(self, ...)
    return self
end


function ABCustomItem:setOwner(owner)
end


function ABCustomItem:paintXY(graphics, x, y)
end


function ABCustomItem:paintUnselected(graphics, x, y)
end


function ABCustomItem:isFocusable()
        return false
end


function ABCustomItem:getLabel()
        return StringUtil.getInstance().EMPTY_STRING
end


function ABCustomItem:setLabel(label)
end


function ABCustomItem:getHeight()
        return 0
end


function ABCustomItem:setHeight(height)
end


function ABCustomItem:getValue()
        return 0.0
end


function ABCustomItem:setValue(value)
end


function ABCustomItem:getMinimumWidth()
        return 0
end


function ABCustomItem:getMinimumHeight()
        return 0
end


function ABCustomItem:preMeasurement(graphics)
end

ABCustomItem.NULL_CUSTOM_ITEM = NullUtil.getInstance().NULL_OBJECT

return ABCustomItem

