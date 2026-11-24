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

local CommandCurrentSelectionFormFactory = {}
package.loaded["org.allbinary.graphics.form.CommandCurrentSelectionFormFactory"] = CommandCurrentSelectionFormFactory

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

local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local TouchFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.TouchFeatureFactory")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local ABCustomItem = java_lazy("org.allbinary.graphics.form.item.ABCustomItem")
local CommandCurrentSelectionForm = java_lazy("org.allbinary.graphics.form.CommandCurrentSelectionForm")
local FormType = java_lazy("org.allbinary.graphics.form.FormType")
local ScrollSelectionForm = java_lazy("org.allbinary.graphics.form.ScrollSelectionForm")
local ScrollSelectionFormNoneFactory = java_lazy("org.allbinary.graphics.form.ScrollSelectionFormNoneFactory")

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

-- class table CommandCurrentSelectionFormFactory is declared before the requires
CommandCurrentSelectionFormFactory.__index = CommandCurrentSelectionFormFactory
CommandCurrentSelectionFormFactory.className = "CommandCurrentSelectionFormFactory"
CommandCurrentSelectionFormFactory.javaClassName = "org.allbinary.graphics.form.CommandCurrentSelectionFormFactory"

function CommandCurrentSelectionFormFactory._jinit(self)
    return self
end

function CommandCurrentSelectionFormFactory.new()
    return CommandCurrentSelectionFormFactory._jinit(setmetatable({}, CommandCurrentSelectionFormFactory))
end


-- throws Exception
function CommandCurrentSelectionFormFactory.getInstance(title, items, rectangle, formType, border, moveForSmallScreen, backgroundBasicColor, foregroundBasicColor)
        if Features.getInstance():isFeature(TouchFeatureFactory.getInstance().TOUCH_ENABLED) then
            local scrollSelectionForm = CommandCurrentSelectionForm.new(title, items, border, moveForSmallScreen, backgroundBasicColor, foregroundBasicColor)
            scrollSelectionForm:init(rectangle, formType)
            return scrollSelectionForm
        else
            return ScrollSelectionFormNoneFactory.getInstance()
        end
end

return CommandCurrentSelectionFormFactory

