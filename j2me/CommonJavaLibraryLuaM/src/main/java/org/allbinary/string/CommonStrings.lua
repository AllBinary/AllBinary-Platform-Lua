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

local CommonStrings = {}
package.loaded["org.allbinary.string.CommonStrings"] = CommonStrings

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

-- class table CommonStrings is declared before the requires
CommonStrings.__index = CommonStrings
CommonStrings.className = "CommonStrings"
CommonStrings.javaClassName = "org.allbinary.string.CommonStrings"

function CommonStrings:_init_fields()
    self.EMPTY = "Empty"
    self.CREATE_IMAGE = "createImage"
    self.PLEASE_WAIT = "Please Wait"
    self.PLEASE_WAIT_FOR_SERVER = "Please Wait Getting Data From Server..."
    self.PERIODS = "..."
    self.LOADING = "Loading..."
    self.CONSTRUCTOR = "Constructor"
    self.START = "Start"
    self.END = "End"
    self.EXCEPTION = "Exception"
    self.EXCEPTION_LABEL = "Exception: "
    self.CLEANUP = "cleanup"
    self.INIT = "init"
    self.CLOSE = "close"
    self.UP = "up"
    self.DOWN = "down"
    self.LEFT = "left"
    self.RIGHT = "right"
    self.DIRECTION_NAME = {self.DOWN, self.LEFT, self.RIGHT, self.UP}
    self.CREATE = "Create"
    self.REMOVE = "Remove"
    self.UPDATE = "Update"
    self.DELETE = "Delete"
    self.delete = "delete"
    self.LOAD = "load"
    self.SAVE = "save"
    self.ADD = "Add"
    self.DROP = "Drop"
    self.INSERT = "Insert"
    self.VISIT = "visit"
    self.START_METHOD_NAME = self.START
    self.END_METHOD_NAME = "end"
    self.GET = "get"
    self.PROCESS = "process"
    self.GET_INSTANCE = "getInstance"
    self.GET_LIST = "getList"
    self.RUN = "run"
    self.START_RUNNABLE = "Start Runnable"
    self.RUNNING = "Running"
    self.END_RUNNABLE = "End Runnable"
    self.DISABLE = "disable"
    self.ENABLE = "enable"
    self.SUCCESS = "Command Success"
    self.FAILURE = "Command Failed"
    self.NOT_IMPLEMENTED = "Not Implemented"
    self.UNKNOWN = "Unknown"
    self.ON_EVENT = "onEvent"
    self.IS_VALID = "isValid"
    self.TOSTRING = "toString"
    self.ADD_LISTENER = "addListener"
    self.REMOVE_LISTENER = "removeListener"
    self.SIZE = "size"
end

function CommonStrings._jinit(self)
    CommonStrings._init_fields(self)
    return self
end

function CommonStrings.new()
    return CommonStrings._jinit(setmetatable({}, CommonStrings))
end


function CommonStrings.getInstance()
        return CommonStrings.instance_f
end

CommonStrings.instance_f = CommonStrings.new()

return CommonStrings

