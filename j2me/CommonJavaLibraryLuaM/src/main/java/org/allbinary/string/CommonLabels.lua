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
-- package org.allbinary.string

local CommonLabels = {}
package.loaded["org.allbinary.string.CommonLabels"] = CommonLabels

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

local JsType = java_lazy("jsinterop.annotations.JsType")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local JsProperty = java_lazy("jsinterop.annotations.JsProperty")

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

-- class table CommonLabels is declared before the requires
CommonLabels.__index = CommonLabels
CommonLabels.className = "CommonLabels"
CommonLabels.javaClassName = "org.allbinary.string.CommonLabels"

function CommonLabels:_init_fields()
    self.WIDTH_LABEL = " Width: "
    self.HEIGHT_LABEL = " Height: "
    self.END_LABEL = "End: "
    self.TOTAL_LABEL = "Total: "
    self.INDEX_LABEL = "index: "
    self.START_LABEL = "Start: "
    self.COMMAND_LABEL = "Command: "
    self.NAME_LABEL = "Name: "
    self.START = self.START_LABEL
    self.ELAPSED = " Elapsed: "
    self.CURRENT = " Current: "
    self.NEXT = "Next"
    self.ITEM_LABEL = "Item: "
    self.RESULT_ = "Result: "
    self.COLON_SEP = ": "
end

function CommonLabels._jinit(self)
    CommonLabels._init_fields(self)
    return self
end

function CommonLabels.new()
    return CommonLabels._jinit(setmetatable({}, CommonLabels))
end


function CommonLabels.getInstance()
        return CommonLabels.instance_f
end

CommonLabels.instance_f = CommonLabels.new()

return CommonLabels

