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
-- package org.allbinary.graphics.j2me.workarea.tools

local MouseStrings = {}
package.loaded["org.allbinary.graphics.j2me.workarea.tools.MouseStrings"] = MouseStrings

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

local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")

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

-- class table MouseStrings is declared before the requires
MouseStrings.__index = MouseStrings
MouseStrings.className = "MouseStrings"
MouseStrings.javaClassName = "org.allbinary.graphics.j2me.workarea.tools.MouseStrings"

function MouseStrings:_init_fields()
    self.MOUSE_PRESSED = "mousePressed"
    self.MOUSE_RELEASED = "mouseReleased"
    self.MOUSE_CLICKED = "mouseClicked"
    self.MOUSE_DRAGGED = "mouseDragged"
    self.MOUSE_MOVED = "mouseMoved"
    self.MOUSE_PRESSED_LABEL = require("allbinary_java").to_string("MousePressed") .. require("allbinary_java").to_string(CommonSeps.getInstance().COLON_SEP)
    self.MOUSE_RELEASED_LABEL = require("allbinary_java").to_string("MouseReleased") .. require("allbinary_java").to_string(CommonSeps.getInstance().COLON_SEP)
    self.MOUSE_CLICKED_LABEL = require("allbinary_java").to_string("MouseClicked") .. require("allbinary_java").to_string(CommonSeps.getInstance().COLON_SEP)
    self.MOUSE_DRAGGED_LABEL = require("allbinary_java").to_string("MouseDragged") .. require("allbinary_java").to_string(CommonSeps.getInstance().COLON_SEP)
    self.MOUSE_MOVED_LABEL = require("allbinary_java").to_string("MouseMoved") .. require("allbinary_java").to_string(CommonSeps.getInstance().COLON_SEP)
end

function MouseStrings._jinit(self)
    MouseStrings._init_fields(self)
    return self
end

function MouseStrings.new()
    return MouseStrings._jinit(setmetatable({}, MouseStrings))
end


function MouseStrings.getInstance()
        return MouseStrings.instance_f
end

MouseStrings.instance_f = MouseStrings.new()

return MouseStrings

