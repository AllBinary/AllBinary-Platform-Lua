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
-- package org.allbinary.input.motion.button

local TouchButtonLocationHelper = {}
package.loaded["org.allbinary.input.motion.button.TouchButtonLocationHelper"] = TouchButtonLocationHelper

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

local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonButtons = java_lazy("org.allbinary.input.motion.button.CommonButtons")

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

-- class table TouchButtonLocationHelper is declared before the requires
TouchButtonLocationHelper.__index = TouchButtonLocationHelper
TouchButtonLocationHelper.className = "TouchButtonLocationHelper"
TouchButtonLocationHelper.javaClassName = "org.allbinary.input.motion.button.TouchButtonLocationHelper"

function TouchButtonLocationHelper:_init_fields()
    if self.totalColumns == nil then self.totalColumns = 0 end
    if self.totalRows == nil then self.totalRows = 0 end
    if self.columnsRemainder == nil then self.columnsRemainder = 0 end
    if self.rowsRemainder == nil then self.rowsRemainder = 0 end
    if self.columnsRemainderHalf == nil then self.columnsRemainderHalf = 0 end
    if self.rowsRemainderHalf == nil then self.rowsRemainderHalf = 0 end
end


function TouchButtonLocationHelper._jinit(self)
    TouchButtonLocationHelper._init_fields(self)
        local buttonSize = CommonButtons.getInstance().STANDARD_BUTTON_SIZE
        local displayInfo = DisplayInfoSingleton.getInstance()
        self.totalColumns = math.floor((displayInfo:getLastWidth() + 0.0) / (buttonSize + 0.0) + 0.5)
        self.totalRows = math.floor((displayInfo:getLastHeight() + 0.0) / (buttonSize + 0.0) + 0.5)
        self.columnsRemainder = displayInfo:getLastWidth() % buttonSize
        self.columnsRemainderHalf = (((self.columnsRemainder) // (1 << (1))))
        self.rowsRemainder = displayInfo:getLastHeight() % buttonSize
        self.rowsRemainderHalf = (((self.rowsRemainder) // (1 << (1))))
    return self
end

function TouchButtonLocationHelper.new(...)
    local self = setmetatable({}, TouchButtonLocationHelper)
    TouchButtonLocationHelper._jinit(self, ...)
    return self
end


function TouchButtonLocationHelper:getTotalColumns()
        return self.totalColumns
end


function TouchButtonLocationHelper:getTotalRows()
        return self.totalRows
end


function TouchButtonLocationHelper:getColumnsRemainder()
        return self.columnsRemainder
end


function TouchButtonLocationHelper:getRowsRemainder()
        return self.rowsRemainder
end


function TouchButtonLocationHelper:getColumnsRemainderHalf()
        return self.columnsRemainderHalf
end


function TouchButtonLocationHelper:getRowsRemainderHalf()
        return self.rowsRemainderHalf
end


function TouchButtonLocationHelper:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("totalColumns: ")
        stringBuffer:appendint(self.totalColumns)
        stringBuffer:append(" totalRows: ")
        stringBuffer:appendint(self.totalRows)
        stringBuffer:append(" columnsRemainder: ")
        stringBuffer:appendint(self.columnsRemainder)
        stringBuffer:append(" rowsRemainder: ")
        stringBuffer:appendint(self.rowsRemainder)
        stringBuffer:append(" columnsRemainderHalf: ")
        stringBuffer:appendint(self.columnsRemainderHalf)
        stringBuffer:append(" rowsRemainderHalf: ")
        stringBuffer:appendint(self.rowsRemainderHalf)
        return tostring(stringBuffer)
end
TouchButtonLocationHelper.__tostring = function(self) return self:toString() end

return TouchButtonLocationHelper

