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
-- package org.allbinary.game.displayable.canvas

local DemoLimitedCommandTextItemArrayFactory = {}
package.loaded["org.allbinary.game.displayable.canvas.DemoLimitedCommandTextItemArrayFactory"] = DemoLimitedCommandTextItemArrayFactory

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

local CommandTextItemArrayFactory = java_lazy("org.allbinary.graphics.form.item.CommandTextItemArrayFactory")
local LimitCommandsVisitor = java_lazy("org.allbinary.graphics.form.item.LimitCommandsVisitor")

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

-- class table DemoLimitedCommandTextItemArrayFactory is declared before the requires
DemoLimitedCommandTextItemArrayFactory.__index = DemoLimitedCommandTextItemArrayFactory
DemoLimitedCommandTextItemArrayFactory.className = "DemoLimitedCommandTextItemArrayFactory"
DemoLimitedCommandTextItemArrayFactory.javaClassName = "org.allbinary.game.displayable.canvas.DemoLimitedCommandTextItemArrayFactory"

function DemoLimitedCommandTextItemArrayFactory:_init_fields()
    self.commandTextItemArrayFactory = CommandTextItemArrayFactory.new(LimitCommandsVisitor.new())
end

function DemoLimitedCommandTextItemArrayFactory._jinit(self)
    DemoLimitedCommandTextItemArrayFactory._init_fields(self)
    return self
end

function DemoLimitedCommandTextItemArrayFactory.new()
    return DemoLimitedCommandTextItemArrayFactory._jinit(setmetatable({}, DemoLimitedCommandTextItemArrayFactory))
end


function DemoLimitedCommandTextItemArrayFactory.getInstance()
        return DemoLimitedCommandTextItemArrayFactory.instance_f
end


function DemoLimitedCommandTextItemArrayFactory:getCommandTextItemArrayFactory()
        return self.commandTextItemArrayFactory
end

DemoLimitedCommandTextItemArrayFactory.instance_f = DemoLimitedCommandTextItemArrayFactory.new()

return DemoLimitedCommandTextItemArrayFactory

